#!/usr/bin/env bash
set -euo pipefail
set -x

# 配置
ROOT_DIR="$(cd "$(dirname "$0")"/.. && pwd)"
SDK_NAME="PubeasySDK"
VERSION="0.0.4"
BUILD_DIR="$ROOT_DIR/build"
PRODUCTS_DIR="$BUILD_DIR/products"
INTERMEDIATE_DIR="$BUILD_DIR/intermediates"
XCFRAMEWORK_OUTPUT="$PRODUCTS_DIR/${SDK_NAME}.xcframework"
ZIP_OUTPUT="$PRODUCTS_DIR/PubYanSDK_${VERSION}.zip"

IOS_MIN_VERSION="12.0"

FRAMEWORKS_DIR="$ROOT_DIR/TradPlusFrameworks/TradPlusAds"

echo "[1/7] 清理输出目录"
rm -rf "$BUILD_DIR"
mkdir -p "$PRODUCTS_DIR" "$INTERMEDIATE_DIR/iphoneos" "$INTERMEDIATE_DIR/iphonesimulator/arm64" "$INTERMEDIATE_DIR/iphonesimulator/x86_64"

echo "[2/7] 准备公开头文件与 modulemap"
INCLUDE_DIR="$INTERMEDIATE_DIR/include"
mkdir -p "$INCLUDE_DIR/Classes"

# 拷贝公开头文件到 include/Classes/Public/...
rsync -a --include '*/' --include '*.h' --exclude '*' \
  "$ROOT_DIR/PubeasySDK/Classes/Public/" "$INCLUDE_DIR/Classes/"

# 复制顶层 umbrella 头文件
cp "$ROOT_DIR/PubeasySDK/PubeasySDK.h" "$INCLUDE_DIR/"

# 生成 module.modulemap（Swift 友好）
cat >"$INCLUDE_DIR/module.modulemap" <<MMEOF
module ${SDK_NAME} {
  umbrella header "${SDK_NAME}.h"
  export *
  module * { export * }
}
MMEOF

echo "[3/7] 收集源码"
SRC_FILES=()
while IFS= read -r -d '' f; do
  SRC_FILES+=("$f")
