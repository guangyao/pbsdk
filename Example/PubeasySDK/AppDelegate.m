//
//  AppDelegate.m
//  PubeasySDK
//
//  Created by Jang on 2025/6/16.
//

#import "AppDelegate.h"
#import <PubeasySDK/PubeasySDK.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化PubeasySDK
    [PubeasyManager initSDK:@"demo_app_id_12345" completionBlock:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"[PubeasySDK] 初始化失败: %@", error.localizedDescription);
        } else {
            NSLog(@"[PubeasySDK] 初始化成功");
        }
    }];
    
    // 设置可选配置参数
    NSDictionary *config = @{
        @"user_id": @"demo_user_123",
        @"custom_param": @"example_value"
    };
    [PubeasyManager registerWithOptionalData:config];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
