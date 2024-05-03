//
//  SceneDelegate.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 03.04.2024.
//

#import "SceneDelegate.h"
#import "ViewController.h"
#import "AppCoordinator.h"

@interface SceneDelegate ()

@property (nonatomic, strong) AppCoordinator* coordinator;

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    UIWindowScene* windowScene;
    if ([scene isKindOfClass:[UIWindowScene class]]) {
        windowScene = (UIWindowScene*)scene;
    } else { return; }
    
    UIWindow* window = [[UIWindow alloc] initWithWindowScene:windowScene];
    UINavigationController* navigationController = [UINavigationController new];
    window.rootViewController = navigationController;
    self.window = window;
    [window makeKeyAndVisible];
    self.coordinator = [[AppCoordinator alloc] initWithChildCoordinators:[NSMutableArray new]
                                                                    type:CoordinatorTypeApp
                                                    navigationController:navigationController
                                                          finishDelegate:nil];
    [self.coordinator start];
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
}


- (void)sceneDidBecomeActive:(UIScene *)scene {

}


- (void)sceneWillResignActive:(UIScene *)scene {
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
}


@end
