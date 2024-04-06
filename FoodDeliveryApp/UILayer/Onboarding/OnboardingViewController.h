//
//  OnboardingViewController.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import <UIKit/UIKit.h>
#import "OnboardingViewPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface OnboardingViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, weak) id<OnboardingViewOutput> viewOutput;

- (instancetype)initWithPages:(NSArray<UIViewController*>*)pages viewOutput:(OnboardingViewPresenter*)viewOuput;

@end

NS_ASSUME_NONNULL_END
