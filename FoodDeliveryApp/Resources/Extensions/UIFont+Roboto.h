//
//  UIFont+Extension.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 03.04.2024.
//

#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN



typedef NS_ENUM(NSInteger, Roboto) {
    RobotoBlack,
    RobotoBlackItalic,
    RobotoBold,
    RobotoBoldItalic,
    RobotoItalic,
    RobotoLight,
    RobotoLightItalic,
    RobotoMedium,
    RobotoMediumItalic,
    RobotoRegular,
    RobotoThin,
    RobotoThinItalic
};


@interface UIFont (roboto)

+(instancetype)getRobotoFont:(Roboto)fontType size:(CGFloat)size;

@end

NS_ASSUME_NONNULL_END
