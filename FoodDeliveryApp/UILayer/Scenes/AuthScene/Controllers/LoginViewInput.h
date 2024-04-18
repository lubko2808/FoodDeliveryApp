//
//  LoginViewInput.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 18.04.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LoginViewInput <NSObject>

- (void)onSignInTapped;
- (void)onSignUpTapped;
- (void)onFacebookTapped;
- (void)onGoogleTapped;
- (void)onForgorPasswordTapped;
- (void)onBackPressed;

@end

NS_ASSUME_NONNULL_END
