//
//  PubeasyAdBanner.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import "PubeasyAdBanner.h"
//#import "PubeasyBannerAD.h"
#import "../Private/PubeasyBannerAD.h"

@interface PubeasyAdBanner()

@property (nonatomic, strong) PubeasyBannerAD *bannerAd;

@end

@implementation PubeasyAdBanner

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupBView];
    }
    return self;
}

- (void)setupBView {
    self.bannerAd.translatesAutoresizingMaskIntoConstraints = NO; // 必须设置为NO才能使用AutoLayout
    [self addSubview:self.bannerAd];
    
    // 3. 添加约束 - 让B view的四个边完全匹配A view的bounds
    [NSLayoutConstraint activateConstraints:@[
        // 左边距 = A view的左边距
        [self.bannerAd.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        // 右边距 = A view的右边距
        [self.bannerAd.trailingAnchor constraintEqualToAnchor:self.trailingAnchor],
        // 顶部边距 = A view的顶部边距
        [self.bannerAd.topAnchor constraintEqualToAnchor:self.topAnchor],
        // 底部边距 = A view的底部边距
        [self.bannerAd.bottomAnchor constraintEqualToAnchor:self.bottomAnchor]
    ]];
    // 设置自动调整 mask
    self.bannerAd.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (BOOL)autoShow {
    return [self.bannerAd autoShowC5D6];
}
- (void)setAutoShow:(BOOL)autoShow {
    [self.bannerAd setAutoShowC5D6:autoShow];
}

- (Class)customRenderingViewClass {
    return [self.bannerAd customRenderingViewClassE7F8];
}
- (void)setCustomRenderingViewClass:(Class)customRenderingViewClass {
    [self.bannerAd setCustomRenderingViewClassE7F8:customRenderingViewClass];
}

- (NSDictionary *)customAdInfo {
    return [self.bannerAd customAdInfoY7Z8];
}
- (void)setCustomAdInfo:(NSDictionary *)customAdInfo {
    [self.bannerAd setCustomAdInfoY7Z8:customAdInfo];
}

- (BOOL)isAdReady {
    return self.bannerAd.isAdReadyA9B0;
}
- (NSString *)unitID {
    return self.bannerAd.unitIDC1D2;
}

- (TPBannerContentMode)bannerContentMode {
    return [self.bannerAd bannerContentModeK9L0];
}
- (void)setBannerContentMode:(TPBannerContentMode)bannerContentMode {
    [self.bannerAd setBannerContentModeK9L0:bannerContentMode];
}

- (BOOL)isAutoRefresh {
    return self.bannerAd.isAutoRefreshM1N2;
}

- (NSDictionary *)localParams {
    return [self.bannerAd localParamsO3P4];
}
- (void)setLocalParams:(NSDictionary *)localParams {
    [self.bannerAd setLocalParamsO3P4:localParams];
}

- (PubeasyBannerAD *)bannerAd {
    if (!_bannerAd) {
        _bannerAd = [[PubeasyBannerAD alloc] init];        
        _bannerAd.adDelegate = self.delegate;
    }
    return _bannerAd;
}


/// 设置广告位ID
- (void)setAdUnitID:(NSString *)adUnitID {
    [self.bannerAd setAdUnitIDA3B4:adUnitID];
}

/// 加载广告
/// @param sceneId 场景ID 没有则设置为nil 用于自动展示模式下
- (void)loadAdWithSceneId:(nullable NSString *)sceneId {
    [self.bannerAd loadAdWithSceneIdG9H0:sceneId];
}
- (void)loadAdWithSceneId:(nullable NSString *)sceneId maxWaitTime:(NSTimeInterval)maxWaitTime {
    [self.bannerAd loadAdWithSceneIdG9H0:sceneId maxWaitTimeI1J2:maxWaitTime];
}

/// 展示广告
/// @param sceneId 场景ID 没有则设置为nil
- (void)showWithSceneId:(nullable NSString *)sceneId {
    [self.bannerAd showWithSceneIdK3L4:sceneId];
}

/// 进入广告场景
/// @param sceneId 场景ID 没有则设置为nil
- (void)entryAdScenario:(nullable NSString *)sceneId {
    [self.bannerAd entryAdScenarioM5N6:sceneId];
}

///设置banner尺寸 ，需在load前设置（百度 Pangle）
- (void)setBannerSize:(CGSize)size {
    [self.bannerAd setBannerSizeO7P8:size];
}

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getReadyAdInfo {
    return [self.bannerAd getReadyAdInfoQ9R0];
}

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentAdInfo {
    return [self.bannerAd getCurrentAdInfoS1T2];
}

///获取三方渠道广告对象
- (nullable id)getBannerAd {
    return [self.bannerAd getBannerAdU3V4];
}

- (void)openAutoLoadCallback {
    return [self.bannerAd openAutoLoadCallbackW5X6];
}

@end
