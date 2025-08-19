//
//  PubeasyNativeAD.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TradPlusAds/TradPlusNativeRenderer.h>
#import <TradPlusAds/MsCommon.h>
#import <TradPlusAds/TradPlusAdNativeObject.h>

@class PubeasyNativeRenderer;
@protocol PubeasyAdNativeDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface PubeasyNativeAD : NSObject

/// 设置广告位ID
/// @param adUnitID  广告位ID
- (void)setupAdSlotID:(NSString *)adUnitID;

/// 加载广告
- (void)triggerAdLoad;
- (void)triggerAdLoadWithMaxWait:(NSTimeInterval)maxWaitTime;

/// 加载广告并设置缓存个数
/// @param adsCount 缓存个数
- (void)loadAdsWithCount:(NSInteger)adsCount;
- (void)loadAdsWithCount:(NSInteger)adsCount maxWait:(NSTimeInterval)maxWaitTime;

/// 显示广告
/// @param renderingViewClass renderingViewClass
/// @param subView 渲染后会添加到此view上
/// @param sceneId 场景ID 没有则设置为nil
- (void)displayAdWithRenderClass:(Class)renderingViewClass
                         subView:(UIView *)subView
                         sceneID:(nullable NSString *)sceneId;

/// 显示广告
/// @param renderer 自定义renderer
/// @param subView 渲染后会添加到此view上
/// @param sceneId 场景ID 没有则设置为nil
- (void)displayAdWithRenderer:(PubeasyNativeRenderer *)renderer
                      subView:(UIView *)subView
                      sceneID:(nullable NSString *)sceneId;

/// 进入广告场景
/// @param sceneId 场景ID 没有则设置为nil
- (void)enterAdScene:(nullable NSString *)sceneId;

/// 设置模版渲染的尺寸 需要在load之前设置
/// Mintegral Pangle GDTMob KuaiShou 的模版渲染需要设置
/// @param size 尺寸
- (void)setTemplateRenderDimension:(CGSize)size;

- (void)activateAutoLoadCallback;

// v9.7.0新增
// 用于移除当前展示的原生广告对象的引用
- (void)cleanupAdReference;

//用于开发者在广告展示前设置透传的自定义数据，SDK将在展示后的相关回调中返回。
//开发者可通过 key：customAdInfo 获取。adInfo[@"customAdInfo"]
@property (nonatomic, strong)NSDictionary *passThroughAdData;

///设置模版渲染的布局方式 默认 TPTemplateContentModeScaleToFill
@property (nonatomic,assign)TPTemplateContentMode templateLayoutMode;

/// 当设置为YES时Loaded通知将会在图片资源全部下载成功后才会通知
@property (nonatomic,assign)BOOL notifyAfterDownload;

@property (nonatomic,readonly)BOOL isAdAvailable;
///已缓存广告数量
@property (nonatomic,readonly)NSInteger cachedAdCount;
@property (nonatomic, readonly) NSString *adSlotID;

@property (nonatomic,weak) id <PubeasyAdNativeDelegate> adDelegate;

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getNextReadyAdInfo;

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentDisplayAdInfo;

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdNativeObject *)fetchReadyNativeAd;

//用户设置本地配置
@property (nullable,nonatomic, strong)NSDictionary *localUserConfig;

@end

NS_ASSUME_NONNULL_END
