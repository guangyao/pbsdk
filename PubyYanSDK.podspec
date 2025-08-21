Pod::Spec.new do |s|
  s.name             = 'PubyYanSDK'
  s.version          = '0.0.1'
  s.summary          = 'Pubeasy 广告聚合 SDK（Binary 分发）'
  s.description      = <<-DESC
    以 .xcframework 二进制形式分发的 Pubeasy 广告聚合 SDK，
    内含 PubeasySDK.xcframework 与 TradPlus 依赖及资源。
  DESC
  s.homepage         = 'https://github.com/guangyao/pbsdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'yanguangyao' => '976660988@qq.com' }

  s.platform         = :ios, '12.0'

  # 使用 GitHub Releases 分发（推荐方式）
  s.source           = { :http => 'https://github.com/guangyao/pbsdk/releases/download/v0.0.1/PubYanSDK_0.0.1.zip' }

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