done < <(find "$ROOT_DIR/PubeasySDK/Classes" -name '*.m' -print0)
if [ ${#SRC_FILES[@]} -eq 0 ]; then
  echo "未找到源码 .m 文件" >&2
  exit 1
fi

COMMON_CLANG_FLAGS=(
  -fobjc-arc
  -fmodules
  -fvisibility=hidden
  -fvisibility-inlines-hidden
  -Wall -Wextra -Werror=implicit-function-declaration
  -O2
  -isystem "$FRAMEWORKS_DIR/TradPlusAds.framework/Headers"
  -I "$ROOT_DIR/PubeasySDK/Classes"
  -I "$ROOT_DIR/PubeasySDK/Classes/Public"
)

echo "[4/7] 编译 iphoneos (arm64)"
IOS_SDK_PATH="$(xcrun --sdk iphoneos --show-sdk-path)"
for ARCH in arm64; do
  OUT_DIR="$INTERMEDIATE_DIR/iphoneos/$ARCH"
  mkdir -p "$OUT_DIR/obj"
  for SRC in "${SRC_FILES[@]}"; do
    OBJ="$OUT_DIR/obj/$(basename "${SRC%.m}")_${ARCH}.o"
    xcrun clang -arch "$ARCH" \
      -isysroot "$IOS_SDK_PATH" \
      -miphoneos-version-min="$IOS_MIN_VERSION" \
      "${COMMON_CLANG_FLAGS[@]}" \
      -F "$FRAMEWORKS_DIR" \
      -c "$SRC" -o "$OBJ"
  done
  xcrun libtool -static -o "$OUT_DIR/lib${SDK_NAME}.a" "$OUT_DIR/obj"/*.o
done

IOS_LIB="$INTERMEDIATE_DIR/iphoneos/arm64/lib${SDK_NAME}.a"

echo "[5/7] 编译 iphonesimulator (arm64, x86_64)"
SIM_SDK_PATH="$(xcrun --sdk iphonesimulator --show-sdk-path)"
for ARCH in arm64 x86_64; do
  OUT_DIR="$INTERMEDIATE_DIR/iphonesimulator/$ARCH"
  mkdir -p "$OUT_DIR/obj"
  for SRC in "${SRC_FILES[@]}"; do
    OBJ="$OUT_DIR/obj/$(basename "${SRC%.m}")_${ARCH}.o"
    xcrun clang -arch "$ARCH" \
      -isysroot "$SIM_SDK_PATH" \
      -mios-simulator-version-min="$IOS_MIN_VERSION" \
      "${COMMON_CLANG_FLAGS[@]}" \
      -F "$FRAMEWORKS_DIR" \
      -c "$SRC" -o "$OBJ"
  done
  xcrun libtool -static -o "$OUT_DIR/lib${SDK_NAME}.a" "$OUT_DIR/obj"/*.o
done

SIM_LIB_ARM64="$INTERMEDIATE_DIR/iphonesimulator/arm64/lib${SDK_NAME}.a"
SIM_LIB_X86_64="$INTERMEDIATE_DIR/iphonesimulator/x86_64/lib${SDK_NAME}.a"
SIM_LIB_UNI="$INTERMEDIATE_DIR/iphonesimulator/lib${SDK_NAME}.a"
mkdir -p "$(dirname "$SIM_LIB_UNI")"
if [ -f "$SIM_LIB_ARM64" ] && [ -f "$SIM_LIB_X86_64" ]; then
  xcrun lipo -create -output "$SIM_LIB_UNI" "$SIM_LIB_ARM64" "$SIM_LIB_X86_64"
elif [ -f "$SIM_LIB_ARM64" ]; then
  cp "$SIM_LIB_ARM64" "$SIM_LIB_UNI"
else
  cp "$SIM_LIB_X86_64" "$SIM_LIB_UNI"
fi

echo "[6/7] 生成 ${SDK_NAME}.xcframework"
rm -rf "$XCFRAMEWORK_OUTPUT"
mkdir -p "$PRODUCTS_DIR"
xcrun xcodebuild -create-xcframework \
  -library "$IOS_LIB" -headers "$INCLUDE_DIR" \
  -library "$SIM_LIB_UNI" -headers "$INCLUDE_DIR" \
  -output "$XCFRAMEWORK_OUTPUT"

echo "[7/7] 打包 Zip（含三方依赖与资源）"
STAGE_DIR="$INTERMEDIATE_DIR/stage"
rm -rf "$STAGE_DIR"
mkdir -p "$STAGE_DIR"

# 复制 xcframework
cp -R "$XCFRAMEWORK_OUTPUT" "$STAGE_DIR/"

# 复制三方依赖与资源，确保目录结构与 podspec 对齐
mkdir -p "$STAGE_DIR/TradPlusFrameworks/TradPlusAds"
mkdir -p "$STAGE_DIR/TradPlusFrameworks/TPCross"
cp -R "$ROOT_DIR/TradPlusFrameworks/TradPlusAds/TPExchange.framework" "$STAGE_DIR/TradPlusFrameworks/TradPlusAds/"
cp -R "$ROOT_DIR/TradPlusFrameworks/TradPlusAds/TradPlusAds.framework" "$STAGE_DIR/TradPlusFrameworks/TradPlusAds/"
cp -R "$ROOT_DIR/TradPlusFrameworks/TradPlusAds/TradPlusAds.bundle" "$STAGE_DIR/TradPlusFrameworks/TradPlusAds/"
cp -R "$ROOT_DIR/TradPlusFrameworks/TradPlusAds/TradPlusADX.bundle" "$STAGE_DIR/TradPlusFrameworks/TradPlusAds/"
cp -R "$ROOT_DIR/TradPlusFrameworks/TPCross/TPCrossAdapter.framework" "$STAGE_DIR/TradPlusFrameworks/TPCross/"

# 复制隐私文件
mkdir -p "$STAGE_DIR/Assets"
cp "$ROOT_DIR/Assets/PrivacyInfo.xcprivacy" "$STAGE_DIR/Assets/"

pushd "$STAGE_DIR" >/dev/null
zip -qry "$ZIP_OUTPUT" .
popd >/dev/null

echo "✅ 完成：$XCFRAMEWORK_OUTPUT"
echo "✅ 已打包：$ZIP_OUTPUT"

