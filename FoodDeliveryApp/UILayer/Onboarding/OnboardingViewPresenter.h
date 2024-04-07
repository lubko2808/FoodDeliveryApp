//
//  OnboardingViewPresenter.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import <Foundation/Foundation.h>
#import "OnboardingCoordinator.h"

NS_ASSUME_NONNULL_BEGIN

@protocol OnboardingViewOutput <NSObject>

- (void)onboardingFinished;

@end

@interface OnboardingViewPresenter : NSObject <OnboardingViewOutput>

@property (nonatomic, weak) OnboardingCoordinator* coordinator;

- (instancetype)initWithCoordinator:(OnboardingCoordinator*)coordinator;

@end

NS_ASSUME_NONNULL_END
