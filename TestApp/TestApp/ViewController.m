#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 测试SDK是否正常工作
    PubeasyManager *manager = [PubeasyManager sharedInstance];
    NSLog(@"SDK版本: %@", [manager getSDKVersion]);
}

@end
