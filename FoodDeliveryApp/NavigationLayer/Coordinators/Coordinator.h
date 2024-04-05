//
//  Coordinator.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 04.04.2024.
//

#import <Foundation/Foundation.h>
#import "CoordinatorProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface Coordinator : NSObject <CoordinatorProtocol>

@property (nonatomic, strong, nonnull) NSMutableArray<id<CoordinatorProtocol>> *childCoordinators;
@property (nonatomic, assign, readonly) CoordinatorType type;
@property (nonatomic, strong, nullable) UINavigationController *navigationController;
@property (nonatomic, weak) id<CoordinatorFinishDelegate> finishDelegate;

- (instancetype)initWithChildCoordinators:(NSMutableArray<id<CoordinatorProtocol>> *)childCoordinators
                                     type:(CoordinatorType)type
                       navigationController:(nonnull UINavigationController *)navigationController
                            finishDelegate:(nullable id<CoordinatorFinishDelegate>)finishDelegate;

- (void)addChildCoordinator:(id<CoordinatorProtocol>)childCoordinator;

- (void)removeChildCoordinator:(id<CoordinatorProtocol>)childCoordinator;

@end

NS_ASSUME_NONNULL_END
