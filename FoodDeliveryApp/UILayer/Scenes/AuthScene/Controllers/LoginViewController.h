//
//  LoginViewController.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 07.04.2024.
//
 
#import <UIKit/UIKit.h>
#import "LoginViewPresenter.h"
#import "LoginViewOutput.h"
#import "LoginViewInput.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, LoginViewState) {
    LoginViewStateInitial,
    LoginViewStateSignIn,
    LoginViewStateSignUp
};

@interface LoginViewController : UIViewController <LoginViewInput>

- (instancetype)initWithViewOutput:(id<LoginViewOutput>)viewOutput state:(LoginViewState)state;

@end

NS_ASSUME_NONNULL_END
