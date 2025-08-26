//
//  ViewController.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/16.
//

#import <UIKit/UIKit.h>
#import <PubeasySDK/PubeasySDK.h>

@interface ViewController : UIViewController <PubeasyAdBannerDelegate, PubeasyAdInterstitialDelegate, PubeasyAdRewardedDelegate, PubeasyAdNativeDelegate, PubeasyAdSplashDelegate>

@property (nonatomic, strong) PubeasyAdBanner *bannerAd;
@property (nonatomic, strong) PubeasyAdInterstitial *interstitialAd;
@property (nonatomic, strong) PubeasyAdRewarded *rewardedAd;
@property (nonatomic, strong) PubeasyAdNative *nativeAd;
@property (nonatomic, strong) PubeasyAdSplash *splashAd;

@end

