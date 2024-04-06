//
//  OnboardingPartViewController.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 06.04.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OnboardingPartViewController : UIViewController

- (instancetype)initWithIconImage:(UIImage*)image
                        titleText:(NSString*)titleText
                  descriptionText:(NSString*)descriptionText;

@end

NS_ASSUME_NONNULL_END
