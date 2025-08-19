//
//  PubeasyInterAD.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/17.
//

#import <Foundation/Foundation.h>
#import <TradPlusAds/TradPlusAdInterstitialObject.h>

@protocol PubeasyAdInterstitialDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface PubeasyInterAD : NSObject

/// 设置广告位ID
- (void)ytrt567SetAdUnit:(NSString *)adUnitID;

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)mnbv987GetReadyAdInfo;

///返回当前显示的AD信息
- (nullable NSDictionary *)ghjk345GetCurrentAdInfo;

////获取三方渠道广告对象
- (nullable id)fghj456GetInterstitialAd;

///加载广告
- (void)cvbn789LoadAd;
- (void)zxcv123LoadAdWithMaxWait:(NSTimeInterval)maxWaitTime;

/// 显示广告
/// @param sceneId 场景ID 可以为nil
- (void)asdf234ShowAdWithScene:(nullable NSString *)sceneId;

/// 显示广告
/// @param rootViewController rootViewController
/// 当传入nil时SDK会自行获取key windows 的 rootViewController
/// @param sceneId 场景ID 可以为nil
- (void)qwer456ShowAdFromRoot:(nullable UIViewController *)rootViewController scene:(nullable NSString *)sceneId;

///指定 TradPlusAdInterstitialObject 展示广告
- (void)zxcv567ShowWithInterstitial:(TradPlusAdInterstitialObject *)interstitialObject scene:(nullable NSString *)sceneId;
- (void)asdf678ShowWithInterstitial:(TradPlusAdInterstitialObject *)interstitialObject root:(nullable UIViewController *)rootViewController scene:(nullable NSString *)sceneId;

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdInterstitialObject *)ghjk789GetReadyInterstitial;

/// 进入广告场景
/// @param sceneId 场景ID 可以为nil
- (void)qwer789EnterAdScene:(nullable NSString *)sceneId;

- (void)mnbv123OpenAutoLoadCallback;

//用于开发者在广告展示前设置透传的自定义数据，SDK将在展示后的相关回调中返回。
//开发者可通过 key：customAdInfo 获取。adInfo[@"customAdInfo"]
@property (nonatomic, strong) NSDictionary *vbnm456CustomAdInfo;

@property (nonatomic, readonly) BOOL zxcv345IsAdReady;
@property (nonatomic, readonly) NSString *asdf890UnitID;

@property (nonatomic,weak) id <PubeasyAdInterstitialDelegate> pubDelegate;

//用户设置本地配置
@property (nullable, nonatomic, strong) NSDictionary *ghjk123LocalParams;

@end

NS_ASSUME_NONNULL_END
