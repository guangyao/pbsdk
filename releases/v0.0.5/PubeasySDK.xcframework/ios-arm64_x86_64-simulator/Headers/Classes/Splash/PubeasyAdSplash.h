//
//  PubeasyAdSplash.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TradPlusAds/TradPlusAds.h>
#import <TradPlusAds/TradPlusAdSplashObject.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PubeasyAdSplashDelegate;

@interface PubeasyAdSplash : NSObject

/// 设置广告位ID
- (void)setAdUnitID:(NSString *)adUnitID;

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getReadyAdInfo;

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentAdInfo;

///获取三方渠道广告对象
- (nullable id)getSplashAd;


///加载广告
- (void)loadAdWithWindow:(UIWindow *)window bottomView:(nullable UIView *)bottomView;
- (void)loadAdWithWindow:(UIWindow *)window bottomView:(nullable UIView *)bottomView maxWaitTime:(NSTimeInterval)maxWaitTime;

/// 进入广告场景
/// @param sceneId 场景ID 可以为nil
- (void)entryAdScenario:(nullable NSString *)sceneId;

/// 显示广告
- (void)show;
- (void)showWithSceneId:(nullable NSString *)sceneId;

/// 指定原生开屏的渲染模版 展示广告
/// @param renderingViewClass renderingViewClass 仅对Waterfall中的原生广告生效
- (void)showWithRenderingViewClass:(Class)renderingViewClass;
- (void)showWithRenderingViewClass:(Class)renderingViewClass sceneId:(nullable NSString *)sceneId;

/// 指定原生开屏的renderer 展示广告
/// @param renderer 自定义renderer 仅对Waterfall中的原生广告生效
- (void)showWithRenderer:(TradPlusNativeRenderer *)renderer;
- (void)showWithRenderer:(TradPlusNativeRenderer *)renderer sceneId:(nullable NSString *)sceneId;

///指定 TradPlusAdSplashObject 展示广告
- (void)showWithSplashObject:(TradPlusAdSplashObject *)splashObject;
- (void)showWithSplashObject:(TradPlusAdSplashObject *)splashObject sceneId:(nullable NSString *)sceneId;

///设置 原生开屏 模版渲染的布局方式 默认 TPTemplateContentModeCenter
@property (nonatomic,assign)TPTemplateContentMode templateContentMode;

/// 设置 原生开屏 模版渲染的尺寸 需要在load之前设置
/// 默认使用 屏幕最短边正方形size进行渲染
/// @param size 尺寸
- (void)setTemplateRenderSize:(CGSize)size;

- (void)openAutoLoadCallback;

//用于开发者在广告展示前设置透传的自定义数据，SDK将在展示后的相关回调中返回。
//开发者可通过 key：customAdInfo 获取。adInfo[@"customAdInfo"]
@property (nonatomic, strong)NSDictionary *customAdInfo;

@property (nonatomic, readonly) BOOL isAdReady;
@property (nonatomic, readonly) NSString *unitID;

@property (nonatomic,weak) id <PubeasyAdSplashDelegate> delegate;

//用户设置本地配置
@property (nullable,nonatomic, strong)NSDictionary *localParams;

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdSplashObject *)getReadySplashObject;

//Sigmob开屏点击后无法弹出落地页
- (void)loadAdWithBottomView:(nullable UIView *)bottomView;
- (void)loadAdWithBottomView:(nullable UIView *)bottomView maxWaitTime:(NSTimeInterval)maxWaitTime;
- (void)showWithWindow:(UIWindow *)window;
- (void)showWithWindow:(UIWindow *)window sceneId:(nullable NSString *)sceneId;
- (void)showWithWindow:(UIWindow *)window renderingViewClass:(Class)renderingViewClass;
- (void)showWithWindow:(UIWindow *)window renderingViewClass:(Class)renderingViewClass sceneId:(nullable NSString *)sceneId;
- (void)showWithWindow:(UIWindow *)window renderer:(TradPlusNativeRenderer *)renderer;
- (void)showWithWindow:(UIWindow *)window renderer:(TradPlusNativeRenderer *)renderer sceneId:(nullable NSString *)sceneId;
- (void)showWithWindow:(UIWindow *)window splashObject:(TradPlusAdSplashObject *)splashObject;
- (void)showWithWindow:(UIWindow *)window splashObject:(TradPlusAdSplashObject *)splashObject sceneId:(nullable NSString *)sceneId;

@end

@protocol PubeasyAdSplashDelegate <NSObject>

///AD加载完成 首个广告源加载成功时回调 一次加载流程只会回调一次
- (void)pubeasySplashAdLoaded:(NSDictionary *)adInfo;

///AD展现
- (void)pubeasySplashAdImpression:(NSDictionary *)adInfo;

///AD展现失败
- (void)pubeasySplashAdShow:(NSDictionary *)adInfo didFailWithError:(NSError *)error;

///AD被点击
- (void)pubeasySplashAdClicked:(NSDictionary *)adInfo;

///AD关闭
- (void)pubeasySplashAdDismissed:(NSDictionary *)adInfo;

@optional

///AD加载失败
- (void)pubeasySplashAdLoadFailWithError:(NSError *)error adInfo:(NSDictionary *)adInfo;

/// 开始加载流程
- (void)pubeasySplashAdStartLoad:(NSDictionary *)adInfo;

///当每个广告源开始加载时会都会回调一次。
- (void)pubeasySplashAdOneLayerStartLoad:(NSDictionary *)adInfo;

///调用load之后如果收到此回调，说明广告位仍处于加载状态，无法触发新的一轮广告加载。
- (void)pubeasySplashAdIsLoading:(NSDictionary *)adInfo;

///bidding开始
- (void)pubeasySplashAdBidStart:(NSDictionary *)adInfo;

///bidding结束 error = nil 表示成功
- (void)pubeasySplashAdBidEnd:(NSDictionary *)adInfo error:(nullable NSError *)error;

///当每个广告源加载成功后会都会回调一次。
- (void)pubeasySplashAdOneLayerLoaded:(NSDictionary *)adInfo;

///当每个广告源加载失败后会都会回调一次，返回三方源的错误信息
- (void)pubeasySplashAdOneLayerLoad:(NSDictionary *)adInfo didFailWithError:(NSError *)error;

///加载流程全部结束
- (void)pubeasySplashAdAllLoaded:(BOOL)success adInfo:(NSDictionary *)adInfo;

// 跳过
- (void)pubeasySplashAdSkip:(NSDictionary *)adInfo;
// 点睛开始
- (void)pubeasySplashAdZoomOutViewShow:(NSDictionary *)adInfo;
// 点睛关闭
- (void)pubeasySplashAdZoomOutViewClose:(NSDictionary *)adInfo;

@end

NS_ASSUME_NONNULL_END
