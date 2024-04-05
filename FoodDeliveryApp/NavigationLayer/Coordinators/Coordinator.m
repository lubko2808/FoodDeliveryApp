//
//  Coordinator.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 04.04.2024.
//

#import "Coordinator.h"

@implementation Coordinator

- (nonnull instancetype)initWithChildCoordinators:(nonnull NSMutableArray<id<CoordinatorProtocol>> *)childCoordinators type:(CoordinatorType)type navigationController:(nonnull UINavigationController *)navigationController finishDelegate:(nullable id<CoordinatorFinishDelegate>)finishDelegate {
    
    self = [super init];
    if (self) {
        _childCoordinators = childCoordinators ?: [NSMutableArray array];
        _type = type;
        _navigationController = navigationController;
        _finishDelegate = finishDelegate;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"Coordinator deinited %ld", (long)self.type);
    [self.childCoordinators enumerateObjectsUsingBlock:^(id<CoordinatorProtocol>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.finishDelegate = nil;
    }];
    [self.childCoordinators removeAllObjects];
}

- (void)start {
    NSLog(@"Coordinator start");
}

- (void)finish {
    NSLog(@"Coordinator finish");
}


- (void)addChildCoordinator:(nonnull id<CoordinatorProtocol>)childCoordinator {
    [self.childCoordinators addObject:childCoordinator];
}

- (void)removeChildCoordinator:(nonnull id<CoordinatorProtocol>)childCoordinator {
    NSPredicate* predicate = [NSPredicate predicateWithBlock:^BOOL(id<CoordinatorProtocol> evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return evaluatedObject != childCoordinator;
    }];
    [self.childCoordinators filterUsingPredicate:predicate];
}

@end
