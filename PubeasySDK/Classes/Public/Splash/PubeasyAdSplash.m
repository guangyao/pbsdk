//
//  PubeasyAdSplash.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import "PubeasyAdSplash.h"
#import "../Private/PubeasySplashAD.h"

@interface PubeasyAdSplash ()

@property (nonatomic,strong) PubeasySplashAD *splashAd;

@end

@implementation PubeasyAdSplash

- (NSDictionary *)customAdInfo {
    return [self.splashAd zxcvCustomInfo];
}
- (void)setCustomAdInfo:(NSDictionary *)customAdInfo {
    [self.splashAd setZxcvCustomInfo:customAdInfo];
}

- (BOOL)isAdReady {
    return self.splashAd.isZxcvReady;
}
- (NSString *)unitID {
    return self.splashAd.zxcvUnitId;
}

- (NSDictionary *)localParams {
    return [self.splashAd zxcvLocalParams];
}
- (void)setLocalParams:(NSDictionary *)localParams {
    [self.splashAd setZxcvLocalParams:localParams];
}

- (PubeasySplashAD *)splashAd {
    if (!_splashAd) {
        _splashAd = [[PubeasySplashAD alloc] init];
        
        _splashAd.zxcvDelegate = self.delegate;
    }
    return _splashAd;
}

/// 设置广告位ID
- (void)setAdUnitID:(NSString *)adUnitID {
    [self.splashAd setFdsaId:adUnitID];
}

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getReadyAdInfo {
    return [self.splashAd getQwerInfo];
}

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentAdInfo {
    return [self.splashAd getAsdfInfo];
}

///获取三方渠道广告对象
- (nullable id)getSplashAd {
    return [self.splashAd getZxcvAd];
}


///加载广告
- (void)loadAdWithWindow:(UIWindow *)window bottomView:(nullable UIView *)bottomView {
    [self.splashAd loadWithWin:window bottom:bottomView];
}
- (void)loadAdWithWindow:(UIWindow *)window bottomView:(nullable UIView *)bottomView maxWaitTime:(NSTimeInterval)maxWaitTime {
    [self.splashAd loadWithWin:window bottom:bottomView maxWait:maxWaitTime];
}

/// v9.7.0新增
/// 进入广告场景
/// @param sceneId 场景ID 可以为nil
- (void)entryAdScenario:(nullable NSString *)sceneId {
    [self.splashAd enterScn:sceneId];
}

/// 显示广告
- (void)show {
    [self.splashAd showAd];
}
- (void)showWithSceneId:(nullable NSString *)sceneId {
    [self.splashAd showWithScnId:sceneId];
}

/// v8.4.0新增
/// 指定原生开屏的渲染模版 展示广告
/// @param renderingViewClass renderingViewClass 仅对Waterfall中的原生广告生效
- (void)showWithRenderingViewClass:(Class)renderingViewClass {
    [self.splashAd showWithRendClass:renderingViewClass];
}
- (void)showWithRenderingViewClass:(Class)renderingViewClass sceneId:(nullable NSString *)sceneId {
    [self.splashAd showWithRendClass:renderingViewClass scnId:sceneId];
}

/// v8.4.0新增
/// 指定原生开屏的renderer 展示广告
/// @param renderer 自定义renderer 仅对Waterfall中的原生广告生效
- (void)showWithRenderer:(TradPlusNativeRenderer *)renderer {
    [self.splashAd showWithRend:renderer];
}
- (void)showWithRenderer:(TradPlusNativeRenderer *)renderer sceneId:(nullable NSString *)sceneId {
    [self.splashAd showWithRend:renderer scnId:sceneId];
}

///指定 TradPlusAdSplashObject 展示广告
- (void)showWithSplashObject:(TradPlusAdSplashObject *)splashObject {
    [self.splashAd showWithSplashObj:splashObject];
}
- (void)showWithSplashObject:(TradPlusAdSplashObject *)splashObject sceneId:(nullable NSString *)sceneId {
    [self.splashAd showWithSplashObj:splashObject scnId:sceneId];
}

///v8.4.0新增
/// 设置 原生开屏 模版渲染的尺寸 需要在load之前设置
/// 默认使用 屏幕最短边正方形size进行渲染
/// @param size 尺寸
- (void)setTemplateRenderSize:(CGSize)size {
    [self.splashAd setZxcvSize:size];
}

- (void)openAutoLoadCallback {
    [self.splashAd openAutoLoad];
}

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdSplashObject *)getReadySplashObject {
    return [self.splashAd getZxcvSplashObj];
}

//v13.8.0新增API 用户在展示时传入window
//Sigmob开屏点击后无法弹出落地页
- (void)loadAdWithBottomView:(nullable UIView *)bottomView {
    [self.splashAd loadWithBottom:bottomView];
}
- (void)loadAdWithBottomView:(nullable UIView *)bottomView maxWaitTime:(NSTimeInterval)maxWaitTime {
    [self.splashAd loadWithBottom:bottomView maxWait:maxWaitTime];
}
- (void)showWithWindow:(UIWindow *)window {
    [self.splashAd showWithWin:window];
}
- (void)showWithWindow:(UIWindow *)window sceneId:(nullable NSString *)sceneId {
    [self.splashAd showWithWin:window scnId:sceneId];
}
- (void)showWithWindow:(UIWindow *)window renderingViewClass:(Class)renderingViewClass {
    [self.splashAd showWithWin:window rendClass:renderingViewClass];
}
- (void)showWithWindow:(UIWindow *)window renderingViewClass:(Class)renderingViewClass sceneId:(nullable NSString *)sceneId {
    [self.splashAd showWithWin:window rendClass:renderingViewClass scnId:sceneId];
}
- (void)showWithWindow:(UIWindow *)window renderer:(TradPlusNativeRenderer *)renderer {
    [self.splashAd showWithWin:window rend:renderer];
}
- (void)showWithWindow:(UIWindow *)window renderer:(TradPlusNativeRenderer *)renderer sceneId:(nullable NSString *)sceneId {
    [self.splashAd showWithWin:window rend:renderer scnId:sceneId];
}
- (void)showWithWindow:(UIWindow *)window splashObject:(TradPlusAdSplashObject *)splashObject {
    [self.splashAd showWithWin:window splashObj:splashObject];
}
- (void)showWithWindow:(UIWindow *)window splashObject:(TradPlusAdSplashObject *)splashObject sceneId:(nullable NSString *)sceneId {
    [self.splashAd showWithWin:window splashObj:splashObject scnId:sceneId];
}

@end
