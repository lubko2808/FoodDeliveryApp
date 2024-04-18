//
//  LoginViewPresenter.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 10.04.2024.
//

#import "LoginViewPresenter.h"

@interface LoginViewPresenter ()

@property (nonatomic, strong) AppCoordinator* coordinator;
@property (nonatomic, weak) id<LoginViewInput> viewInput;

@end

@implementation LoginViewPresenter

- (instancetype)initWithCoordinator:(AppCoordinator*)coordinator viewInput:(_Nullable id<LoginViewInput>)viewInput {
    self = [super init];
    if (self) {
        _coordinator = coordinator;
        _viewInput = viewInput;
    }
    return self;
}

- (void)back { 
    
}

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

- (void)loginStart { 
    
}

- (void)registrationStart { 
    
}

@end
