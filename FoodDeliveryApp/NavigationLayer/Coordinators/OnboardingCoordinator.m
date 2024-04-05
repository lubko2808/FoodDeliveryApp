//
//  OnboardingCoordinator.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "OnboardingCoordinator.h"
#import "ViewController.h"

@implementation OnboardingCoordinator

- (void)start {
    ViewController* vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)finish {
    NSLog(@"OnboardingCoordinator finished");
}

@end
