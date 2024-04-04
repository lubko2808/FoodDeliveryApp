//
//  UIColor+AppColors.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 04.04.2024.
//

#import "UIColor+AppColors.h"
#import "UIColor+Hex.h"

@implementation UIColor (appColors)

+(UIColor*)accentOrange {
    return [UIColor hexRgbValue:0xD35400];
}
+(UIColor*)grey {
    return [UIColor hexRgbValue:0xECF0F1];
}
+(UIColor*)black {
    return [UIColor hexRgbValue:0x000000];
}
+(UIColor*)background {
    return [UIColor hexRgbValue:0xE5E5E5];
}

@end
