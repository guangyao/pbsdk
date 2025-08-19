//
//  PubeasyInterAD.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/17.
//

#import "PubeasyInterAD.h"
#import <TradPlusAds/TradPlusAdInterstitial.h>
#import "../Public/Interstitial/PubeasyAdInterstitial.h"

@interface PubeasyInterAD ()<TradPlusADInterstitialDelegate>

@property (nonatomic, strong) TradPlusAdInterstitial *tvyvyAd;

@end

@implementation PubeasyInterAD

- (NSDictionary *)vbnm456CustomAdInfo {
    return [self.tvyvyAd customAdInfo];
}
- (void)setVbnm456CustomAdInfo:(NSDictionary *)vbnm456CustomAdInfo {
    [self.tvyvyAd setCustomAdInfo:vbnm456CustomAdInfo];
}

- (BOOL)zxcv345IsAdReady {
    return [self.tvyvyAd isAdReady];
}
- (NSString *)asdf890UnitID {
    return [self.tvyvyAd unitID];
}

- (NSDictionary *)ghjk123LocalParams {
    return [self.tvyvyAd localParams];
}
- (void)setGhjk123LocalParams:(NSDictionary *)ghjk123LocalParams {
    [self.tvyvyAd setLocalParams:ghjk123LocalParams];
}


- (TradPlusAdInterstitial *)tvyvyAd {
    if (!_tvyvyAd) {
        _tvyvyAd = [[TradPlusAdInterstitial alloc] init];
        _tvyvyAd.delegate = self;
    }
    return _tvyvyAd;
}

- (void)ytrt567SetAdUnit:(NSString *)adUnitID {
    [self.tvyvyAd setAdUnitID:adUnitID];
}

- (nullable NSDictionary *)mnbv987GetReadyAdInfo {
    return [self.tvyvyAd getReadyAdInfo];
}

- (nullable NSDictionary *)ghjk345GetCurrentAdInfo {
    return [self.tvyvyAd getCurrentAdInfo];
}

- (nullable id)fghj456GetInterstitialAd {
    return [self.tvyvyAd getInterstitialAd];
}

- (void)cvbn789LoadAd {
    self.tvyvyAd.delegate = self;
    [self.tvyvyAd loadAd];
}

- (void)zxcv123LoadAdWithMaxWait:(NSTimeInterval)maxWaitTime {
    [self.tvyvyAd loadAdWithMaxWaitTime:maxWaitTime];
}

- (void)asdf234ShowAdWithScene:(nullable NSString *)sceneId {
    [self.tvyvyAd showAdWithSceneId:sceneId];
}

- (void)qwer456ShowAdFromRoot:(nullable UIViewController *)rootViewController scene:(nullable NSString *)sceneId {
    [self.tvyvyAd showAdFromRootViewController:rootViewController sceneId:sceneId];
}

- (void)zxcv567ShowWithInterstitial:(TradPlusAdInterstitialObject *)interstitialObject scene:(nullable NSString *)sceneId {
    [self.tvyvyAd showWithInterstitialObject:interstitialObject sceneId:sceneId];
}

- (void)asdf678ShowWithInterstitial:(TradPlusAdInterstitialObject *)interstitialObject root:(nullable UIViewController *)rootViewController scene:(nullable NSString *)sceneId {
    [self.tvyvyAd showWithInterstitialObject:interstitialObject rootViewController:rootViewController sceneId:sceneId];
}

- (nullable TradPlusAdInterstitialObject *)ghjk789GetReadyInterstitial {
    return [self.tvyvyAd getReadyInterstitialObject];
}

- (void)qwer789EnterAdScene:(nullable NSString *)sceneId {
    [self.tvyvyAd entryAdScenario:sceneId];
}

- (void)mnbv123OpenAutoLoadCallback {
    [self.tvyvyAd openAutoLoadCallback];
}


//==========================delegate=============================//
- (void)tpInterstitialAdClicked:(nonnull NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdClicked:)]) {
        [self.pubDelegate pubeasyInterstitialAdClicked:adInfo];
    }
}

