//
//  Coordinator.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 04.04.2024.
//

#import <UIKit/UIKit.n>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, CoordinatorType) {
    CoordinatorTypeApp,
    CoordinatorTypeOnboarding,
    CoordinatorTypeHome,
    CoordinatorTypeOrder,
    CoordinatorTypeList,
    CoordinatorTypeProfile
};

@protocol CoordinatorProtocol <NSObject>

@property (nonatomic, strong, nonnull) NSMutableArray<id<CoordinatorProtocol>> *childCoordinators;
@property (nonatomic, assign, readonly, nonnull) CoordinatorType type;
@property (nonatomic, strong, nullable) UINavigationController *navigationController;
@property (nonatomic, weak) id<CoordinatorFinishDelegate> finishDelegate;

- (void)start;
- (void)finish;

@end

@protocol CoordinatorFinishDelegate <NSObject>

-(void)coordinatorDidFinishChildCoordinators: CoordinatorProtocol;

@end

NS_ASSUME_NONNULL_END
