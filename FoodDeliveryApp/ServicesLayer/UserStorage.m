//
//  UserStorage.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 06.04.2024.
//

#import "UserStorage.h"

@implementation UserStorage

- (BOOL)passedOnboarding {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:@"passedOnboarding"];
}

- (void)setPassedOnboarding:(BOOL)passedOnboarding {
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:passedOnboarding forKey:@"passedOnboarding"];
}

+ (instancetype)sharedInstance {
    static UserStorage* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
