//
//  PubeasyAdNative.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import "PubeasyAdNative.h"
//#import "PubeasyNativeAD.h"
#import "../Private/PubeasyNativeAD.h"
#import "PubeasyNativeRenderer.h"

@interface PubeasyAdNative ()

@property (nonatomic,strong) PubeasyNativeAD *nativeAd;

@end

@implementation PubeasyAdNative

- (NSDictionary *)customAdInfo {
    return [self.nativeAd passThroughAdData];
}
- (void)setCustomAdInfo:(NSDictionary *)customAdInfo {
    [self.nativeAd setPassThroughAdData:customAdInfo];
}

- (TPTemplateContentMode)templateLayoutMode {
    return [self.nativeAd templateLayoutMode];
}
- (void)setTemplateLayoutMode:(TPTemplateContentMode)templateLayoutMode {
    [self.nativeAd setTemplateLayoutMode:templateLayoutMode];
}

- (BOOL)finishDownload {
    return [self.nativeAd notifyAfterDownload];
}
- (void)setFinishDownload:(BOOL)finishDownload {
    [self.nativeAd setNotifyAfterDownload:finishDownload];
}

- (BOOL)isAdReady {
    return [self.nativeAd isAdAvailable];
}
- (NSString *)unitID {
    return [self.nativeAd adSlotID];
}
- (NSInteger)readyAdCount {
    return [self.nativeAd cachedAdCount];
}

- (NSDictionary *)localParams {
    return [self.nativeAd localUserConfig];
}
- (void)setLocalParams:(NSDictionary *)localParams {
    [self.nativeAd setLocalUserConfig:localParams];
}

- (PubeasyNativeAD *)nativeAd {
    if (!_nativeAd) {
        _nativeAd = [[PubeasyNativeAD alloc] init];
        
        _nativeAd.adDelegate = self.delegate;
    }
    return _nativeAd;
}

/// 设置广告位ID
/// @param adUnitID  广告位ID
- (void)setAdUnitID:(NSString *)adUnitID {
    [self.nativeAd setupAdSlotID:adUnitID];
}

/// 加载广告
- (void)loadAd {
    [self.nativeAd triggerAdLoad];
}
- (void)loadAdWithMaxWaitTime:(NSTimeInterval)maxWaitTime {
    [self.nativeAd triggerAdLoadWithMaxWait:maxWaitTime];
}

/// 加载广告并设置缓存个数
/// @param adsCount 缓存个数
- (void)loadAds:(NSInteger)adsCount {
    [self.nativeAd loadAdsWithCount:adsCount];
}
- (void)loadAds:(NSInteger)adsCount maxWaitTime:(NSTimeInterval)maxWaitTime {
    [self.nativeAd loadAdsWithCount:adsCount maxWait:maxWaitTime];
}



/// 显示广告
/// @param renderingViewClass renderingViewClass
/// @param subView 渲染后会添加到此view上
/// @param sceneId 场景ID 没有则设置为nil
- (void)showADWithRenderingViewClass:(Class)renderingViewClass
                             subview:(UIView *)subView
                             sceneId:(nullable NSString *)sceneId {
    [self.nativeAd displayAdWithRenderClass:renderingViewClass subView:subView sceneID:sceneId];
}

/// 显示广告
/// @param renderer 自定义renderer
/// @param subView 渲染后会添加到此view上
/// @param sceneId 场景ID 没有则设置为nil
- (void)showADWithNativeRenderer:(PubeasyNativeRenderer *)renderer
                         subview:(UIView *)subView
                         sceneId:(nullable NSString *)sceneId {
    [self.nativeAd displayAdWithRenderer:renderer subView:subView sceneID:sceneId];
}

/// 进入广告场景
/// @param sceneId 场景ID 没有则设置为nil
- (void)entryAdScenario:(nullable NSString *)sceneId {
    [self.nativeAd enterAdScene:sceneId];
}

/// 设置模版渲染的尺寸 需要在load之前设置
/// Mintegral Pangle GDTMob KuaiShou 的模版渲染需要设置
/// @param size 尺寸
- (void)setTemplateRenderSize:(CGSize)size {
    [self.nativeAd setTemplateRenderDimension:size];
}

- (void)openAutoLoadCallback {
    [self.nativeAd activateAutoLoadCallback];
}

// v9.7.0新增
// 用于移除当前展示的原生广告对象的引用
- (void)clear {
    [self.nativeAd cleanupAdReference];
}

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getReadyAdInfo {
    return [self.nativeAd getNextReadyAdInfo];
}

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentAdInfo {
    return [self.nativeAd getCurrentDisplayAdInfo];
}

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdNativeObject *)getReadyNativeObject {
    return [self.nativeAd fetchReadyNativeAd];
}

@end
