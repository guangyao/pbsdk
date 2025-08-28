//
//  PubeasyNativeRenderer.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TradPlusAds/TradPlusAdRes.h>
#import <TradPlusAds/TradPlusNativeAdRendering.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PubeasyNativeAdRendering;

@interface PubeasyNativeRenderer : NSObject

@property (nonatomic,strong)Class renderingViewClass;
@property (nonatomic,assign)CGSize renderSize;
@property (nonatomic,assign)BOOL isTemplate;
@property (nonatomic,readonly)UIView *renderingView;
//传入支持PubeasyNativeAdRendering 协议的自定义adView
@property (nonatomic,strong)UIView <PubeasyNativeAdRendering> *customAdView;
//开启时会对三方素材如 adChoiceView mediaView 添加autoLayout布局约束，默认关闭
@property (nonatomic,assign)BOOL addAutoLayout;
- (UIView *)showADWithRes:(TradPlusAdRes *)res;
- (NSDictionary *)getViewInfo;
- (NSArray *)getClickViewArray;

///自定义设置
- (void)setTitleLable:(UILabel *)label canClick:(BOOL)canClick;
- (void)setTextLable:(UILabel *)label canClick:(BOOL)canClick;
- (void)setIconView:(UIImageView *)imageView canClick:(BOOL)canClick;
- (void)setMainImageView:(UIImageView *)imageView canClick:(BOOL)canClick;
- (void)setMediaView:(UIView *)view canClick:(BOOL)canClick;
- (void)setAdView:(UIView *)view canClick:(BOOL)canClick;
//CtaLable CtaView 如都设置则使用CtaLable
- (void)setCtaLable:(UILabel *)label canClick:(BOOL)canClick;
- (void)setCtaView:(UIView *)ctaView canClick:(BOOL)canClick;
//AdChoiceImageView AdChoiceView 如都设置则使用AdChoiceImageView
- (void)setAdChoiceImageView:(UIImageView *)imageView canClick:(BOOL)canClick;
- (void)setAdChoiceView:(UIView *)adChoiceView canClick:(BOOL)canClick;

///用于注册额外元素
- (void)setCustomerView:(UIView *)view key:(NSString *)key canClick:(BOOL)canClick;
///重写此接口来添加额外元素
- (void)customerRendererWithRes:(TradPlusAdRes *)res;
///重写此接口 在渲染完成后对Adview添加布局约束等操作 v8.2.0新增
- (void)addConstraintWithAdView:(UIView *)adView;

@end

NS_ASSUME_NONNULL_END
