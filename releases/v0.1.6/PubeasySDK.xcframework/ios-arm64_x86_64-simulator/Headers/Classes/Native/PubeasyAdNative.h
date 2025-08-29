//
//  PubeasyAdNative.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TradPlusAds/TradPlusNativeRenderer.h>
#import <TradPlusAds/MsCommon.h>
#import <TradPlusAds/TradPlusAdNativeObject.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PubeasyAdNativeDelegate;
@protocol PubeasyNativeAdRendering;
@class PubeasyNativeRenderer;

@interface PubeasyAdNative : NSObject


/// 设置广告位ID
/// @param adUnitID  广告位ID
- (void)setAdUnitID:(NSString *)adUnitID;

/// 加载广告
- (void)loadAd;
- (void)loadAdWithMaxWaitTime:(NSTimeInterval)maxWaitTime;

/// 加载广告并设置缓存个数
/// @param adsCount 缓存个数
- (void)loadAds:(NSInteger)adsCount;
- (void)loadAds:(NSInteger)adsCount maxWaitTime:(NSTimeInterval)maxWaitTime;



/// 显示广告
/// @param renderingViewClass renderingViewClass
/// @param subView 渲染后会添加到此view上
/// @param sceneId 场景ID 没有则设置为nil
- (void)showADWithRenderingViewClass:(Class)renderingViewClass
                             subview:(UIView *)subView
                             sceneId:(nullable NSString *)sceneId;

/// 显示广告
/// @param renderer 自定义renderer
/// @param subView 渲染后会添加到此view上
/// @param sceneId 场景ID 没有则设置为nil
- (void)showADWithNativeRenderer:(PubeasyNativeRenderer *)renderer
                         subview:(UIView *)subView
                         sceneId:(nullable NSString *)sceneId;

/// 进入广告场景
/// @param sceneId 场景ID 没有则设置为nil
- (void)entryAdScenario:(nullable NSString *)sceneId;

/// 设置模版渲染的尺寸 需要在load之前设置
/// Mintegral Pangle GDTMob KuaiShou 的模版渲染需要设置
/// @param size 尺寸
- (void)setTemplateRenderSize:(CGSize)size;

- (void)openAutoLoadCallback;

// 用于移除当前展示的原生广告对象的引用
- (void)clear;

//用于开发者在广告展示前设置透传的自定义数据，SDK将在展示后的相关回调中返回。
//开发者可通过 key：customAdInfo 获取。adInfo[@"customAdInfo"]
@property (nonatomic, strong)NSDictionary *customAdInfo;

///设置模版渲染的布局方式 默认 TPTemplateContentModeScaleToFill
@property (nonatomic,assign)TPTemplateContentMode templateContentMode;

/// 当设置为YES时Loaded通知将会在图片资源全部下载成功后才会通知
@property (nonatomic,assign)BOOL finishDownload;

@property (nonatomic,readonly)BOOL isAdReady;
///已缓存广告数量
@property (nonatomic,readonly)NSInteger readyAdCount;
@property (nonatomic, readonly) NSString *unitID;

@property (nonatomic,weak) id <PubeasyAdNativeDelegate> delegate;

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getReadyAdInfo;

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentAdInfo;

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdNativeObject *)getReadyNativeObject;

//用户设置本地配置
@property (nullable,nonatomic, strong)NSDictionary *localParams;

@end

@protocol PubeasyAdNativeDelegate <NSObject>

///AD加载完成 首个广告源加载成功时回调 一次加载流程只会回调一次
- (void)pubeasyNativeAdLoaded:(NSDictionary *)adInfo;

///AD展现
- (void)pubeasyNativeAdImpression:(NSDictionary *)adInfo;

///AD展现失败
- (void)pubeasyNativeAdShow:(NSDictionary *)adInfo didFailWithError:(NSError *)error;

///AD被点击
- (void)pubeasyNativeAdClicked:(NSDictionary *)adInfo;

@optional

/// AD 加载失败
- (void)pubeasyNativeAdLoadFailWithError:(NSError *)error adInfo:(NSDictionary *)adInfo;

///为三方提供rootviewController 用于点击广告后的操作
- (nullable UIViewController *)viewControllerForPresentingModalView;

/// 开始加载流程
- (void)pubeasyNativeAdStartLoad:(NSDictionary *)adInfo;

///当每个广告源开始加载时会都会回调一次。
- (void)pubeasyNativeAdOneLayerStartLoad:(NSDictionary *)adInfo;

///调用load之后如果收到此回调，说明广告位仍处于加载状态，无法触发新的一轮广告加载。
- (void)pubeasyNativeAdIsLoading:(NSDictionary *)adInfo;

///AD被关闭
- (void)pubeasyNativeAdClose:(NSDictionary *)adInfo;

///bidding开始
- (void)pubeasyNativeAdBidStart:(NSDictionary *)adInfo;

///bidding结束 error = nil 表示成功
- (void)pubeasyNativeAdBidEnd:(NSDictionary *)adInfo error:(nullable NSError *)error;

///当每个广告源加载成功后会都会回调一次。
- (void)pubeasyNativeAdOneLayerLoaded:(NSDictionary *)adInfo;

///当每个广告源加载失败后会都会回调一次，返回三方源的错误信息
- (void)pubeasyNativeAdOneLayerLoad:(NSDictionary *)adInfo didFailWithError:(NSError *)error;

///加载流程全部结束
- (void)pubeasyNativeAdAllLoaded:(BOOL)success adInfo:(NSDictionary *)adInfo;

///视频贴片类型播放完成回调
- (void)pubeasyNativePasterDidPlayFinished:(NSDictionary *)adInfo;

///开始播放
- (void)pubeasyNativeAdVideoPlayStart:(NSDictionary *)adInfo;

///播放结束
- (void)pubeasyNativeAdVideoPlayEnd:(NSDictionary *)adInfo;

///dislikeInfo[@"dislikeInfo"]：三方源返回的dislike信息
///dislikeInfo[@"dislikeObject"]：三方源返回的对象信息，可能为nil
- (void)pubeasyNativeAdDisLikeInfo:(NSDictionary *)dislikeInfo adInfo:(NSDictionary *)adInfo;

@end

NS_ASSUME_NONNULL_END
