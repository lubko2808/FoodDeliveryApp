//
//  UserStorage.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 06.04.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserStorage : NSObject

@property (nonatomic) BOOL passedOnboarding;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
