//
//  AppCoordinator.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "AppCoordinator.h"
#import "OnboardingCoordinator.h"

@implementation AppCoordinator

- (void)start {
    [self showOnboardingFlow];
}

- (void)finish {
    NSLog(@"AppCoordinator finish");
}

// MARK: - CoordinatorFinishDelegate
- (void)coordinatorDidFinishChildCoordinator:(nonnull id<CoordinatorProtocol>)childCoordinator {
    [self removeChildCoordinator:childCoordinator];
    
    switch (childCoordinator.type) {

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
    
}


@end
