//
//  TabBarController.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "TabBarController.h"
#import "UIColor+AppColors.h"

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.backgroundColor = [UIColor background];
    self.tabBar.tintColor = [UIColor accentOrange];
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
