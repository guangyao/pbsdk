#import "AppDelegate.h"
#import <PubyYanSDK/PubeasySDK.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化SDK
    [[PubeasyManager sharedInstance] initializeWithAppId:@"test_app_id"];
    
    return YES;
}

@end
