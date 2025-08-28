//
//  PubeasyAdRewarded.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TradPlusAds/TradPlusAdRewardedObject.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PubeasyAdRewardedDelegate;
@protocol PubeasyAdRewardedPlayAgainDelegate;

@interface PubeasyAdRewarded : NSObject

/// 设置广告位ID
- (void)setAdUnitID:(NSString *)adUnitID;

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getReadyAdInfo;

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentAdInfo;

///获取三方渠道广告对象
- (nullable id)getRewardedAd;

///加载广告
- (void)loadAd;
- (void)loadAdWithMaxWaitTime:(NSTimeInterval)maxWaitTime;

/// 显示广告
/// @param sceneId 场景ID 可以为nil
- (void)showAdWithSceneId:(nullable NSString *)sceneId;

/// 显示广告
/// @param rootViewController rootViewController
/// 当传入nil时SDK会自行获取key windows 的 rootViewController
/// @param sceneId 场景ID 可以为nil
- (void)showAdFromRootViewController:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId;

///指定 TradPlusAdRewardedObject 展示广告
- (void)showWithRewardedObject:(TradPlusAdRewardedObject *)rewardedObject sceneId:(nullable NSString *)sceneId;
- (void)showWithRewardedObject:(TradPlusAdRewardedObject *)rewardedObject rootViewController:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId;

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdRewardedObject *)getReadyRewardedObject;

/// 进入广告场景
/// @param sceneId 场景ID 可以为nil
- (void)entryAdScenario:(nullable NSString *)sceneId;

/// 设置服务器端奖励验证用户数据
/// @param userID 用户唯一识别码 必填
/// @param customData 附加信息 根据平台要求填写
- (void)setServerSideVerificationOptionsWithUserID:(nonnull NSString *)userID customData:(nullable NSString *)customData;

- (void)openAutoLoadCallback;

//用于开发者在广告展示前设置透传的自定义数据，SDK将在展示后的相关回调中返回。
//开发者可通过 key：customAdInfo 获取。adInfo[@"customAdInfo"]
@property (nonatomic, strong)NSDictionary *customAdInfo;

@property (nonatomic, readonly) BOOL isAdReady;
@property (nonatomic, readonly) NSString *unitID;

@property (nonatomic,weak) id <PubeasyAdRewardedDelegate> delegate;
@property (nonatomic,weak) id <PubeasyAdRewardedPlayAgainDelegate> playAgainDelegate;

//用户设置本地配置
@property (nullable,nonatomic, strong)NSDictionary *localParams;
@end

@protocol PubeasyAdRewardedDelegate <NSObject>

///AD加载完成 首个广告源加载成功时回调 一次加载流程只会回调一次
- (void)pubeasyRewardedAdLoaded:(NSDictionary *)adInfo;

///AD展现
- (void)pubeasyRewardedAdImpression:(NSDictionary *)adInfo;

///AD展现失败
- (void)pubeasyRewardedAdShow:(NSDictionary *)adInfo didFailWithError:(NSError *)error;

///AD被点击
- (void)pubeasyRewardedAdClicked:(NSDictionary *)adInfo;

///AD关闭
- (void)pubeasyRewardedAdDismissed:(NSDictionary *)adInfo;

///完成奖励
- (void)pubeasyRewardedAdReward:(NSDictionary *)adInfo;

@optional

///AD加载失败
- (void)pubeasyRewardedAdLoadFailWithError:(NSError *)error adInfo:(NSDictionary *)adInfo;

/// 开始加载流程
- (void)pubeasyRewardedAdStartLoad:(NSDictionary *)adInfo;

///当每个广告源开始加载时会都会回调一次。
- (void)pubeasyRewardedAdOneLayerStartLoad:(NSDictionary *)adInfo;

///调用load之后如果收到此回调，说明广告位仍处于加载状态，无法触发新的一轮广告加载。
- (void)pubeasyRewardedAdIsLoading:(NSDictionary *)adInfo;

///bidding开始
- (void)pubeasyRewardedAdBidStart:(NSDictionary *)adInfo;

///bidding结束 error = nil 表示成功
- (void)pubeasyRewardedAdBidEnd:(NSDictionary *)adInfo error:(nullable NSError *)error;

///当每个广告源加载成功后会都会回调一次。
- (void)pubeasyRewardedAdOneLayerLoaded:(NSDictionary *)adInfo;

///当每个广告源加载失败后会都会回调一次，返回三方源的错误信息
- (void)pubeasyRewardedAdOneLayerLoad:(NSDictionary *)adInfo didFailWithError:(NSError *)error;

///加载流程全部结束
- (void)pubeasyRewardedAdAllLoaded:(BOOL)success adInfo:(NSDictionary *)adInfo;

///开始播放
- (void)pubeasyRewardedAdPlayStart:(NSDictionary *)adInfo;

///播放结束
- (void)pubeasyRewardedAdPlayEnd:(NSDictionary *)adInfo;

- (void)pubeasyRewardedAdNoReward:(NSDictionary *)adInfo;

@end


@protocol PubeasyAdRewardedPlayAgainDelegate <NSObject>

///AD展现
- (void)pubeasyRewardedAdPlayAgainImpression:(NSDictionary *)adInfo;

///AD展现失败
- (void)pubeasyRewardedAdPlayAgainShow:(NSDictionary *)adInfo didFailWithError:(NSError *)error;

///AD被点击
- (void)pubeasyRewardedAdPlayAgainClicked:(NSDictionary *)adInfo;

///完成奖励
- (void)pubeasyRewardedAdPlayAgainReward:(NSDictionary *)adInfo;

@optional

///开始播放
- (void)pubeasyRewardedAdPlayAgainPlayStart:(NSDictionary *)adInfo;

///播放结束
- (void)pubeasyRewardedAdPlayAgainPlayEnd:(NSDictionary *)adInfo;

@end

NS_ASSUME_NONNULL_END
