//
//  AppCoordinator.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "AppCoordinator.h"
#import "OnboardingCoordinator.h"
#import "HomeCoordinator.h"
#import "OrderCoordinator.h"
#import "ListCoordinator.h"
#import "ProfileCoordinator.h"
#import "TabBarController.h"

@implementation AppCoordinator

- (void)start {
    [self showOnboardingFlow];
}

- (void)finish {
    NSLog(@"AppCoordinator finish");
}

// MARK: - CoordinatorFinishDelegate
- (void)coordinatorDidFinishChildCoordinator:(nonnull id<CoordinatorProtocol>)childCoordinator {
    [self removeChildCoordinator:childCoordinator];
    
    switch (childCoordinator.type) {

        case CoordinatorTypeApp:
            return;
        default:
            [self.navigationController popToRootViewControllerAnimated:NO];
    }
    
}

// MARK: - Navigation methods
- (void)showOnboardingFlow {
    if (!self.navigationController) { return; }
    OnboardingCoordinator* onboardingCoordinator = [[OnboardingCoordinator alloc] initWithChildCoordinators:[NSMutableArray new] type:CoordinatorTypeOnboarding navigationController:self.navigationController finishDelegate:self];
    [self addChildCoordinator:onboardingCoordinator];
    [onboardingCoordinator start];
}

- (void)showMainFlow {
    if (!self.navigationController) { return; }
    
    UINavigationController* homeNavigationController = [UINavigationController new];
    homeNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home"
                                                                        image:[UIImage systemImageNamed:@"swirl.circle.righthalf.filled"]
                                                                          tag:0];
    HomeCoordinator* homeCoordinator = [[HomeCoordinator alloc] initWithChildCoordinators:[NSMutableArray new]
                                                                                     type:CoordinatorTypeHome
                                                                     navigationController:homeNavigationController
                                                                           finishDelegate:self];
    [homeCoordinator start];
    
    UINavigationController* orderNavigationController = [UINavigationController new];
    orderNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Order"
                                                                         image:[UIImage systemImageNamed:@"swirl.circle.righthalf.filled"]
                                                                           tag:1];
    OrderCoordinator* orderCoordinator = [[OrderCoordinator alloc] initWithChildCoordinators:[NSMutableArray new]
                                                                                     type:CoordinatorTypeOrder
                                                                     navigationController:orderNavigationController
                                                                           finishDelegate:self];
    [orderCoordinator start];
    
    UINavigationController* listNavigationController = [UINavigationController new];
    listNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"List"
                                                                        image:[UIImage systemImageNamed:@"swirl.circle.righthalf.filled"]
                                                                          tag:2];
    ListCoordinator* listCoordinator = [[ListCoordinator alloc] initWithChildCoordinators:[NSMutableArray new]
                                                                                     type:CoordinatorTypeList
                                                                     navigationController:listNavigationController
                                                                           finishDelegate:self];
    [listCoordinator start];
    
    UINavigationController* profileNavigationController = [UINavigationController new];
    profileNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Profile"
                                                                        image:[UIImage systemImageNamed:@"swirl.circle.righthalf.filled"]
                                                                          tag:3];
    ProfileCoordinator* profileCoordinator = [[ProfileCoordinator alloc] initWithChildCoordinators:[NSMutableArray new]
                                                                                     type:CoordinatorTypeProfile
                                                                     navigationController:profileNavigationController
                                                                           finishDelegate:self];
    [profileCoordinator start];
    
    [self addChildCoordinator:homeCoordinator];
    [self addChildCoordinator:orderCoordinator];
    [self addChildCoordinator:listCoordinator];
    [self addChildCoordinator:profileCoordinator];

    NSArray<UINavigationController*>* controllers = @[homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController];
    TabBarController* tabBarController = [[TabBarController alloc] initWithControllers:controllers];
    
    [self.navigationController pushViewController:tabBarController animated:YES];
    
}


@end
