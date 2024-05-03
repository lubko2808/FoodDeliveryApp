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
#import "LoginViewController.h"
#import "LoginCoordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface SceneFactory : NSObject

// MARK: - Onboarding
+ (OnboardingViewController*)makeOnboardingSceneWithCoordinator:(OnboardingCoordinator*)coordinator;

// MARK: - Main Flow
+ (TabBarController*)makeTabBarControllerWithCoordinator:(AppCoordinator*)coordinator;

// MARK: - Auth Flow

+ (LoginViewController*)makeAuthSceneWithCoordinator:(LoginCoordinator*)coordinator;

+ (LoginViewController*)makeSignInSceneWithCoordinator:(LoginCoordinator*)coordinator;

+ (LoginViewController*)makeSignUpSceneWithCoordinator:(LoginCoordinator*)coordinator;

@end

NS_ASSUME_NONNULL_END
