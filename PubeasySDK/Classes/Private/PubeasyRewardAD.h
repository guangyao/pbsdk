//
//  PubeasyRewardAD.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/17.
//

#import <Foundation/Foundation.h>
#import <TradPlusAds/TradPlusAdRewardedObject.h>

@protocol PubeasyAdRewardedDelegate;
@protocol PubeasyAdRewardedPlayAgainDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface PubeasyRewardAD : NSObject

/// 设置广告位ID
- (void)xyzSetAdUnit_789:(NSString *)adUnitID;

///返回下一个Ready的AD信息 无广告时返回nil
- (nullable NSDictionary *)abcGetReadyInfo_123;

///返回当前显示的AD信息
- (nullable NSDictionary *)defGetCurrentInfo_456;

///获取三方渠道广告对象
- (nullable id)ghiGetRewardAd_789;

///加载广告
- (void)jklLoadAd_321;
- (void)mnoLoadAdWithWait_654:(NSTimeInterval)maxWaitTime;

/// 显示广告
/// @param sceneId 场景ID 可以为nil
- (void)pqrShowAdWithScene_987:(nullable NSString *)sceneId;

/// 显示广告
/// @param rootViewController rootViewController
/// 当传入nil时SDK会自行获取key windows 的 rootViewController
/// @param sceneId 场景ID 可以为nil
- (void)stuShowAdFromRoot_654:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId;

///指定 TradPlusAdRewardedObject 展示广告
- (void)vwxShowWithRewardObj_321:(TradPlusAdRewardedObject *)rewardedObject sceneId:(nullable NSString *)sceneId;
- (void)yzAShowWithRewardObj_987:(TradPlusAdRewardedObject *)rewardedObject rootViewController:(nullable UIViewController *)rootViewController sceneId:(nullable NSString *)sceneId;

///获取一个已缓存广告,获取后此广告会从缓存中移除，无广告时返回nil
- (nullable TradPlusAdRewardedObject *)bcdGetReadyRewardObj_123;

/// 进入广告场景
/// @param sceneId 场景ID 可以为nil
- (void)efgEntryAdScene_456:(nullable NSString *)sceneId;

/// 设置服务器端奖励验证用户数据
/// @param userID 用户唯一识别码 必填
/// @param customData 附加信息 根据平台要求填写
- (void)hijSetServerVerify_789:(nonnull NSString *)userID customData:(nullable NSString *)customData;

- (void)klmOpenAutoLoad_321;

//用于开发者在广告展示前设置透传的自定义数据，SDK将在展示后的相关回调中返回。
//开发者可通过 key：customAdInfo 获取。adInfo[@"customAdInfo"]
@property (nonatomic, strong)NSDictionary *nopCustomInfo_654;

@property (nonatomic, readonly) BOOL qrsIsAdReady_987;
@property (nonatomic, readonly) NSString *tuvUnitID_321;

@property (nonatomic,weak) id <PubeasyAdRewardedDelegate> cdeDelegate_321;
@property (nonatomic,weak) id <PubeasyAdRewardedPlayAgainDelegate> fghPlayAgainDelegate_654;

//用户设置本地配置
@property (nullable,nonatomic, strong)NSDictionary *ijkLocalParams_987;

@end

NS_ASSUME_NONNULL_END
