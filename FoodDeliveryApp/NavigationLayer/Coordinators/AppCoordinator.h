//
//  AppCoordinator.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import <UIKit/UIKit.h>
#import "Coordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface AppCoordinator : Coordinator <CoordinatorFinishDelegate>

- (void)showOnboardingFlow;

- (void)showMainFlow;

@end

NS_ASSUME_NONNULL_END
