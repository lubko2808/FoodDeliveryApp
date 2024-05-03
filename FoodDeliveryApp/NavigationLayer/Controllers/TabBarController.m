//
//  TabBarController.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "TabBarController.h"
#import "UIColor+AppColors.h"
#import "UIFont+Roboto.h"

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundColor = [UIColor background];
    self.tabBar.tintColor = [UIColor accentOrange];
    self.tabBar.itemPositioning = UITabBarItemPositioningCentered;
    self.tabBar.itemWidth = 40.0;
    self.tabBar.itemSpacing = 30.0;
    
    [UITabBarItem appearance].titlePositionAdjustment = UIOffsetMake(0, -3);
    
    [[UITabBarItem appearance]
     setTitleTextAttributes:@{@"NSFontAttributeName": [UIFont getRobotoFont:RobotoRegular size:12]}
     forState:UIControlStateNormal];
    [UIFont getRobotoFont:RobotoRegular size:12];
}

- (instancetype)initWithControllers:(NSArray<UIViewController*>*) controllers
{
    self = [super init];
    if (self) {
        for (UIViewController* tab in controllers) {
            [self addChildViewController:tab];
        }
    }
    return self;
}

@end
