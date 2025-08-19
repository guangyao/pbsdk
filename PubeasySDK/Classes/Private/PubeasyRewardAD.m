//
//  PubeasyRewardAD.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/17.
//

#import "PubeasyRewardAD.h"
#import <TradPlusAds/TradPlusAdRewarded.h>
#import "../Public/Reward/PubeasyAdRewarded.h"

@interface PubeasyRewardAD ()<TradPlusADRewardedDelegate, TradPlusADRewardedPlayAgainDelegate>

@property (nonatomic, strong) TradPlusAdRewarded *bidmAd;

@end

@implementation PubeasyRewardAD


- (NSDictionary *)nopCustomInfo_654 {
    return [self.bidmAd customAdInfo];
}
- (void)setNopCustomInfo_654:(NSDictionary *)nopCustomInfo_654 {
    [self.bidmAd setCustomAdInfo:nopCustomInfo_654];
}


- (BOOL)isQrsIsAdReady_987 {
    return [self.bidmAd isAdReady];
}
- (NSString *)tuvUnitID_321 {
    return [self.bidmAd unitID];
}


- (NSDictionary *)ijkLocalParams_987 {
    return [self.bidmAd localParams];
}
- (void)setIjkLocalParams_987:(NSDictionary *)ijkLocalParams_987 {
    [self.bidmAd setLocalParams:ijkLocalParams_987];
}

- (TradPlusAdRewarded *)bidmAd {
    if (!_bidmAd) {
        _bidmAd = [[TradPlusAdRewarded alloc] init];
        _bidmAd.delegate = self;
        _bidmAd.playAgainDelegate = self;
    }
    return _bidmAd;
}

/// 设置广告位ID
- (void)xyzSetAdUnit_789:(NSString *)adUnitID {
    [self.bidmAd setAdUnitID:adUnitID];
}

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)abcGetReadyInfo_123 {
    return [self.bidmAd getReadyAdInfo];
}

///返回当前显示的AD信息
- (nullable NSDictionary *)defGetCurrentInfo_456 {
    return [self.bidmAd getCurrentAdInfo];
}

///获取三方渠道广告对象
- (nullable id)ghiGetRewardAd_789 {
    return [self.bidmAd getRewardedAd];
}

///加载广告
- (void)jklLoadAd_321 {
    [self.bidmAd loadAd];
}
- (void)mnoLoadAdWithWait_654:(NSTimeInterval)maxWaitTime {
    [self.bidmAd loadAdWithMaxWaitTime:maxWaitTime];
}

/// 显示广告
/// @param sceneId 场景ID 可以为nil
- (void)pqrShowAdWithScene_987:(nullable NSString *)sceneId {
    [self.bidmAd showAdWithSceneId:sceneId];
}

/// 显示广告
/// @param rootViewController rootViewController
/// 当传入nil时SDK会自行获取key windows 的 rootViewController
/// @param sceneId 场景ID 可以为nil
- (void)stuShowAdFromRoot_654:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId {
    [self.bidmAd showAdFromRootViewController:rootViewController sceneId:sceneId];
}

///指定 TradPlusAdRewardedObject 展示广告
- (void)vwxShowWithRewardObj_321:(TradPlusAdRewardedObject *)rewardedObject sceneId:(nullable NSString *)sceneId {
    [self.bidmAd showWithRewardedObject:rewardedObject sceneId:sceneId];
}
- (void)yzAShowWithRewardObj_987:(TradPlusAdRewardedObject *)rewardedObject rootViewController:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId {
    [self.bidmAd showWithRewardedObject:rewardedObject rootViewController:rootViewController sceneId:sceneId];
}

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdRewardedObject *)bcdGetReadyRewardObj_123 {
    return [self.bidmAd getReadyRewardedObject];
}

/// 进入广告场景
/// @param sceneId 场景ID 可以为nil
- (void)efgEntryAdScene_456:(nullable NSString *)sceneId {
    [self.bidmAd entryAdScenario:sceneId];
}

/// 设置服务器端奖励验证用户数据
/// @param userID 用户唯一识别码 必填
/// @param customData 附加信息 根据平台要求填写
- (void)hijSetServerVerify_789:(nonnull NSString *)userID customData:(nullable NSString *)customData {
    [self.bidmAd setServerSideVerificationOptionsWithUserID:userID customData:customData];
}

- (void)klmOpenAutoLoad_321 {
    [self.bidmAd openAutoLoadCallback];
}


//======================delegate==========================//
- (void)tpRewardedAdClicked:(nonnull NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdClicked:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdClicked:adInfo];
    }
}

- (void)tpRewardedAdDismissed:(nonnull NSDictionary *)adInfo { 
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdDismissed:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdDismissed:adInfo];
    }
}

- (void)tpRewardedAdImpression:(nonnull NSDictionary *)adInfo { 
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdImpression:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdImpression:adInfo];
    }
}

- (void)tpRewardedAdLoaded:(nonnull NSDictionary *)adInfo { 
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdLoaded:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdLoaded:adInfo];
    }
}

- (void)tpRewardedAdReward:(nonnull NSDictionary *)adInfo { 
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdReward:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdReward:adInfo];
    }
}

