//
//  PubeasyAdInterstitial.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/17.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TradPlusAds/TradPlusAds.h>
#import <TradPlusAds/TradPlusAdInterstitialObject.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PubeasyAdInterstitialDelegate;

@interface PubeasyAdInterstitial : NSObject

/// 设置广告位ID
- (void)setAdUnitID:(NSString *)adUnitID;

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getReadyAdInfo;

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentAdInfo;

///获取三方渠道广告对象
- (nullable id)getInterstitialAd;

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

///指定 TradPlusAdInterstitialObject 展示广告
- (void)showWithInterstitialObject:(TradPlusAdInterstitialObject *)interstitialObject sceneId:(nullable NSString *)sceneId;
- (void)showWithInterstitialObject:(TradPlusAdInterstitialObject *)interstitialObject rootViewController:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId;

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdInterstitialObject *)getReadyInterstitialObject;

/// 进入广告场景
/// @param sceneId 场景ID 可以为nil
- (void)entryAdScenario:(nullable NSString *)sceneId;

- (void)openAutoLoadCallback;


//用于开发者在广告展示前设置透传的自定义数据，SDK将在展示后的相关回调中返回。
//开发者可通过 key：customAdInfo 获取。adInfo[@"customAdInfo"]

@property (nonatomic, strong) NSDictionary *customAdInfo;

@property (nonatomic, readonly) BOOL isAdReady;
@property (nonatomic, readonly) NSString *unitID;

@property (nonatomic,weak) id <PubeasyAdInterstitialDelegate> delegate;

//用户设置本地配置
@property (nullable, nonatomic, strong) NSDictionary *localParams;

@end


@protocol PubeasyAdInterstitialDelegate <NSObject>

///AD加载完成 首个广告源加载成功时回调 一次加载流程只会回调一次
- (void)pubeasyInterstitialAdLoaded:(NSDictionary *)adInfo;

///AD展现[开发者可以在展示广告前，各广告加载类的customAdInfo设置定义数据。SDK将在展示后的相关回调中返回。]
- (void)pubeasyInterstitialAdImpression:(NSDictionary *)adInfo;

///AD展现失败
- (void)pubeasyInterstitialAdShow:(NSDictionary *)adInfo didFailWithError:(NSError *)error;

///AD被点击
- (void)pubeasyInterstitialAdClicked:(NSDictionary *)adInfo;

///AD关闭
- (void)pubeasyInterstitialAdDismissed:(NSDictionary *)adInfo;

@optional

///AD加载失败
- (void)pubeasyInterstitialAdLoadFailWithError:(NSError *)error adInfo:(NSDictionary *)adInfo;

///开始加载流程
- (void)pubeasyInterstitialAdStartLoad:(NSDictionary *)adInfo;

///当每个广告源开始加载时会都会回调一次。
- (void)pubeasyInterstitialAdOneLayerStartLoad:(NSDictionary *)adInfo;

///调用load之后如果收到此回调，说明广告位仍处于加载状态，无法触发新的一轮广告加载。
- (void)pubeasyInterstitialAdIsLoading:(NSDictionary *)adInfo;

///bidding开始
- (void)pubeasyInterstitialAdBidStart:(NSDictionary *)adInfo;

///bidding结束 error = nil 表示成功
- (void)pubeasyInterstitialAdBidEnd:(NSDictionary *)adInfo error:(nullable NSError *)error;

///当每个广告源加载成功后会都会回调一次。
- (void)pubeasyInterstitialAdOneLayerLoaded:(NSDictionary *)adInfo;

///当每个广告源加载失败后会都会回调一次，返回三方源的错误信息
- (void)pubeasyInterstitialAdOneLayerLoad:(NSDictionary *)adInfo didFailWithError:(NSError *)error;

///加载流程全部结束
- (void)pubeasyInterstitialAdAllLoaded:(BOOL)success adInfo:(NSDictionary *)adInfo;

///开始播放
- (void)pubeasyInterstitialAdPlayStart:(NSDictionary *)adInfo;

///播放结束
- (void)pubeasyInterstitialAdPlayEnd:(NSDictionary *)adInfo;

@end

NS_ASSUME_NONNULL_END
