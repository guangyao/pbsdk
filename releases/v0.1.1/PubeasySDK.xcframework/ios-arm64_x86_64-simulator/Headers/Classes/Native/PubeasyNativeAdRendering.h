//
//  PubeasyNativeAdRendering.h
//  PubeasySDK
//
//  Created by Jang on 2025/6/18.
//

#import <UIKit/UIKit.h>

@protocol PubeasyNativeAdRendering <NSObject>

@optional

- (UILabel *)nativeTitleTextLabel;

- (UILabel *)nativeMainTextLabel;

- (UIImageView *)nativeIconImageView;

- (UIImageView *)nativeMainImageView;

- (UIView *)nativeMediaView;

//callToActionTextLabel 优先使用
- (UILabel *)nativeCallToActionTextLabel;
// callToActionView
- (UIView *)nativeCallToActionView;

//AdChoiceImageView 优先使用
- (UIImageView *)nativePrivacyInformationIconImageView;
// AdChoiceView
- (UIView *)nativeAdChoiceView;

+ (UINib *)nibForAd;

// 开发者可以在此接口设置可点击view的数组
- (NSArray *)clickViewArray;

@end
