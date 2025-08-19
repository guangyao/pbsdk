Pod::Spec.new do |s|
  s.name             = 'PubeasySDK'
  s.version          = '0.3.8'
  s.summary          = 'Pubeasy 广告聚合 SDK（Binary 分发）'
  s.description      = <<-DESC
    以 .xcframework 二进制形式分发的 Pubeasy 广告聚合 SDK，
    内含 PubeasySDK.xcframework 与 TradPlus 依赖及资源。
  DESC
  s.homepage         = 'https://git.pubeasy.io/adx/pubeasysdk-ios.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yangzj' => '86985379@qq.com' }

  s.platform         = :ios, '12.0'

  # 发布到外网时请替换为你们 CDN 的直链地址（与 zip 内目录结构保持一致）
  s.source           = { :http => 'https://REPLACE_WITH_YOUR_CDN/PubeasySDK_0.3.8.zip' }

  s.static_framework = true
  s.requires_arc     = true

  # 二进制产物（相对 zip 解压根目录；本地 :path 使用时相对 podspec 目录）
  s.vendored_frameworks = [
    'PubeasySDK.xcframework',
    'TradPlusFrameworks/TradPlusAds/TradPlusAds.framework',
    'TradPlusFrameworks/TradPlusAds/TPExchange.framework',
    'TradPlusFrameworks/TPCross/TPCrossAdapter.framework'
  ]

  # 资源与隐私清单
  s.resources = [
    'TradPlusFrameworks/TradPlusAds/TradPlusAds.bundle',
    'Assets/PrivacyInfo.xcprivacy'
  ]

  s.frameworks = ['UIKit', 'Foundation', 'AdSupport', 'CoreTelephony']
  s.libraries  = ['z', 'sqlite3', 'c++']

  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'OTHER_LDFLAGS'  => '-ObjC -all_load'
  }

  s.user_target_xcconfig = {
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }

  # 二进制分发不需要源码编译
  s.source_files = []
end
