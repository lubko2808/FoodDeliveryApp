//
//  LoginViewPresenter.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 10.04.2024.
//

#import <Foundation/Foundation.h>
#import "AppCoordinator.h"
#import "LoginViewController.h"
#import "LoginViewInput.h"
#import "LoginViewOutput.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewPresenter : NSObject <LoginViewOutput>

- (instancetype)initWithCoordinator:(AppCoordinator*)coordinator viewInput:(_Nullable id<LoginViewInput>)viewInput;

@end

NS_ASSUME_NONNULL_END
