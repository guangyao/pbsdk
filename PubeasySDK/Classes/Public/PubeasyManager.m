//
//  PubeasyManager.m
//
//  Created by yangzj on 2025/6/16.

#import "PubeasyManager.h"
#import <TradPlusAds/TradPlus.h>

@interface PubeasyManager()

@end

@implementation PubeasyManager

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

+ (instancetype)sharedInstance {
    static PubeasyManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[PubeasyManager alloc] init];
    });
    return manager;
}

+ (void)initSDK:(NSString *)appId completionBlock:(void (^)(NSError* __nullable error))completionBlock {
    [TradPlus initSDK:appId completionBlock:completionBlock];
}

+ (void)registerWithOptionalData:(NSDictionary *)config {
    [[PubeasyManager sharedInstance].extraParam addEntriesFromDictionary:config];
}

#pragma mark lazy
- (NSMutableDictionary *)extraParam {
    if (!_extraParam) {
        _extraParam = [NSMutableDictionary dictionary];
    }
    return _extraParam;
}

@end
