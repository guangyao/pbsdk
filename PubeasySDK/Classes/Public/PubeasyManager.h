//
//  PubeasyManager.h
//
//  Created by yangzj on 2025/6/16.

#import <Foundation/Foundation.h>
#import <UIKit/UIApplication.h>

@interface PubeasyManager : NSObject

/**
 单例
 */
+ (instancetype)sharedInstance;

/**
 SDK初始化，并传入AppId
 - Parameters:
 - appId: appId
 - completionBlock: 失败回调
 */
+ (void)initSDK:(NSString *)appId completionBlock:(void (^)(NSError* __nullable error))completionBlock;

/**
 SDK需要，并传入可选参数
 */
+ (void)registerWithOptionalData:(NSDictionary *)config;

/**
 接入放需要的额外信息
 */
@property (nonatomic, strong) NSMutableDictionary *extraParam;

@end


