//
//  PubeasyNativeRenderer.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import "PubeasyNativeRenderer.h"
#import <TradPlusAds/TradPlusNativeRenderer.h>
#import "PubeasyNativeAdRendering.h"

@interface PubeasyNativeRenderer ()

@property (nonatomic, strong) TradPlusNativeRenderer *renderer;

@end

@implementation PubeasyNativeRenderer

- (TradPlusNativeRenderer *)renderer {
    if (!_renderer) {
        _renderer = [[TradPlusNativeRenderer alloc] init];
    }
    return _renderer;
}

- (Class)renderingViewClass {
    return [self.renderer renderingViewClass];
}
- (void)setRenderingViewClass:(Class)renderingViewClass {
    [self.renderer setRenderingViewClass:renderingViewClass];
}

- (CGSize)renderSize {
    return [self.renderer renderSize];
}
- (void)setRenderSize:(CGSize)renderSize {
    [self.renderer setRenderSize:renderSize];
}

- (BOOL)isTemplate {
    return [self.renderer isTemplate];
}
- (void)setIsTemplate:(BOOL)isTemplate {
    [self.renderer setIsTemplate:isTemplate];
}

- (UIView *)renderingView {
    return [self.renderer renderingView];
}

- (UIView<PubeasyNativeAdRendering> *)customAdView {
    return [self.renderer customAdView];
}
- (void)setCustomAdView:(UIView<PubeasyNativeAdRendering> *)customAdView {
    [self.renderer setCustomAdView:customAdView];
}

- (BOOL)addAutoLayout {
    return [self.renderer addAutoLayout];
}
- (void)setAddAutoLayout:(BOOL)addAutoLayout {
    [self.renderer setAddAutoLayout:addAutoLayout];
}

- (UIView *)showADWithRes:(TradPlusAdRes *)res {
    return [self.renderer showADWithRes:res];
}
- (NSDictionary *)getViewInfo {
    return [self.renderer getViewInfo];
}
- (NSArray *)getClickViewArray {
    return [self.renderer getClickViewArray];
}

///自定义设置
- (void)setTitleLable:(UILabel *)label canClick:(BOOL)canClick {
    [self.renderer setTitleLable:label canClick:canClick];
}
- (void)setTextLable:(UILabel *)label canClick:(BOOL)canClick {
    [self.renderer setTextLable:label canClick:canClick];
}
- (void)setIconView:(UIImageView *)imageView canClick:(BOOL)canClick {
    [self.renderer setIconView:imageView canClick:canClick];
}
- (void)setMainImageView:(UIImageView *)imageView canClick:(BOOL)canClick {
    [self.renderer setMainImageView:imageView canClick:canClick];
}
- (void)setMediaView:(UIView *)view canClick:(BOOL)canClick {
    [self.renderer setMediaView:view canClick:canClick];
}
- (void)setAdView:(UIView *)view canClick:(BOOL)canClick {
    [self.renderer setAdView:view canClick:canClick];
}
//CtaLable CtaView 如都设置则使用CtaLable
- (void)setCtaLable:(UILabel *)label canClick:(BOOL)canClick {
    [self.renderer setCtaLable:label canClick:canClick];
}
- (void)setCtaView:(UIView *)ctaView canClick:(BOOL)canClick {
    [self.renderer setCtaView:ctaView canClick:canClick];
}
//AdChoiceImageView AdChoiceView 如都设置则使用AdChoiceImageView
- (void)setAdChoiceImageView:(UIImageView *)imageView canClick:(BOOL)canClick {
    [self.renderer setAdChoiceImageView:imageView canClick:canClick];
}
- (void)setAdChoiceView:(UIView *)adChoiceView canClick:(BOOL)canClick {
    [self.renderer setAdChoiceView:adChoiceView canClick:canClick];
}

///用于注册额外元素
- (void)setCustomerView:(UIView *)view key:(NSString *)key canClick:(BOOL)canClick {
    [self.renderer setCustomerView:view key:key canClick:canClick];
}
///重写此接口来添加额外元素
- (void)customerRendererWithRes:(TradPlusAdRes *)res {
    [self.renderer customerRendererWithRes:res];
}
///重写此接口 在渲染完成后对Adview添加布局约束等操作 v8.2.0新增
- (void)addConstraintWithAdView:(UIView *)adView {
    [self.renderer addConstraintWithAdView:adView];
}

@end
