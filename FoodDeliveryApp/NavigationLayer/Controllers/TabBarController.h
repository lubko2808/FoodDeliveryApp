//
//  TabBarController.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TabBarController : UITabBarController

- (instancetype)initWithControllers:(NSArray<UIViewController*>*) controllers;
@end

NS_ASSUME_NONNULL_END
