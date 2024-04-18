//
//  AppCoordinator.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "AppCoordinator.h"
#import "OnboardingCoordinator.h"
#import "HomeCoordinator.h"
#import "OrderCoordinator.h"
#import "ListCoordinator.h"
#import "ProfileCoordinator.h"
#import "TabBarController.h"
#import "UserStorage.h"
#import "SceneFactory.h"
#import "LoginViewController.h"

@implementation AppCoordinator

- (void)start {
    UserStorage* userStorage = [UserStorage sharedInstance];
    if (userStorage.passedOnboarding) {
        [self showAuthFlow];
//        [self showMainFlow];
    } else {
        [self showOnboardingFlow];
    }
    
}

- (void)finish {
    NSLog(@"AppCoordinator finish");
}

// MARK: - CoordinatorFinishDelegate
- (void)coordinatorDidFinishChildCoordinator:(nonnull id<CoordinatorProtocol>)childCoordinator {
    [self removeChildCoordinator:childCoordinator];
    
    switch (childCoordinator.type) {
        case CoordinatorTypeOnboarding:
            self.navigationController.viewControllers = @[];
            [self showAuthFlow];
        case CoordinatorTypeApp:
            return;
        default:
            [self.navigationController popToRootViewControllerAnimated:NO];
    }
    
}

// MARK: - Navigation methods
- (void)showOnboardingFlow {
    if (!self.navigationController) { return; }
    OnboardingCoordinator* onboardingCoordinator = [[OnboardingCoordinator alloc] initWithChildCoordinators:[NSMutableArray new] type:CoordinatorTypeOnboarding navigationController:self.navigationController finishDelegate:self];
    [self addChildCoordinator:onboardingCoordinator];
    [onboardingCoordinator start];
}

- (void)showMainFlow {
    if (!self.navigationController) { return; }
    TabBarController* tabBarController = [SceneFactory makeTabBarControllerWithCoordinator:self];
    [self.navigationController pushViewController:tabBarController animated:YES];
}

- (void)showAuthFlow {
    if (!self.navigationController) { return; }
    LoginViewController* vc = [SceneFactory makeAuthSceneWithCoordinator:self];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)showSignInScene {
    if (!self.navigationController) { return; }
    LoginViewController* vc = [SceneFactory makeSignInSceneWithCoordinator:self];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showSignUpScene {
    if (!self.navigationController) { return; }
    LoginViewController* vc = [SceneFactory makeSignUpSceneWithCoordinator:self];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
