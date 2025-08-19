//
//  PubeasySplashAD.h
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

@interface PubeasySplashAD : NSObject
/// 设置广告位ID
- (void)setFdsaId:(NSString *)adUnitID;

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getQwerInfo;

///返回当前显示的AD信息
- (nullable NSDictionary *)getAsdfInfo;

///获取三方渠道广告对象
- (nullable id)getZxcvAd;

///加载广告
- (void)loadWithWin:(UIWindow *)window bottom:(nullable UIView *)bottomView;
- (void)loadWithWin:(UIWindow *)window bottom:(nullable UIView *)bottomView maxWait:(NSTimeInterval)maxWaitTime;

/// 进入广告场景
/// @param sceneId 场景ID 可以为nil
- (void)enterScn:(nullable NSString *)sceneId;

/// 显示广告
- (void)showAd;
- (void)showWithScnId:(nullable NSString *)sceneId;

/// 指定原生开屏的渲染模版 展示广告
/// @param renderingViewClass renderingViewClass 仅对Waterfall中的原生广告生效
- (void)showWithRendClass:(Class)renderingViewClass;
- (void)showWithRendClass:(Class)renderingViewClass scnId:(nullable NSString *)sceneId;

/// 指定原生开屏的renderer 展示广告
/// @param renderer 自定义renderer 仅对Waterfall中的原生广告生效
- (void)showWithRend:(TradPlusNativeRenderer *)renderer;
- (void)showWithRend:(TradPlusNativeRenderer *)renderer scnId:(nullable NSString *)sceneId;

///指定 TradPlusAdSplashObject 展示广告
- (void)showWithSplashObj:(TradPlusAdSplashObject *)splashObject;
- (void)showWithSplashObj:(TradPlusAdSplashObject *)splashObject scnId:(nullable NSString *)sceneId;

///设置 原生开屏 模版渲染的布局方式 默认 TPTemplateContentModeCenter
@property (nonatomic,assign)TPTemplateContentMode zxcvMode;

/// 设置 原生开屏 模版渲染的尺寸 需要在load之前设置
/// 默认使用 屏幕最短边正方形size进行渲染
/// @param size 尺寸
- (void)setZxcvSize:(CGSize)size;

- (void)openAutoLoad;

//用于开发者在广告展示前设置透传的自定义数据，SDK将在展示后的相关回调中返回。
//开发者可通过 key：customAdInfo 获取。adInfo[@"customAdInfo"]
@property (nonatomic, strong)NSDictionary *zxcvCustomInfo;

@property (nonatomic, readonly) BOOL isZxcvReady;
@property (nonatomic, readonly) NSString *zxcvUnitId;

@property (nonatomic,weak) id <PubeasyAdSplashDelegate> zxcvDelegate;

//用户设置本地配置
@property (nullable,nonatomic, strong)NSDictionary *zxcvLocalParams;

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdSplashObject *)getZxcvSplashObj;

//Sigmob开屏点击后无法弹出落地页
- (void)loadWithBottom:(nullable UIView *)bottomView;
- (void)loadWithBottom:(nullable UIView *)bottomView maxWait:(NSTimeInterval)maxWaitTime;
- (void)showWithWin:(UIWindow *)window;
- (void)showWithWin:(UIWindow *)window scnId:(nullable NSString *)sceneId;
- (void)showWithWin:(UIWindow *)window rendClass:(Class)renderingViewClass;
- (void)showWithWin:(UIWindow *)window rendClass:(Class)renderingViewClass scnId:(nullable NSString *)sceneId;
- (void)showWithWin:(UIWindow *)window rend:(TradPlusNativeRenderer *)renderer;
- (void)showWithWin:(UIWindow *)window rend:(TradPlusNativeRenderer *)renderer scnId:(nullable NSString *)sceneId;
- (void)showWithWin:(UIWindow *)window splashObj:(TradPlusAdSplashObject *)splashObject;
- (void)showWithWin:(UIWindow *)window splashObj:(TradPlusAdSplashObject *)splashObject scnId:(nullable NSString *)sceneId;

@end

NS_ASSUME_NONNULL_END
