//
//  FDButton.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 07.04.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, FDButtonColorScheme) {
    FDButtonColorSchemeWhite,
    FDButtonColorSchemeOrange,
    FDButtonColorSchemeGray
};

@interface FDButton : UIView

@property (nonatomic) FDButtonColorScheme scheme;
@property (nonatomic, strong, nullable) void(^action)(void);

- (instancetype)initWithSceme:(FDButtonColorScheme)scheme;

- (void)setColorSchemeTo:(FDButtonColorScheme)scheme;
- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state;

@end

NS_ASSUME_NONNULL_END
