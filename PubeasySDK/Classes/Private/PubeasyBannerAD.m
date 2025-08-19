//
//  PubeasyBannerAD.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import "PubeasyBannerAD.h"
#import <TradPlusAds/TradPlusAdBanner.h>
#import "../Public/Banner/PubeasyAdBanner.h"

@interface PubeasyBannerAD () <TradPlusADBannerDelegate>

@property (nonatomic, strong) TradPlusAdBanner *brefAd;

@end

@implementation PubeasyBannerAD

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupBView];
    }
    return self;
}

- (void)setupBView {
    self.brefAd.translatesAutoresizingMaskIntoConstraints = NO; // 必须设置为NO才能使用AutoLayout
    [self addSubview:self.brefAd];
    
    // 3. 添加约束 - 让B view的四个边完全匹配A view的bounds
    [NSLayoutConstraint activateConstraints:@[
        // 左边距 = A view的左边距
        [self.brefAd.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        // 右边距 = A view的右边距
        [self.brefAd.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        // 顶部边距 = A view的顶部边距
        [self.brefAd.topAnchor constraintEqualToAnchor:self.topAnchor],
        // 底部边距 = A view的底部边距
        [self.brefAd.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
    // 设置自动调整 mask
    self.brefAd.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (BOOL)autoShowC5D6 {
    return [self.brefAd autoShow];
}
- (void)setAutoShowC5D6:(BOOL)autoShowC5D6 {
    [self.brefAd setAutoShow:autoShowC5D6];
}

- (Class)customRenderingViewClassE7F8 {
    return [self.brefAd customRenderingViewClass];
}

- (void)setCustomRenderingViewClassE7F8:(Class)customRenderingViewClassE7F8 {
    [self.brefAd setCustomRenderingViewClass:customRenderingViewClassE7F8];
}

- (NSDictionary *)customAdInfoY7Z8 {
    return [self.brefAd customAdInfo];
}
- (void)setCustomAdInfoY7Z8:(NSDictionary *)customAdInfoY7Z8 {
    [self.brefAd setCustomAdInfo:customAdInfoY7Z8];
}


- (BOOL)isAdReadyA9B0 {
    return [self.brefAd isAdReady];
}
- (NSString *)unitIDC1D2 {
    return [self.brefAd unitID];
}
- (BOOL)isAutoRefreshM1N2 {
    return [self.brefAd isAutoRefresh];
}

- (NSDictionary *)localParamsO3P4 {
    return [self.brefAd localParams];
}
- (void)setLocalParamsO3P4:(NSDictionary *)localParamsO3P4 {
    [self.brefAd setLocalParams:localParamsO3P4];
}

- (TradPlusAdBanner *)brefAd {
    if (!_brefAd) {
        _brefAd = [[TradPlusAdBanner alloc] init];
        _brefAd.delegate = self;
    }
    return _brefAd;
}

/// 设置广告位ID
- (void)setAdUnitIDA3B4:(NSString *)adUnitID {
    [self.brefAd setAdUnitID:adUnitID];
}

/// 加载广告
/// @param sceneId 场景ID 没有则设置为nil 用于自动展示模式下
- (void)loadAdWithSceneIdG9H0:(nullable NSString *)sceneId {
    [self.brefAd loadAdWithSceneId:sceneId];
}
- (void)loadAdWithSceneIdG9H0:(nullable NSString *)sceneId maxWaitTimeI1J2:(NSTimeInterval)maxWaitTime {
    [self.brefAd loadAdWithSceneId:sceneId maxWaitTime:maxWaitTime];
}

/// 展示广告
/// @param sceneId 场景ID 没有则设置为nil
- (void)showWithSceneIdK3L4:(nullable NSString *)sceneId {
    [self.brefAd showWithSceneId:sceneId];
}

/// 进入广告场景
/// @param sceneId 场景ID 没有则设置为nil
- (void)entryAdScenarioM5N6:(nullable NSString *)sceneId {
    [self.brefAd entryAdScenario:sceneId];
}

///设置banner尺寸 ，需在load前设置（百度 Pangle）
- (void)setBannerSizeO7P8:(CGSize)size {
    [self.brefAd setBannerSize:size];
}

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getReadyAdInfoQ9R0 {
    return [self.brefAd getReadyAdInfo];
}

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentAdInfoS1T2 {
    return [self.brefAd getCurrentAdInfo];
}

///获取三方渠道广告对象
- (nullable id)getBannerAdU3V4 {
    return [self.brefAd getBannerAd];
}

- (void)openAutoLoadCallbackW5X6 {
    [self.brefAd openAutoLoadCallback];
}


//========================delegate===========================//
///AD加载完成 首个广告源加载成功时回调 一次加载流程只会回调一次
- (void)tpBannerAdLoaded:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdLoaded:)]) {
        [self.adDelegate pubeasyBannerAdLoaded:adInfo];
    }
}

///AD展现
- (void)tpBannerAdImpression:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdImpression:)]) {
        [self.adDelegate pubeasyBannerAdImpression:adInfo];
    }
}

