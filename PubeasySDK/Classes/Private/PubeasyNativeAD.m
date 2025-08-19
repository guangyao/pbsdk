//
//  PubeasyNativeAD.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import "PubeasyNativeAD.h"
#import <TradPlusAds/TradPlusAdNative.h>
#import "../Public/Native/PubeasyNativeRenderer.h"
#import "../Public/Native/PubeasyAdNative.h"

@interface PubeasyNativeAD ()<TradPlusADNativeDelegate>

@property (nonatomic, strong) TradPlusAdNative *naffAd;

@end

@implementation PubeasyNativeAD

- (NSDictionary *)passThroughAdData {
    return [self.naffAd customAdInfo];
}
- (void)setPassThroughAdData:(NSDictionary *)passThroughAdData {
    [self.naffAd setCustomAdInfo:passThroughAdData];
}

- (TPTemplateContentMode)templateLayoutMode {
    return [self.naffAd templateContentMode];
}
- (void)setTemplateLayoutMode:(TPTemplateContentMode)templateLayoutMode {
    [self.naffAd setTemplateContentMode:templateLayoutMode];
}

- (BOOL)notifyAfterDownload {
    return [self.naffAd finishDownload];
}
- (void)setNotifyAfterDownload:(BOOL)notifyAfterDownload {
    [self.naffAd setFinishDownload:notifyAfterDownload];
}

- (BOOL)isAdAvailable {
    return [self.naffAd isAdReady];
}
- (NSString *)adSlotID {
    return [self.naffAd unitID];
}
- (NSInteger)cachedAdCount {
    return [self.naffAd readyAdCount];
}

- (NSDictionary *)localUserConfig {
    return [self.naffAd localParams];
}
- (void)setLocalUserConfig:(NSDictionary *)localUserConfig {
    [self.naffAd setLocalParams:localUserConfig];
}

- (TradPlusAdNative *)naffAd {
    if (!_naffAd) {
        _naffAd = [[TradPlusAdNative alloc] init];
        _naffAd.delegate = self;
    }
    return _naffAd;
}

/// 设置广告位ID
/// @param adUnitID  广告位ID
- (void)setupAdSlotID:(NSString *)adUnitID {
    [self.naffAd setAdUnitID:adUnitID];
}

/// 加载广告
- (void)triggerAdLoad {
    [self.naffAd loadAd];
}
- (void)triggerAdLoadWithMaxWait:(NSTimeInterval)maxWaitTime {
    [self.naffAd loadAdWithMaxWaitTime:maxWaitTime];
}

/// 加载广告并设置缓存个数
/// @param adsCount 缓存个数
- (void)loadAdsWithCount:(NSInteger)adsCount {
    [self.naffAd loadAds:adsCount];
}
- (void)loadAdsWithCount:(NSInteger)adsCount maxWait:(NSTimeInterval)maxWaitTime {
    [self.naffAd loadAds:adsCount maxWaitTime:maxWaitTime];
}

/// 显示广告
/// @param renderingViewClass renderingViewClass
/// @param subView 渲染后会添加到此view上
/// @param sceneId 场景ID 没有则设置为nil
- (void)displayAdWithRenderClass:(Class)renderingViewClass
                         subView:(UIView *)subView
                         sceneID:(nullable NSString *)sceneId {
    [self.naffAd showADWithRenderingViewClass:renderingViewClass subview:subView sceneId:sceneId];
}

/// 显示广告
/// @param renderer 自定义renderer
/// @param subView 渲染后会添加到此view上
/// @param sceneId 场景ID 没有则设置为nil
- (void)displayAdWithRenderer:(PubeasyNativeRenderer *)renderer
                      subView:(UIView *)subView
                      sceneID:(nullable NSString *)sceneId {
    TradPlusNativeRenderer *render1 = (TradPlusNativeRenderer *)renderer;
    [self.naffAd showADWithNativeRenderer:render1 subview:subView sceneId:sceneId];
}

/// 进入广告场景
/// @param sceneId 场景ID 没有则设置为nil
- (void)enterAdScene:(nullable NSString *)sceneId {
    [self.naffAd entryAdScenario:sceneId];
}

/// 设置模版渲染的尺寸 需要在load之前设置
/// Mintegral Pangle GDTMob KuaiShou 的模版渲染需要设置
/// @param size 尺寸
- (void)setTemplateRenderDimension:(CGSize)size {
    [self.naffAd setTemplateRenderSize:size];
}

- (void)activateAutoLoadCallback {
    [self.naffAd openAutoLoadCallback];
}

// 用于移除当前展示的原生广告对象的引用
- (void)cleanupAdReference {
    [self.naffAd clear];
}

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getNextReadyAdInfo {
    return [self.naffAd getReadyAdInfo];
}

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentDisplayAdInfo {
    return [self.naffAd getCurrentAdInfo];
}

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdNativeObject *)fetchReadyNativeAd {
    return [self.naffAd getReadyNativeObject];
}


