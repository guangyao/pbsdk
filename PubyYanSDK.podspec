Pod::Spec.new do |s|
  s.name             = 'PubyYanSDK'
  s.version          = '0.0.5'
  s.summary          = 'Pubeasy Ad Aggregation SDK - Binary Distribution'
  s.description      = <<-DESC
                       Pubeasy Ad Aggregation SDK distributed in xcframework binary format.
                       Includes PubyYanSDK xcframework and TradPlus dependencies and resources.
                       Supports banner, interstitial, native, rewarded, and splash ads.
                       DESC
  s.homepage         = 'https://github.com/guangyao/pbsdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'PubyYanSDK Team' => '976660988@qq.com', 'yanguangyao' => '976660988@qq.com' }

  s.platform         = :ios, '12.0'

  # Use raw GitHub repository file URL for immediate availability after push
  s.source           = { :http => 'https://raw.githubusercontent.com/guangyao/pbsdk/main/releases/v0.0.5/PubYanSDK_0.0.5.zip' }

  s.static_framework = true
  s.requires_arc     = true


    # Source files for compilation (including both Public and Private)
  s.source_files = 'PubeasySDK/Classes/**/*.{h,m}'
  # Expose umbrella header and public headers
  s.public_header_files = [
    'PubeasySDK/PubeasySDK.h',
    'PubeasySDK/Classes/Public/**/*.h'
  ]
  
  # Main umbrella header
  s.header_mappings_dir = 'PubeasySDK'

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
end
