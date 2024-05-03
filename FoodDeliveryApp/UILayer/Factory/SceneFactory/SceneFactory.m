//
//  SceneFactory.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 07.04.2024.
//

#import "SceneFactory.h"
#import "OnboardingPartViewController.h"
#import "HomeCoordinator.h"
#import "OrderCoordinator.h"
#import "ListCoordinator.h"
#import "ProfileCoordinator.h"

@implementation SceneFactory

+ (OnboardingViewController *)makeOnboardingSceneWithCoordinator:(OnboardingCoordinator *)coordinator {
    NSMutableArray<UIViewController*>* pages = [NSMutableArray new];
    
    OnboardingPartViewController* firstVC = [[OnboardingPartViewController alloc]
                                             initWithIconImage:[UIImage imageNamed:@"chickenLeg"]
                                             titleText:@"Delicious Food"
                                             descriptionText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit."];
    
    OnboardingPartViewController* secondVC = [[OnboardingPartViewController alloc]
                                              initWithIconImage:[UIImage imageNamed:@"shipped"]
                                              titleText:@"Fast Shipping"
                                              descriptionText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit."];
    
    OnboardingPartViewController* thirdVC = [[OnboardingPartViewController alloc]
                                             initWithIconImage:[UIImage imageNamed:@"medal"]
                                             titleText:@"Certificate Food"
                                             descriptionText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit."];
    
    OnboardingPartViewController* fourthVC = [[OnboardingPartViewController alloc] 
                                              initWithIconImage:[UIImage imageNamed:@"creditCard"]
                                              titleText:@"Payment Online"
                                              descriptionText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit."];

    [pages addObject:firstVC];
    [pages addObject:secondVC];
    [pages addObject:thirdVC];
    [pages addObject:fourthVC];
    OnboardingViewPresenter* presenter = [[OnboardingViewPresenter alloc] initWithCoordinator:coordinator];
    OnboardingViewController* viewController = [[OnboardingViewController alloc] initWithPages:pages viewOutput:presenter];
    return viewController;
}

+ (TabBarController *)makeTabBarControllerWithCoordinator:(AppCoordinator *)coordinator {
    UINavigationController* homeNavigationController = [UINavigationController new];
    homeNavigationController.tabBarItem = [[UITabBarItem alloc]
                                           initWithTitle:@"Home"
                                           image:[UIImage systemImageNamed:@"swirl.circle.righthalf.filled"]
                                           tag:0];
    
    HomeCoordinator* homeCoordinator = [[HomeCoordinator alloc]
                                        initWithChildCoordinators:[NSMutableArray new]
                                        type:CoordinatorTypeHome
                                        navigationController:homeNavigationController
                                        finishDelegate:coordinator];
    [homeCoordinator start];
    
    UINavigationController* orderNavigationController = [UINavigationController new];
    orderNavigationController.tabBarItem = [[UITabBarItem alloc]
                                            initWithTitle:@"Order"
                                            image:[UIImage systemImageNamed:@"swirl.circle.righthalf.filled"]
                                            tag:1];
    
    OrderCoordinator* orderCoordinator = [[OrderCoordinator alloc]
                                          initWithChildCoordinators:[NSMutableArray new]
                                          type:CoordinatorTypeOrder
                                          navigationController:orderNavigationController
                                          finishDelegate:coordinator];
    [orderCoordinator start];
    
    UINavigationController* listNavigationController = [UINavigationController new];
    listNavigationController.tabBarItem = [[UITabBarItem alloc]
                                           initWithTitle:@"List"
                                           image:[UIImage systemImageNamed:@"swirl.circle.righthalf.filled"]
                                           tag:2];
    
    ListCoordinator* listCoordinator = [[ListCoordinator alloc]
                                        initWithChildCoordinators:[NSMutableArray new]
                                        type:CoordinatorTypeList
                                        navigationController:listNavigationController
                                        finishDelegate:coordinator];
    [listCoordinator start];
    
    UINavigationController* profileNavigationController = [UINavigationController new];
    profileNavigationController.tabBarItem = [[UITabBarItem alloc] 
                                              initWithTitle:@"Profile"
                                              image:[UIImage systemImageNamed:@"swirl.circle.righthalf.filled"]
                                              tag:3];
    
    ProfileCoordinator* profileCoordinator = [[ProfileCoordinator alloc]
                                              initWithChildCoordinators:[NSMutableArray new]
                                              type:CoordinatorTypeProfile
                                              navigationController:profileNavigationController
                                              finishDelegate:coordinator];
    [profileCoordinator start];
    
    [coordinator addChildCoordinator:homeCoordinator];
    [coordinator addChildCoordinator:orderCoordinator];
    [coordinator addChildCoordinator:listCoordinator];
    [coordinator addChildCoordinator:profileCoordinator];

    NSArray<UINavigationController*>* controllers = @[homeNavigationController, orderNavigationController, listNavigationController, profileNavigationController];
    TabBarController* tabBarController = [[TabBarController alloc] initWithControllers:controllers];
    return tabBarController;
}

+ (LoginViewController*)makeAuthSceneWithCoordinator:(LoginCoordinator *)coordinator {
    LoginViewPresenter* presenter = [[LoginViewPresenter alloc] initWithCoordinator:coordinator viewInput:nil];
    LoginViewController* controller = [[LoginViewController alloc] initWithViewOutput:presenter state:LoginViewStateInitial];
    presenter.viewInput = controller;
    return controller;
}

+ (LoginViewController*)makeSignInSceneWithCoordinator:(LoginCoordinator *)coordinator {
    LoginViewPresenter* presenter = [[LoginViewPresenter alloc] initWithCoordinator:coordinator viewInput:nil];
    LoginViewController* controller = [[LoginViewController alloc] initWithViewOutput:presenter state:LoginViewStateSignIn];
    presenter.viewInput = controller;
    return controller;
}

+ (LoginViewController*)makeSignUpSceneWithCoordinator:(LoginCoordinator *)coordinator {
    LoginViewPresenter* presenter = [[LoginViewPresenter alloc] initWithCoordinator:coordinator viewInput:nil];
    LoginViewController* controller = [[LoginViewController alloc] initWithViewOutput:presenter state:LoginViewStateSignUp];
    presenter.viewInput = controller;
    return controller;
}

@end