//======================delegate==========================//
///AD加载完成 首个广告源加载成功时回调 一次加载流程只会回调一次
- (void)tpNativeAdLoaded:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdLoaded:)]) {
        [self.adDelegate pubeasyNativeAdLoaded:adInfo];
    }
}

///AD展现
- (void)tpNativeAdImpression:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdImpression:)]) {
        [self.adDelegate pubeasyNativeAdImpression:adInfo];
    }
}

///AD展现失败
- (void)tpNativeAdShow:(NSDictionary *)adInfo didFailWithError:(NSError *)error {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdShow:didFailWithError:)]) {
        [self.adDelegate pubeasyNativeAdShow:adInfo didFailWithError:error];
    }
}

///AD被点击
- (void)tpNativeAdClicked:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdClicked:)]) {
        [self.adDelegate pubeasyNativeAdClicked:adInfo];
    }
}

///AD加载失败
- (void)tpNativeAdLoadFailWithError:(NSError *)error adInfo:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdLoadFailWithError:adInfo:)]) {
        [self.adDelegate pubeasyNativeAdLoadFailWithError:error adInfo:adInfo];
    }
}

///为三方提供rootviewController 用于点击广告后的操作
- (nullable UIViewController *)viewControllerForPresentingModalView {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(viewControllerForPresentingModalView)]) {
        return [self.adDelegate viewControllerForPresentingModalView];
    }
    return nil;
}

/// 开始加载流程
- (void)tpNativeAdStartLoad:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdStartLoad:)]) {
        [self.adDelegate pubeasyNativeAdStartLoad:adInfo];
    }
}

///当每个广告源开始加载时会都会回调一次。
- (void)tpNativeAdOneLayerStartLoad:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdOneLayerStartLoad:)]) {
        [self.adDelegate pubeasyNativeAdOneLayerStartLoad:adInfo];
    }
}

///调用load之后如果收到此回调，说明广告位仍处于加载状态，无法触发新的一轮广告加载。
- (void)tpNativeAdIsLoading:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdIsLoading:)]) {
        [self.adDelegate pubeasyNativeAdIsLoading:adInfo];
    }
}

///AD被关闭
- (void)tpNativeAdClose:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdClose:)]) {
        [self.adDelegate pubeasyNativeAdClose:adInfo];
    }
}

///bidding开始
- (void)tpNativeAdBidStart:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdBidStart:)]) {
        [self.adDelegate pubeasyNativeAdBidStart:adInfo];
    }
}

///bidding结束 error = nil 表示成功
- (void)tpNativeAdBidEnd:(NSDictionary *)adInfo error:(nullable NSError *)error {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdBidEnd:error:)]) {
        [self.adDelegate pubeasyNativeAdBidEnd:adInfo error:error];
    }
}

///当每个广告源加载成功后会都会回调一次。
- (void)tpNativeAdOneLayerLoaded:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdOneLayerLoaded:)]) {
        [self.adDelegate pubeasyNativeAdOneLayerLoaded:adInfo];
    }
}

///当每个广告源加载失败后会都会回调一次，返回三方源的错误信息
- (void)tpNativeAdOneLayerLoad:(NSDictionary *)adInfo didFailWithError:(NSError *)error {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdOneLayerLoad:didFailWithError:)]) {
        [self.adDelegate pubeasyNativeAdOneLayerLoad:adInfo didFailWithError:error];
    }
}

///加载流程全部结束
- (void)tpNativeAdAllLoaded:(BOOL)success adInfo:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdAllLoaded:adInfo:)]) {
        [self.adDelegate pubeasyNativeAdAllLoaded:success adInfo:adInfo];
    }
}

///视频贴片类型播放完成回调
- (void)tpNativePasterDidPlayFinished:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativePasterDidPlayFinished:)]) {
        [self.adDelegate pubeasyNativePasterDidPlayFinished:adInfo];
    }
}

///开始播放
- (void)tpNativeAdVideoPlayStart:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdVideoPlayStart:)]) {
        [self.adDelegate pubeasyNativeAdVideoPlayStart:adInfo];
    }
}

///播放结束
- (void)tpNativeAdVideoPlayEnd:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdVideoPlayEnd:)]) {
        [self.adDelegate pubeasyNativeAdVideoPlayEnd:adInfo];
    }
}

///dislike  当前支持穿山甲，Gromore，百度，快手，Sigmob平台
///tpNativeAdDisLikeInfo 会替代这些平台的 tpNativeAdClose回调，如无特殊需求可以不设置。
///dislikeInfo[@"dislikeInfo"]：三方源返回的dislike信息
///dislikeInfo[@"dislikeObject"]：三方源返回的对象信息，可能为nil
- (void)tpNativeAdDisLikeInfo:(NSDictionary *)dislikeInfo adInfo:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyNativeAdDisLikeInfo:adInfo:)]) {
        [self.adDelegate pubeasyNativeAdDisLikeInfo:dislikeInfo adInfo:adInfo];
    }
}


@end
