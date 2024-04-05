//
//  UIColor+Hex.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 04.04.2024.
//

#import "UIColor+Hex.h"

@implementation UIColor (hex)

+(UIColor*)hexFromRgb:(UInt64)rgbValue {
    return [[UIColor alloc] initWithRed:((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0
                                  green:((CGFloat)((rgbValue & 0x00FF00) >> 8)) / 255.0
                                   blue:((CGFloat)(rgbValue & 0x0000FF)) 
                                  alpha:1.0];
}

@end
