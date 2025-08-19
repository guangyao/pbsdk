//
//  PubeasySplashAD.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import "PubeasySplashAD.h"
#import <TradPlusAds/TradPlusAdSplash.h>
#import "../Public/Splash/PubeasyAdSplash.h"

@interface PubeasySplashAD ()<TradPlusADSplashDelegate>

@property (nonatomic, strong) TradPlusAdSplash *fsaezAd;

@end

@implementation PubeasySplashAD

- (NSDictionary *)zxcvCustomInfo {
    return [self.fsaezAd customAdInfo];
}
- (void)setZxcvCustomInfo:(NSDictionary *)zxcvCustomInfo {
    [self.fsaezAd setCustomAdInfo:zxcvCustomInfo];
}

- (BOOL)isZxcvReady {
    return [self.fsaezAd isAdReady];
}
- (NSString *)zxcvUnitId {
    return [self.fsaezAd unitID];
}

- (NSDictionary *)zxcvLocalParams {
    return [self.fsaezAd localParams];
}
- (void)setZxcvLocalParams:(NSDictionary *)zxcvLocalParams {
    [self.fsaezAd setLocalParams:zxcvLocalParams];
}

- (TradPlusAdSplash *)fsaezAd {
    if(!_fsaezAd) {
        _fsaezAd = [[TradPlusAdSplash alloc] init];
        _fsaezAd.delegate = self;
    }
    return _fsaezAd;
}

/// 设置广告位ID
- (void)setFdsaId:(NSString *)adUnitID {
    [self.fsaezAd setAdUnitID:adUnitID];
}

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getQwerInfo {
    return [self.fsaezAd getReadyAdInfo];
}

///返回当前显示的AD信息
- (nullable NSDictionary *)getAsdfInfo {
    return [self.fsaezAd getCurrentAdInfo];
}

///获取三方渠道广告对象
- (nullable id)getZxcvAd {
    return [self.fsaezAd getSplashAd];
}

///加载广告
- (void)loadWithWin:(UIWindow *)window bottom:(nullable UIView *)bottomView {
    [self.fsaezAd loadAdWithWindow:window bottomView:bottomView];
}
- (void)loadWithWin:(UIWindow *)window bottom:(nullable UIView *)bottomView maxWait:(NSTimeInterval)maxWaitTime {
    [self.fsaezAd loadAdWithWindow:window bottomView:bottomView maxWaitTime:maxWaitTime];
}

/// 进入广告场景
/// @param sceneId 场景ID 可以为nil
- (void)enterScn:(nullable NSString *)sceneId {
    [self.fsaezAd entryAdScenario:sceneId];
}

/// 显示广告
- (void)showAd {
    [self.fsaezAd show];
}
- (void)showWithScnId:(nullable NSString *)sceneId {
    [self.fsaezAd showWithSceneId:sceneId];
}

/// 指定原生开屏的渲染模版 展示广告
/// @param renderingViewClass renderingViewClass 仅对Waterfall中的原生广告生效
- (void)showWithRendClass:(Class)renderingViewClass {
    [self.fsaezAd showWithRenderingViewClass:renderingViewClass];
}
- (void)showWithRendClass:(Class)renderingViewClass scnId:(nullable NSString *)sceneId {
    [self.fsaezAd showWithRenderingViewClass:renderingViewClass sceneId:sceneId];
}

/// 指定原生开屏的renderer 展示广告
/// @param renderer 自定义renderer 仅对Waterfall中的原生广告生效
- (void)showWithRend:(TradPlusNativeRenderer *)renderer {
    [self.fsaezAd showWithRenderer:renderer];
}
- (void)showWithRend:(TradPlusNativeRenderer *)renderer scnId:(nullable NSString *)sceneId {
    [self.fsaezAd showWithRenderer:renderer sceneId:sceneId];
}

///指定 TradPlusAdSplashObject 展示广告
- (void)showWithSplashObj:(TradPlusAdSplashObject *)splashObject {
    [self.fsaezAd showWithSplashObject:splashObject];
}
- (void)showWithSplashObj:(TradPlusAdSplashObject *)splashObject scnId:(nullable NSString *)sceneId {
    [self.fsaezAd showWithSplashObject:splashObject sceneId:sceneId];
}

/// 设置 原生开屏 模版渲染的尺寸 需要在load之前设置
/// 默认使用 屏幕最短边正方形size进行渲染
/// @param size 尺寸
- (void)setZxcvSize:(CGSize)size {
    [self.fsaezAd setTemplateRenderSize:size];
}

- (void)openAutoLoad {
    [self.fsaezAd openAutoLoadCallback];
}

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdSplashObject *)getZxcvSplashObj {
    return [self.fsaezAd getReadySplashObject];
}

