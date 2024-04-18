//
//  LoginViewOutput.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 18.04.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LoginViewOutput <NSObject>

- (void)loginStart;
- (void)registrationStart;
- (void)goToFacebookLogin;
- (void)goToGoogleLogin;
- (void)goToSignIn;
- (void)goToSignUp;
- (void)goToForgotPassword;
- (void)back;

@end

NS_ASSUME_NONNULL_END
