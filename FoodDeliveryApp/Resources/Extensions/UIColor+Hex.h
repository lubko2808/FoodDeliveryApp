//
//  UIColor+Hex.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 04.04.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (hex)

+(UIColor*)hexFromRgb:(UInt64)rgbValue;

@end

NS_ASSUME_NONNULL_END
