//
//  LoginCoordinator.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 25.04.2024.
//

#import <Foundation/Foundation.h>
#import "Coordinator.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginCoordinator : Coordinator

- (void)showSignInScene;

- (void)showSignUpScene;

@end

NS_ASSUME_NONNULL_END
