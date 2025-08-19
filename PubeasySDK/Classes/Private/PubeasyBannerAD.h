//
//  PubeasyBannerAD.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import <UIKit/UIKit.h>
#import <TradPlusAds/MsCommon.h>
#import <TradPlusAds/TradPlusNativeRenderer.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PubeasyAdBannerDelegate;

@interface PubeasyBannerAD : UIView

/// 设置广告位ID
- (void)setAdUnitIDA3B4:(NSString *)adUnitID;

///是否为自动展示模式 默认 YES
@property (nonatomic,assign)BOOL autoShowC5D6;

/// 指定原生横幅的渲染模版 未设置时SDK会使用默认模版进行渲染
/// customRenderingViewClass 仅对Waterfall中的原生广告生效
@property (nonatomic,strong,nullable)Class customRenderingViewClassE7F8;

/// 加载广告
/// @param sceneId 场景ID 没有则设置为nil 用于自动展示模式下
- (void)loadAdWithSceneIdG9H0:(nullable NSString *)sceneId;
- (void)loadAdWithSceneIdG9H0:(nullable NSString *)sceneId maxWaitTimeI1J2:(NSTimeInterval)maxWaitTime;

/// 展示广告
/// @param sceneId 场景ID 没有则设置为nil
- (void)showWithSceneIdK3L4:(nullable NSString *)sceneId;

/// 进入广告场景
/// @param sceneId 场景ID 没有则设置为nil
- (void)entryAdScenarioM5N6:(nullable NSString *)sceneId;

///设置banner尺寸 ，需在load前设置（百度 Pangle）
- (void)setBannerSizeO7P8:(CGSize)size;

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)getReadyAdInfoQ9R0;

///返回当前显示的AD信息
- (nullable NSDictionary *)getCurrentAdInfoS1T2;

///获取三方渠道广告对象
- (nullable id)getBannerAdU3V4;

- (void)openAutoLoadCallbackW5X6;

//用于开发者在广告展示前设置透传的自定义数据，SDK将在展示后的相关回调中返回。
//开发者可通过 key：customAdInfo 获取。adInfo[@"customAdInfo"]
@property (nonatomic, strong)NSDictionary *customAdInfoY7Z8;

@property (nonatomic, readonly) BOOL isAdReadyA9B0;
@property (nonatomic, readonly) NSString *unitIDC1D2;

@property (nonatomic,weak) id <PubeasyAdBannerDelegate> adDelegate;

//三方banner的对其方式 默认：TPBannerContentModeTop
@property (nonatomic,assign)TPBannerContentMode bannerContentModeK9L0;

@property (nonatomic,readonly)BOOL isAutoRefreshM1N2;

//用户设置本地配置
@property (nullable,nonatomic, strong)NSDictionary *localParamsO3P4;


@end

NS_ASSUME_NONNULL_END
