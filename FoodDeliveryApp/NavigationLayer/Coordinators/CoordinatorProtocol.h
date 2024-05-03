//
//  Coordinator.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 04.04.2024.
//

#import <UIKit/UIKit.h>
#import "CoordinatorFinishDelegate.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CoordinatorType) {
    CoordinatorTypeApp,
    CoordinatorTypeOnboarding,
    CoordinatorTypeLogin,
    CoordinatorTypeHome,
    CoordinatorTypeOrder,
    CoordinatorTypeList,
    CoordinatorTypeProfile
};

@protocol CoordinatorProtocol <NSObject>

@property (nonatomic, strong, nonnull) NSMutableArray<id<CoordinatorProtocol>> *childCoordinators;
@property (nonatomic, assign, readonly) CoordinatorType type;
@property (nonatomic, strong, nullable) UINavigationController *navigationController;
@property (nonatomic, weak) id<CoordinatorFinishDelegate> finishDelegate;

- (void)start;
- (void)finish;

@end

@protocol TabBarCoordinator <NSObject, CoordinatorProtocol>

@property (nonatomic, strong) UITabBarController* tabBarController;

@end

NS_ASSUME_NONNULL_END
