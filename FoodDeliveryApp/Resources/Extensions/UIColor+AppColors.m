//
//  UIColor+AppColors.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 04.04.2024.
//

#import "UIColor+AppColors.h"
#import "UIColor+Hex.h"

@implementation UIColor (appColors)

+ (UIColor*)accentOrange {
    return [UIColor hexFromRgb:0xD35400];
}
+ (UIColor*)gray {
    return [UIColor hexFromRgb:0xECF0F1];
}
+ (UIColor*)black {
    return [UIColor hexFromRgb:0x000000];
}
+( UIColor*)background {
    return [UIColor hexFromRgb:0xE5E5E5];
}

+ (UIColor*)white {
    return UIColor.whiteColor;
}

+ (UIColor*)dividerGray {
    return [[UIColor hexFromRgb:0x34495E] colorWithAlphaComponent:0.3];
}


@end
