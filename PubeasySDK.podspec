Pod::Spec.new do |s|
  s.name             = 'PubeasySDK'
  s.version          = '1.0.0'
  s.summary          = 'Pubeasy Ad Aggregation SDK - Binary Distribution'
  s.description      = <<-DESC
                       Pubeasy Ad Aggregation SDK distributed in xcframework binary format.
                       Includes PubeasySDK xcframework and TradPlus dependencies and resources.
                       Supports banner, interstitial, native, rewarded, and splash ads.
                       DESC
  s.homepage         = 'https://github.com/guangyao/pbsdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PubeasySDK Team' => '976660988@qq.com', 'yanguangyao' => '976660988@qq.com' }

  s.platform         = :ios, '12.0'

  # Use GitHub Releases distribution (recommended)
  s.source           = { :http => 'https://github.com/guangyao/pbsdk/releases/download/v1.0.0/PubeasySDK_1.0.0.zip' }

  s.static_framework = true
  s.requires_arc     = true

  # Binary products (relative to zip root directory; relative to podspec directory when using local :path)
  s.vendored_frameworks = [
    'PubeasySDK.xcframework',
    'TradPlusFrameworks/TradPlusAds/TradPlusAds.framework',
    'TradPlusFrameworks/TradPlusAds/TPExchange.framework',
    'TradPlusFrameworks/TPCross/TPCrossAdapter.framework'
  ]

  # Resources and privacy manifest
  s.resources = [
    'TradPlusFrameworks/TradPlusAds/TradPlusAds.bundle',
    'TradPlusFrameworks/TradPlusAds/TradPlusADX.bundle',
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

  # Binary distribution does not require source code compilation
  s.source_files = []
end