- (void)tpInterstitialAdDismissed:(nonnull NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdDismissed:)]) {
        [self.pubDelegate pubeasyInterstitialAdDismissed:adInfo];
    }
}

- (void)tpInterstitialAdImpression:(nonnull NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdImpression:)]) {
        [self.pubDelegate pubeasyInterstitialAdImpression:adInfo];
    }
}

- (void)tpInterstitialAdLoaded:(nonnull NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdLoaded:)]) {
        [self.pubDelegate pubeasyInterstitialAdLoaded:adInfo];
    }
}

- (void)tpInterstitialAdShow:(nonnull NSDictionary *)adInfo didFailWithError:(nonnull NSError *)error {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdShow:didFailWithError:)]) {
        [self.pubDelegate pubeasyInterstitialAdShow:adInfo didFailWithError:error];
    }
}

///AD加载失败
- (void)tpInterstitialAdLoadFailWithError:(NSError *)error adInfo:(NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdLoadFailWithError:adInfo:)]) {
        [self.pubDelegate pubeasyInterstitialAdLoadFailWithError:error adInfo:adInfo];
    }
}

/// 开始加载流程
- (void)tpInterstitialAdStartLoad:(NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdStartLoad:)]) {
        [self.pubDelegate pubeasyInterstitialAdStartLoad:adInfo];
    }
}

///当每个广告源开始加载时会都会回调一次。
- (void)tpInterstitialAdOneLayerStartLoad:(NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdOneLayerStartLoad:)]) {
        [self.pubDelegate pubeasyInterstitialAdOneLayerStartLoad:adInfo];
    }
}

///调用load之后如果收到此回调，说明广告位仍处于加载状态，无法触发新的一轮广告加载。
- (void)tpInterstitialAdIsLoading:(NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdIsLoading:)]) {
        [self.pubDelegate pubeasyInterstitialAdIsLoading:adInfo];
    }
}

///bidding开始
- (void)tpInterstitialAdBidStart:(NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdBidStart:)]) {
        [self.pubDelegate pubeasyInterstitialAdBidStart:adInfo];
    }
}

///bidding结束 error = nil 表示成功
- (void)tpInterstitialAdBidEnd:(NSDictionary *)adInfo error:(nullable NSError *)error {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdBidEnd:error:)]) {
        [self.pubDelegate pubeasyInterstitialAdBidEnd:adInfo error:error];
    }
}

///当每个广告源加载成功后会都会回调一次。
- (void)tpInterstitialAdOneLayerLoaded:(NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdOneLayerLoaded:)]) {
        [self.pubDelegate pubeasyInterstitialAdOneLayerLoaded:adInfo];
    }
}

///当每个广告源加载失败后会都会回调一次，返回三方源的错误信息
- (void)tpInterstitialAdOneLayerLoad:(NSDictionary *)adInfo didFailWithError:(NSError *)error {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdOneLayerLoad:didFailWithError:)]) {
        [self.pubDelegate pubeasyInterstitialAdOneLayerLoad:adInfo didFailWithError:error];
    }
}

///加载流程全部结束
- (void)tpInterstitialAdAllLoaded:(BOOL)success adInfo:(NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdAllLoaded:adInfo:)]) {
        [self.pubDelegate pubeasyInterstitialAdAllLoaded:success adInfo:adInfo];
    }
}

///开始播放
- (void)tpInterstitialAdPlayStart:(NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdPlayStart:)]) {
        [self.pubDelegate pubeasyInterstitialAdPlayStart:adInfo];
    }
}

///播放结束
- (void)tpInterstitialAdPlayEnd:(NSDictionary *)adInfo {
    if (self.pubDelegate && [self.pubDelegate respondsToSelector:@selector(pubeasyInterstitialAdPlayEnd:)]) {
        [self.pubDelegate pubeasyInterstitialAdPlayEnd:adInfo];
    }
}

@end
