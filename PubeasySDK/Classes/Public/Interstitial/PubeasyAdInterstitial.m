//
//  PubeasyAdInterstitial.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/17.
//

#import "PubeasyAdInterstitial.h"
//#import "PubeasyInterAD.h"
#import "../Private/PubeasyInterAD.h"

@interface PubeasyAdInterstitial ()

@property (nonatomic,strong) PubeasyInterAD *interAd;

@end

@implementation PubeasyAdInterstitial

- (NSDictionary *)customAdInfo {
   return [self.interAd vbnm456CustomAdInfo];
}
- (void)setCustomAdInfo:(NSDictionary *)customAdInfo {
   [self.interAd setVbnm456CustomAdInfo:customAdInfo];
}

- (BOOL)isAdReady {
   return self.interAd.zxcv345IsAdReady;
}
- (NSString *)unitID {
   return self.interAd.asdf890UnitID;
}


- (NSDictionary *)localParams {
   return [self.interAd ghjk123LocalParams];
}
- (void)setLocalParams:(NSDictionary *)localParams {
   [self.interAd setGhjk123LocalParams:localParams];
}

- (PubeasyInterAD *)interAd {
    if (!_interAd) {
        _interAd = [[PubeasyInterAD alloc] init];
        _interAd.pubDelegate = self.delegate;
    }
    return _interAd;
}

- (void)setAdUnitID:(nonnull NSString *)adUnitID {
    [self.interAd ytrt567SetAdUnit:adUnitID];
}

- (nullable NSDictionary *)getReadyAdInfo {
    return [self.interAd mnbv987GetReadyAdInfo];
}

- (nullable NSDictionary *)getCurrentAdInfo {
    return [self.interAd ghjk345GetCurrentAdInfo];
}

- (nullable id)getInterstitialAd {
    return [self.interAd fghj456GetInterstitialAd];
}

- (void)loadAd {
    [self.interAd cvbn789LoadAd];
}

- (void)loadAdWithMaxWaitTime:(NSTimeInterval)maxWaitTime {
    [self.interAd zxcv123LoadAdWithMaxWait:maxWaitTime];
}

- (void)showAdWithSceneId:(nullable NSString *)sceneId {
    [self.interAd asdf234ShowAdWithScene:sceneId];
}

- (void)showAdFromRootViewController:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId {
    [self.interAd qwer456ShowAdFromRoot:rootViewController scene:sceneId];
}

- (void)showWithInterstitialObject:(nonnull TradPlusAdInterstitialObject *)interstitialObject sceneId:(nullable NSString *)sceneId {
    [self.interAd zxcv567ShowWithInterstitial:interstitialObject scene:sceneId];
}

- (void)showWithInterstitialObject:(nonnull TradPlusAdInterstitialObject *)interstitialObject rootViewController:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId {
    [self.interAd asdf678ShowWithInterstitial:interstitialObject root:rootViewController scene:sceneId];
}

- (nullable TradPlusAdInterstitialObject *)getReadyInterstitialObject {
    return [self.interAd ghjk789GetReadyInterstitial];
}

- (void)entryAdScenario:(nullable NSString *)sceneId {
    [self.interAd qwer789EnterAdScene:sceneId];
}

- (void)openAutoLoadCallback {
    [self.interAd mnbv123OpenAutoLoadCallback];
}


@end
