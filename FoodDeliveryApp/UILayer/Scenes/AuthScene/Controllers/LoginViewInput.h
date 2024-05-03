//
//  LoginViewInput.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 18.04.2024.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol LoginViewInput <NSObject>

- (void)startLoader;
- (void)stopLoader;

@end

NS_ASSUME_NONNULL_END
