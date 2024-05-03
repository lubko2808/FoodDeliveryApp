//
//  FDButton.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 07.04.2024.
//

#import "FDButton.h"
#import "UIFont+Roboto.h"
#import "UIColor+AppColors.h"

@interface FDButton ()

@property (nonatomic, strong) UIButton* button;

@end

@implementation FDButton

- (instancetype)initWithSceme:(FDButtonColorScheme)scheme
{
    self = [super init];
    if (self) {
        _button = [UIButton new];
        _scheme = FDButtonColorSchemeWhite;
        self.backgroundColor = [UIColor white];
        [self setupButton];
        self.layer.cornerRadius = 24;
        self.translatesAutoresizingMaskIntoConstraints = NO;
        [self setColorSchemeTo:scheme];
    }
    return self;
}

- (void)setupButton {
    [self addSubview:self.button];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    self.button.titleLabel.font = [UIFont getRobotoFont:RobotoBold size:18];
    self.button.titleLabel.textColor = [UIColor black];
    self.button.layer.cornerRadius = 24;
    [self.button setTitle:@"Next" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(onButtonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.button.bottomAnchor constraintEqualToAnchor: self.bottomAnchor],
        [self.button.leadingAnchor constraintEqualToAnchor: self.leadingAnchor],
        [self.button.trailingAnchor constraintEqualToAnchor: self.trailingAnchor],
        [self.button.topAnchor constraintEqualToAnchor:self.topAnchor]
    ]];
    
}

- (void)setColorSchemeTo:(FDButtonColorScheme)scheme {
    switch (scheme) {
        case FDButtonColorSchemeWhite:
            self.button.backgroundColor = [UIColor white];
            [self.button setTitleColor:[UIColor accentOrange] forState:UIControlStateNormal];
            break;
        case FDButtonColorSchemeOrange:
            self.button.backgroundColor = [UIColor accentOrange];
            [self.button setTitleColor:[UIColor white] forState:UIControlStateNormal];
            break;
        case FDButtonColorSchemeGray:
            self.button.backgroundColor = [UIColor gray];
            [self.button setTitleColor:[UIColor black] forState:UIControlStateNormal];
            break;
    }
}

- (void)setTitle:(nullable NSString *)title forState:(UIControlState)state {
    [self.button setTitle:title forState:state];
}

- (void)onButtonPressed {
    if (self.action) {
        self.action();
    }
}

@end