- (void)tpRewardedAdShow:(nonnull NSDictionary *)adInfo didFailWithError:(nonnull NSError *)error { 
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdShow:didFailWithError:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdShow:adInfo didFailWithError:error];
    }
}

/// 可选delegate
- (void)tpRewardedAdLoadFailWithError:(NSError *)error adInfo:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdLoadFailWithError:adInfo:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdLoadFailWithError:error adInfo:adInfo];
    }
}

- (void)tpRewardedAdStartLoad:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdStartLoad:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdStartLoad:adInfo];
    }
}

- (void)tpRewardedAdOneLayerStartLoad:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdOneLayerStartLoad:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdOneLayerStartLoad:adInfo];
    }
}

- (void)tpRewardedAdIsLoading:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdIsLoading:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdIsLoading:adInfo];
    }
}

- (void)tpRewardedAdBidStart:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdBidStart:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdBidStart:adInfo];
    }
}

- (void)tpRewardedAdBidEnd:(NSDictionary *)adInfo error:(NSError *)error {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdBidEnd:error:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdBidEnd:adInfo error:error];
    }
}

- (void)tpRewardedAdOneLayerLoaded:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdOneLayerLoaded:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdOneLayerLoaded:adInfo];
    }
}

///当每个广告源加载失败后会都会回调一次，返回三方源的错误信息
- (void)tpRewardedAdOneLayerLoad:(NSDictionary *)adInfo didFailWithError:(NSError *)error {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdOneLayerLoad:didFailWithError:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdOneLayerLoad:adInfo didFailWithError:error];
    }
}

///加载流程全部结束
- (void)tpRewardedAdAllLoaded:(BOOL)success adInfo:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdAllLoaded:adInfo:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdAllLoaded:success adInfo:adInfo];
    }
}

///开始播放
- (void)tpRewardedAdPlayStart:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdPlayStart:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdPlayStart:adInfo];
    }
}

///播放结束
- (void)tpRewardedAdPlayEnd:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdPlayEnd:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdPlayEnd:adInfo];
    }
}

- (void)tpRewardedAdNoReward:(NSDictionary *)adInfo {
    if (self.cdeDelegate_321 && [self.cdeDelegate_321 respondsToSelector:@selector(pubeasyRewardedAdNoReward:)]) {
        [self.cdeDelegate_321 pubeasyRewardedAdNoReward:adInfo];
    }
}

//**************PubeasyAdRewardedPlayAgainDelegate*****************//
- (void)tpRewardedAdPlayAgainClicked:(nonnull NSDictionary *)adInfo {
    if (self.fghPlayAgainDelegate_654 && [self.fghPlayAgainDelegate_654 respondsToSelector:@selector(pubeasyRewardedAdPlayAgainClicked:)]) {
        [self.fghPlayAgainDelegate_654 pubeasyRewardedAdPlayAgainClicked:adInfo];
    }
}

- (void)tpRewardedAdPlayAgainImpression:(nonnull NSDictionary *)adInfo {
    if (self.fghPlayAgainDelegate_654 && [self.fghPlayAgainDelegate_654 respondsToSelector:@selector(pubeasyRewardedAdPlayAgainImpression:)]) {
        [self.fghPlayAgainDelegate_654 pubeasyRewardedAdPlayAgainImpression:adInfo];
    }
}

- (void)tpRewardedAdPlayAgainReward:(nonnull NSDictionary *)adInfo { 
    if (self.fghPlayAgainDelegate_654 && [self.fghPlayAgainDelegate_654 respondsToSelector:@selector(pubeasyRewardedAdPlayAgainReward:)]) {
        [self.fghPlayAgainDelegate_654 pubeasyRewardedAdPlayAgainReward:adInfo];
    }
}

- (void)tpRewardedAdPlayAgainShow:(nonnull NSDictionary *)adInfo didFailWithError:(nonnull NSError *)error { 
    if (self.fghPlayAgainDelegate_654 && [self.fghPlayAgainDelegate_654 respondsToSelector:@selector(pubeasyRewardedAdPlayAgainShow:didFailWithError:)]) {
        [self.fghPlayAgainDelegate_654 pubeasyRewardedAdPlayAgainShow:adInfo didFailWithError:error];
    }
}

///开始播放
- (void)tpRewardedAdPlayAgainPlayStart:(NSDictionary *)adInfo {
    if (self.fghPlayAgainDelegate_654 && [self.fghPlayAgainDelegate_654 respondsToSelector:@selector(pubeasyRewardedAdPlayAgainPlayStart:)]) {
        [self.fghPlayAgainDelegate_654 pubeasyRewardedAdPlayAgainPlayStart:adInfo];
    }
}

///播放结束
- (void)tpRewardedAdPlayAgainPlayEnd:(NSDictionary *)adInfo {
    if (self.fghPlayAgainDelegate_654 && [self.fghPlayAgainDelegate_654 respondsToSelector:@selector(pubeasyRewardedAdPlayAgainPlayEnd:)]) {
        [self.fghPlayAgainDelegate_654 pubeasyRewardedAdPlayAgainPlayEnd:adInfo];
    }
}

@end
