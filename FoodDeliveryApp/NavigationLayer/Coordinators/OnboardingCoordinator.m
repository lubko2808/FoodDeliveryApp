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

@implementation OnboardingCoordinator

- (void)start {
    [self showOnboarding];
}

- (void)finish {
    NSLog(@"OnboardingCoordinator finished");
}

- (void)showOnboarding {
    NSMutableArray<UIViewController*>* pages = [NSMutableArray new];
    
    OnboardingPartViewController* firstVC = [[OnboardingPartViewController alloc] initWithIconImage:[UIImage imageNamed:@"chickenLeg"] titleText:@"Delicious Food" descriptionText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit."];
    
    OnboardingPartViewController* secondVC = [[OnboardingPartViewController alloc] initWithIconImage:[UIImage imageNamed:@"shipped"]
                                                                                          titleText:@"Fast Shipping"
                                                                                    descriptionText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit."];
    
    OnboardingPartViewController* thirdVC = [[OnboardingPartViewController alloc] initWithIconImage:[UIImage imageNamed:@"medal"]
                                                                                          titleText:@"Certificate Food"
                                                                                    descriptionText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit."];
    
    OnboardingPartViewController* fourthVC = [[OnboardingPartViewController alloc] initWithIconImage:[UIImage imageNamed:@"creditCard"]
                                                                                          titleText:@"Payment Online"
                                                                                    descriptionText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit."];

    [pages addObject:firstVC];
    [pages addObject:secondVC];
    [pages addObject:thirdVC];
    [pages addObject:fourthVC];
    OnboardingViewPresenter* presenter = [[OnboardingViewPresenter alloc] initWithCoordinator:self];
    OnboardingViewController* viewController = [[OnboardingViewController alloc] initWithPages:pages viewOutput:presenter];
    [self.navigationController pushViewController:viewController animated:YES];
} 

@end

