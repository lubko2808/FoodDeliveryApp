//
//  SceneFactory.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 07.04.2024.
//

#import <UIKit/UIKit.h>
#import "OnboardingViewController.h"
#import "OnboardingCoordinator.h"
#import "TabBarController.h"
#import "AppCoordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface SceneFactory : NSObject

// MARK: - Onboarding
+ (OnboardingViewController*)makeOnboardingSceneWithCoordinator:(OnboardingCoordinator*)coordinator;

// MARK: - Main Flow
+ (TabBarController*)makeTabBarControllerWithCoordinator:(AppCoordinator*)coordinator;

@end

NS_ASSUME_NONNULL_END
