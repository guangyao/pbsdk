Pod::Spec.new do |s|
  s.name             = 'PubyYanSDK'
  s.version          = '0.1.2'
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

  # Use GitHub Release download URL for stable access
  s.source           = { :http => 'https://github.com/guangyao/pbsdk/releases/download/v0.1.2/PubYanSDK_0.1.2.zip' }
  s.static_framework = true
  s.requires_arc     = true


    # Binary distribution - no source files needed
  # s.source_files = 'PubeasySDK/Classes/**/*.{h,m}'
  # s.public_header_files = [
  #   'PubeasySDK/PubeasySDK.h',
  #   'PubeasySDK/Classes/Public/**/*.h'
  # ]
  # s.header_mappings_dir = 'PubeasySDK'

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

  # XCFramework方式配置 - 适配TradPlusAds架构限制
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'OTHER_LDFLAGS' => '-ObjC -all_load',
    'VALID_ARCHS' => 'arm64',  # TradPlusAds只支持arm64
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64',  # M1芯片兼容
    'PROJECT_TYPE_IS_WORKSPACE' => 'YES',
    'ALWAYS_SEARCH_USER_PATHS' => 'YES',
    'USE_HEADERMAP' => 'NO'  # 禁用自动头文件映射
  }

  s.user_target_xcconfig = {
    'VALID_ARCHS' => 'arm64',  # 用户目标也限制为arm64
    'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64'
  }
end
