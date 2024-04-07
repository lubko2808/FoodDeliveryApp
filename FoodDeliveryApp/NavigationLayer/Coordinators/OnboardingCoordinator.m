//
//  OnboardingCoordinator.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "OnboardingCoordinator.h"
#import "OnboardingViewPresenter.h"
#import "OnboardingViewController.h"
#import "OnboardingPartViewController.h"
#import "SceneFactory.h"

@implementation OnboardingCoordinator

- (void)start {
    [self showOnboarding];
}

- (void)finish {
    [self.finishDelegate coordinatorDidFinishChildCoordinator:self];
}

- (void)showOnboarding {
    OnboardingViewController* viewController = [SceneFactory makeOnboardingSceneWithCoordinator:self];
    [self.navigationController pushViewController:viewController animated:YES];
} 

@end

