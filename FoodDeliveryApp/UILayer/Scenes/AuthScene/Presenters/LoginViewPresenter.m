//
//  LoginViewPresenter.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 10.04.2024.
//

#import "LoginViewPresenter.h"

@interface LoginViewPresenter ()

@property (nonatomic, strong) LoginCoordinator* coordinator;

@end

@implementation LoginViewPresenter

- (instancetype)initWithCoordinator:(LoginCoordinator*)coordinator viewInput:(_Nullable id<LoginViewInput>)viewInput {
    self = [super init];
    if (self) {
        _coordinator = coordinator;
        _viewInput = viewInput;
    }
    return self;
}

- (void)back { 
    
}

// MARK: - LoginViewOutput
- (void)goToFacebookLogin {
        
}

- (void)goToForgotPassword { 
    
}

- (void)goToGoogleLogin { 
    
}

- (void)goToSignIn { 
    [self.coordinator showSignInScene];
}

- (void)goToSignUp { 
    [self.coordinator showSignUpScene];
}

- (void)startLoginWithUsername:(NSString*)username password:(NSString*)password {
    
    
    [self.viewInput startLoader];
    if ([[username lowercaseString]  isEqual: @"text@gmail.com"] && [password  isEqual: @"Test123"]) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_time_t delay = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC));
        dispatch_after(delay, queue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.viewInput stopLoader];
                [self goToMainScreen];
            });
        });
    } else {
        [self.viewInput stopLoader];
        NSLog(@"wrong email or password");
    }
     
}

- (void)registrationStart { 
    
}

// MARK: - Private
- (void)goToMainScreen {
    [self.coordinator finish];
}


@end