//新增API 用户在展示时传入window
//Sigmob开屏点击后无法弹出落地页
- (void)loadWithBottom:(nullable UIView *)bottomView {
    [self.fsaezAd loadAdWithBottomView:bottomView];
}
- (void)loadWithBottom:(nullable UIView *)bottomView maxWait:(NSTimeInterval)maxWaitTime {
    [self.fsaezAd loadAdWithBottomView:bottomView maxWaitTime:maxWaitTime];
}
- (void)showWithWin:(UIWindow *)window {
    [self.fsaezAd showWithWindow:window];
}
- (void)showWithWin:(UIWindow *)window scnId:(nullable NSString *)sceneId {
    [self.fsaezAd showWithWindow:window sceneId:sceneId];
}
- (void)showWithWin:(UIWindow *)window rendClass:(Class)renderingViewClass {
    [self.fsaezAd showWithWindow:window renderingViewClass:renderingViewClass];
}
- (void)showWithWin:(UIWindow *)window rendClass:(Class)renderingViewClass scnId:(nullable NSString *)sceneId{
    [self.fsaezAd showWithWindow:window renderingViewClass:renderingViewClass sceneId:sceneId];
}
- (void)showWithWin:(UIWindow *)window rend:(TradPlusNativeRenderer *)renderer {
    [self.fsaezAd showWithWindow:window renderer:renderer];
}
- (void)showWithWin:(UIWindow *)window rend:(TradPlusNativeRenderer *)renderer scnId:(nullable NSString *)sceneId {
    [self.fsaezAd showWithWindow:window renderer:renderer sceneId:sceneId];
}
- (void)showWithWin:(UIWindow *)window splashObj:(TradPlusAdSplashObject *)splashObject {
    [self.fsaezAd showWithWindow:window splashObject:splashObject];
}
- (void)showWithWin:(UIWindow *)window splashObj:(TradPlusAdSplashObject *)splashObject scnId:(nullable NSString *)sceneId {
    [self.fsaezAd showWithWindow:window splashObject:splashObject sceneId:sceneId];
}

//========================delegate============================//
///AD加载完成 首个广告源加载成功时回调 一次加载流程只会回调一次
- (void)tpSplashAdLoaded:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdLoaded:)]) {
        [self.zxcvDelegate pubeasySplashAdLoaded:adInfo];
    }
}

///AD展现
- (void)tpSplashAdImpression:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdImpression:)]) {
        [self.zxcvDelegate pubeasySplashAdImpression:adInfo];
    }
}

///AD展现失败
- (void)tpSplashAdShow:(NSDictionary *)adInfo didFailWithError:(NSError *)error {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdShow:didFailWithError:)]) {
        [self.zxcvDelegate pubeasySplashAdShow:adInfo didFailWithError:error];
    }
}

///AD被点击
- (void)tpSplashAdClicked:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdClicked:)]) {
        [self.zxcvDelegate pubeasySplashAdClicked:adInfo];
    }
}

///AD关闭
- (void)tpSplashAdDismissed:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdDismissed:)]) {
        [self.zxcvDelegate pubeasySplashAdDismissed:adInfo];
    }
}

///AD加载失败
- (void)tpSplashAdLoadFailWithError:(NSError *)error adInfo:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdLoadFailWithError:adInfo:)]) {
        [self.zxcvDelegate pubeasySplashAdLoadFailWithError:error adInfo:adInfo];
    }
}

///开始加载流程
- (void)tpSplashAdStartLoad:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdStartLoad:)]) {
        [self.zxcvDelegate pubeasySplashAdStartLoad:adInfo];
    }
}

///当每个广告源开始加载时会都会回调一次。
- (void)tpSplashAdOneLayerStartLoad:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdOneLayerStartLoad:)]) {
        [self.zxcvDelegate pubeasySplashAdOneLayerStartLoad:adInfo];
    }
}

///调用load之后如果收到此回调，说明广告位仍处于加载状态，无法触发新的一轮广告加载。
- (void)tpSplashAdIsLoading:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdIsLoading:)]) {
        [self.zxcvDelegate pubeasySplashAdIsLoading:adInfo];
    }
}

///bidding开始
- (void)tpSplashAdBidStart:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdBidStart:)]) {
        [self.zxcvDelegate pubeasySplashAdBidStart:adInfo];
    }
}

///bidding结束 error = nil 表示成功
- (void)tpSplashAdBidEnd:(NSDictionary *)adInfo error:(nullable NSError *)error {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdBidEnd:error:)]) {
        [self.zxcvDelegate pubeasySplashAdBidEnd:adInfo error:error];
    }
}

///当每个广告源加载成功后会都会回调一次。
- (void)tpSplashAdOneLayerLoaded:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdOneLayerLoaded:)]) {
        [self.zxcvDelegate pubeasySplashAdOneLayerLoaded:adInfo];
    }
}

///当每个广告源加载失败后会都会回调一次，返回三方源的错误信息
- (void)tpSplashAdOneLayerLoad:(NSDictionary *)adInfo didFailWithError:(NSError *)error {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdOneLayerLoad:didFailWithError:)]) {
        [self.zxcvDelegate pubeasySplashAdOneLayerLoad:adInfo didFailWithError:error];
    }
}

///加载流程全部结束
- (void)tpSplashAdAllLoaded:(BOOL)success adInfo:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdAllLoaded:adInfo:)]) {
        [self.zxcvDelegate pubeasySplashAdAllLoaded:success adInfo:adInfo];
    }
}

// 跳过
- (void)tpSplashAdSkip:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdSkip:)]) {
        [self.zxcvDelegate pubeasySplashAdSkip:adInfo];
    }
}
//  点睛开始
- (void)tpSplashAdZoomOutViewShow:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdZoomOutViewShow:)]) {
        [self.zxcvDelegate pubeasySplashAdZoomOutViewShow:adInfo];
    }
}
// 点睛关闭
- (void)tpSplashAdZoomOutViewClose:(NSDictionary *)adInfo {
    if (self.zxcvDelegate && [self.zxcvDelegate respondsToSelector:@selector(pubeasySplashAdZoomOutViewClose:)]) {
        [self.zxcvDelegate pubeasySplashAdZoomOutViewClose:adInfo];
    }
}

@end
