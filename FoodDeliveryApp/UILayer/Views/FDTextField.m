//
//  FDTextField.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 10.04.2024.
//

#import "FDTextField.h"
#import "UIColor+AppColors.h"
#import "UIFont+Roboto.h"

@implementation FDTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupLayout];
    }
    return self;
}

- (void)setupLayout {
    self.layer.cornerRadius = 24;
    self.backgroundColor = [UIColor gray];
    self.font = [UIFont getRobotoFont:RobotoRegular size:14]; 
    self.placeholder = @"Text to input";
    UIView* paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, self.frame.size.height)];
    self.leftView = paddingView;
    self.rightView = paddingView;
    self.rightViewMode = UITextFieldViewModeAlways;
    self.leftViewMode = UITextFieldViewModeAlways;
}

@end
