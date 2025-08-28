//
//  PubeasyAdRewarded.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/17.
//

#import "PubeasyAdRewarded.h"
#import "../Private/PubeasyRewardAD.h"

@interface PubeasyAdRewarded ()

@property (nonatomic, strong) PubeasyRewardAD *rewardedAd;

@end

@implementation PubeasyAdRewarded

- (NSDictionary *)customAdInfo {
    return [self.rewardedAd nopCustomInfo_654];
}
- (void)setCustomAdInfo:(NSDictionary *)customAdInfo {
    [self.rewardedAd setNopCustomInfo_654:customAdInfo];
}

- (BOOL)isAdReady {
    return self.rewardedAd.qrsIsAdReady_987;
}
- (NSString *)unitID {
    return self.rewardedAd.tuvUnitID_321;
}

- (NSDictionary *)localParams {
    return [self.rewardedAd ijkLocalParams_987];
}
- (void)setLocalParams:(NSDictionary *)localParams {
    [self.rewardedAd setIjkLocalParams_987:localParams];
}

- (PubeasyRewardAD *)rewardedAd {
    if (!_rewardedAd) {
        _rewardedAd = [[PubeasyRewardAD alloc] init];
        
        _rewardedAd.cdeDelegate_321 = self.delegate;
        _rewardedAd.fghPlayAgainDelegate_654 = self.playAgainDelegate;
    }
    return _rewardedAd;
}

- (nullable NSDictionary *)getCurrentAdInfo {
    return [self.rewardedAd defGetCurrentInfo_456];
}

- (nullable NSDictionary *)getReadyAdInfo {
    return [self.rewardedAd abcGetReadyInfo_123];
}

- (nullable TradPlusAdRewardedObject *)getReadyRewardedObject {
    return [self.rewardedAd bcdGetReadyRewardObj_123];
}

- (nullable id)getRewardedAd {
    return [self.rewardedAd ghiGetRewardAd_789];
}

- (void)loadAd {
    [self.rewardedAd jklLoadAd_321];
}

- (void)loadAdWithMaxWaitTime:(NSTimeInterval)maxWaitTime {
    [self.rewardedAd mnoLoadAdWithWait_654:maxWaitTime];
}

- (void)openAutoLoadCallback {
    [self.rewardedAd klmOpenAutoLoad_321];
}

- (void)setAdUnitID:(nonnull NSString *)adUnitID {
    [self.rewardedAd xyzSetAdUnit_789:adUnitID];
}

- (void)setServerSideVerificationOptionsWithUserID:(nonnull NSString *)userID customData:(nullable NSString *)customData {
    [self.rewardedAd hijSetServerVerify_789:userID customData:customData];
}

- (void)showAdFromRootViewController:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId {
    [self.rewardedAd stuShowAdFromRoot_654:rootViewController sceneId:sceneId];
}

- (void)showAdWithSceneId:(nullable NSString *)sceneId {
    [self.rewardedAd pqrShowAdWithScene_987:sceneId];
}

- (void)showWithRewardedObject:(nonnull TradPlusAdRewardedObject *)rewardedObject rootViewController:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId {
    [self.rewardedAd yzAShowWithRewardObj_987:rewardedObject rootViewController:rootViewController sceneId:sceneId];
}

- (void)showWithRewardedObject:(nonnull TradPlusAdRewardedObject *)rewardedObject sceneId:(nullable NSString *)sceneId {
    [self.rewardedAd vwxShowWithRewardObj_321:rewardedObject sceneId:sceneId];
}

- (void)entryAdScenario:(nullable NSString *)sceneId {
    [self.rewardedAd efgEntryAdScene_456:sceneId];
}

@end
