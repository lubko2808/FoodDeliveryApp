//
//  BottomView.h
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 07.04.2024.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BottomView : UIView

@property (nonatomic, strong, nullable) void(^googleButtonTapped)(void);
@property (nonatomic, strong, nullable) void(^facebookButtonTapped)(void);


@end

NS_ASSUME_NONNULL_END
