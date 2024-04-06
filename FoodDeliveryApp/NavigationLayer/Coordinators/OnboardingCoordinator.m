//
//  OnboardingCoordinator.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "OnboardingCoordinator.h"
#import "OnboardingViewPresenter.h"
#import "OnboardingViewController.h"

@implementation OnboardingCoordinator

- (void)start {
    [self showOnboarding];
}

- (void)finish {
    NSLog(@"OnboardingCoordinator finished");
}

- (void)showOnboarding {
    NSMutableArray<UIViewController*>* pages = [NSMutableArray new];
    UIViewController* firstVC = [UIViewController new];
    firstVC.view.backgroundColor = [UIColor purpleColor];
    UIViewController* secondVC = [UIViewController new];
    secondVC.view.backgroundColor = [UIColor yellowColor];
    UIViewController* thirdVC = [UIViewController new];
    thirdVC.view.backgroundColor = [UIColor redColor];
    [pages addObject:firstVC];
    [pages addObject:secondVC];
    [pages addObject:thirdVC];
    OnboardingViewPresenter* presenter = [[OnboardingViewPresenter alloc] initWithCoordinator:self];
    OnboardingViewController* viewController = [[OnboardingViewController alloc] initWithPages:pages viewOutput:presenter];
    [self.navigationController pushViewController:viewController animated:YES];
} 

@end
