//
//  CoordinatorFinishDelegate.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol CoordinatorProtocol;

@protocol CoordinatorFinishDelegate <NSObject>

-(void)coordinatorDidFinishChildCoordinator:(id<CoordinatorProtocol>)childCoordinator;

@end

NS_ASSUME_NONNULL_END
