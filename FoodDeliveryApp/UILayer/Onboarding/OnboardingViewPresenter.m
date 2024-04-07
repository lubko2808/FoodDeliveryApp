//
//  OnboardingViewPresenter.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "OnboardingViewPresenter.h"
#import "UserStorage.h"

@implementation OnboardingViewPresenter

- (instancetype)initWithCoordinator:(OnboardingCoordinator *)coordinator {
    self = [super init];
    if (self) {
        _coordinator = coordinator;
    }
    return self;
}

- (void)onboardingFinished {
    [UserStorage sharedInstance].passedOnboarding = YES;
    [self.coordinator finish];
}

@end
