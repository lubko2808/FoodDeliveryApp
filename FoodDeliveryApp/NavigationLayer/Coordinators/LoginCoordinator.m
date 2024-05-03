//
//  LoginCoordinator.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 25.04.2024.
//

#import "LoginCoordinator.h"
#import "LoginViewController.h"
#import "SceneFactory.h"

@implementation LoginCoordinator

- (void)start {
    [self showAuthScene];
}

- (void)finish {
    [self.finishDelegate coordinatorDidFinishChildCoordinator:self];
}

- (void)showAuthScene {
    if (!self.navigationController) { return; }
    LoginViewController* vc = [SceneFactory makeAuthSceneWithCoordinator:self];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showSignInScene {
    if (!self.navigationController) { return; }
    LoginViewController* vc = [SceneFactory makeSignInSceneWithCoordinator:self];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)showSignUpScene {
    if (!self.navigationController) { return; }
    LoginViewController* vc = [SceneFactory makeSignUpSceneWithCoordinator:self];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
