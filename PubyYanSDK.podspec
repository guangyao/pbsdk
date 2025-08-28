Pod::Spec.new do |spec|
  spec.name             = 'PubyYanSDK'
  spec.version          = '0.1.2'
  spec.summary          = 'Pubeasy Ad Aggregation SDK - Binary Distribution'
  spec.description      = <<-DESC
                       Pubeasy Ad Aggregation SDK distributed in xcframework binary format.
                       Supports banner, interstitial, native, rewarded, and splash ads.
                       DESC
  spec.homepage         = 'https://github.com/guangyao/pbsdk'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'yangy' => '976660988@qq.com' }

  spec.platform         = :ios, '12.0'

  # Public binary distribution 
  spec.source           = { :http => 'https://raw.githubusercontent.com/guangyao/pbsdk/main/releases/v0.1.2/PubYanSDK_0.1.2.zip' }

  spec.static_framework = true
  spec.requires_arc     = true

  # Binary products (paths are relative to ZIP root)
  spec.vendored_frameworks = [
    'PubeasySDK.xcframework',
    'TradPlusFrameworks/TradPlusAds/TradPlusAds.framework',
    'TradPlusFrameworks/TradPlusAds/TPExchange.framework',
    'TradPlusFrameworks/TPCross/TPCrossAdapter.framework'
  ]

  # Resources and privacy manifest
  spec.resources = [
    'TradPlusFrameworks/TradPlusAds/TradPlusAds.bundle',
    'TradPlusFrameworks/TradPlusAds/TradPlusADX.bundle',
    'Assets/PrivacyInfo.xcprivacy'
  ]

  spec.frameworks = ['UIKit', 'Foundation', 'AdSupport', 'CoreTelephony']
  spec.libraries  = ['z', 'sqlite3', 'c++']

  # XCFramework配置
  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'OTHER_LDFLAGS'  => '-ObjC -all_load',
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'x86_64'  # 排除Intel模拟器架构
  }

spec.user_target_xcconfig = {
  'VALID_ARCHS' => 'arm64',  # 用户目标也限制为arm64
  'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'x86_64'  # 排除Intel模拟器架构
}
end
