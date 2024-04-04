//
//  UIFont+Extension.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 03.04.2024.
//

#import "UIFont+Roboto.h"

@implementation UIFont (roboto)

+(instancetype)getRobotoFont:(Roboto)fontType size:(CGFloat)size {
    
    switch (fontType) {
        case RobotoBlack:
            return [UIFont fontWithName:@"Roboto-Black" size:size];
        case RobotoBlackItalic:
            return [UIFont fontWithName:@"Roboto-BlackItalic" size:size];
        case RobotoBold:
            return [UIFont fontWithName:@"Roboto-Bold" size:size];
        case RobotoBoldItalic:
            return [UIFont fontWithName:@"Roboto-BoldItalic" size:size];
        case RobotoItalic:
            return [UIFont fontWithName:@"Roboto-Italic" size:size];
        case RobotoLight:
            return [UIFont fontWithName:@"Roboto-Light" size:size];
        case RobotoLightItalic:
            return [UIFont fontWithName:@"Roboto-LightItalic" size:size];
        case RobotoMedium:
            return [UIFont fontWithName:@"Roboto-Medium" size:size];
        case RobotoMediumItalic:
            return [UIFont fontWithName:@"Roboto-MediumItalic" size:size];
        case RobotoRegular:
            return [UIFont fontWithName:@"Roboto-Regular" size:size];
        case RobotoThin:
            return [UIFont fontWithName:@"Roboto-Thin" size:size];
        case RobotoThinItalic:
            return [UIFont fontWithName:@"Roboto-ThinItalic" size:size];
    }
    
}

@end