///AD展现失败
- (void)tpBannerAdShow:(NSDictionary *)adInfo didFailWithError:(NSError *)error {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdShow:didFailWithError:)]) {
        [self.adDelegate pubeasyBannerAdShow:adInfo didFailWithError:error];
    }
}

///AD被点击
- (void)tpBannerAdClicked:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdClicked:)]) {
        [self.adDelegate pubeasyBannerAdClicked:adInfo];
    }
}

///AD加载失败
///tpBannerAdOneLayerLoad:didFailWithError：返回三方源的错误信息
- (void)tpBannerAdLoadFailWithError:(NSError *)error adInfo:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdLoadFailWithError:adInfo:)]) {
        [self.adDelegate pubeasyBannerAdLoadFailWithError:error adInfo:adInfo];
    }
}

// 替代原 @property (nonatomic,strong,nullable)TradPlusNativeRenderer *customRenderer;
// 指定原生横幅的renderer 未设置时SDK会使用默认模版进行渲染
// customRenderer 仅对Waterfall中的原生广告生效
// 注：请不要强引用 customRenderer，这样会导致原生横幅无法释放。
- (nullable TradPlusNativeRenderer *)tpBannerCustomRenderer {
    return [self.adDelegate pubeasyBannerCustomRenderer];
}

///为三方提供rootviewController 用于点击广告后的操作
- (nullable UIViewController *)viewControllerForPresentingModalView {
    return [self.adDelegate viewControllerForPresentingModalView];
}

/// 开始加载流程
- (void)tpBannerAdStartLoad:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdStartLoad:)]) {
        [self.adDelegate pubeasyBannerAdStartLoad:adInfo];
    }
}

///当每个广告源开始加载时会都会回调一次。
- (void)tpBannerAdOneLayerStartLoad:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdOneLayerStartLoad:)]) {
        [self.adDelegate pubeasyBannerAdOneLayerStartLoad:adInfo];
    }
}

///调用load之后如果收到此回调，说明广告位仍处于加载状态，无法触发新的一轮广告加载。
- (void)tpBannerAdIsLoading:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdIsLoading:)]) {
        [self.adDelegate pubeasyBannerAdIsLoading:adInfo];
    }
}

///bidding开始
- (void)tpBannerAdBidStart:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdBidStart:)]) {
        [self.adDelegate pubeasyBannerAdBidStart:adInfo];
    }
}

///bidding结束 error = nil 表示成功
- (void)tpBannerAdBidEnd:(NSDictionary *)adInfo error:(nullable NSError *)error {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdBidEnd:error:)]) {
        [self.adDelegate pubeasyBannerAdBidEnd:adInfo error:error];
    }
}

///当每个广告源加载成功后会都会回调一次。
- (void)tpBannerAdOneLayerLoaded:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdOneLayerLoaded:)]) {
        [self.adDelegate pubeasyBannerAdOneLayerLoaded:adInfo];
    }
}

///当每个广告源加载失败后会都会回调一次，返回三方源的错误信息
- (void)tpBannerAdOneLayerLoad:(NSDictionary *)adInfo didFailWithError:(NSError *)error {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdOneLayerLoad:didFailWithError:)]) {
        [self.adDelegate pubeasyBannerAdOneLayerLoad:adInfo didFailWithError:error];
    }
}

///加载流程全部结束
- (void)tpBannerAdAllLoaded:(BOOL)success adInfo:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdAllLoaded:adInfo:)]) {
        [self.adDelegate pubeasyBannerAdAllLoaded:success adInfo:adInfo];
    }
}

///三方关闭按钮触发时的回调
- (void)tpBannerAdClose:(NSDictionary *)adInfo {
    if (self.adDelegate && [self.adDelegate respondsToSelector:@selector(pubeasyBannerAdClose:)]) {
        [self.adDelegate pubeasyBannerAdClose:adInfo];
    }
}

@end
