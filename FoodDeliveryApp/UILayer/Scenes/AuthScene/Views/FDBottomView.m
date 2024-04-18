//
//  BottomView.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 07.04.2024.
//

#import "FDBottomView.h"
#import "UIFont+Roboto.h"
#import "UIColor+AppColors.h"

@interface FDBottomView ()

@property (nonatomic, strong) UILabel* label;
@property (nonatomic, strong) UIView* dividerView;
@property (nonatomic, strong) UIImageView* bottomLeftImageView;
@property (nonatomic, strong) UIButton* googleButton;
@property (nonatomic, strong) UIButton* facebookButton;

@end

@implementation FDBottomView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupLayout];
    }
    return self;
}

// MARK: - Layout
- (void)setupLayout {
    self.backgroundColor = UIColor.clearColor;
    [self setupLabel];
    [self setupDividerView];
    [self setupBottomLeftImageView];
    [self setupGoogleButton];
    [self setupFacebookButton];
}

- (void)setupLabel {
    self.label = [UILabel new];
    [self addSubview:self.label];
    self.label.translatesAutoresizingMaskIntoConstraints = NO;
    self.label.text = @"Or connect with";
    self.label.font = [UIFont getRobotoFont:RobotoRegular size:14];
    self.label.textColor = UIColor.grayColor;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.label.topAnchor constraintEqualToAnchor:self.topAnchor constant:0],
        [self.label.trailingAnchor constraintEqualToAnchor: self.trailingAnchor constant:-30]
    ]];
}

- (void)setupDividerView {
    self.dividerView = [UIView new];
    [self addSubview:self.dividerView];
    self.dividerView.translatesAutoresizingMaskIntoConstraints = NO;
    self.dividerView.backgroundColor = [UIColor dividerGray];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.dividerView.centerYAnchor constraintEqualToAnchor:self.label.centerYAnchor constant:0],
        [self.dividerView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor],
        [self.dividerView.trailingAnchor constraintEqualToAnchor:self.label.leadingAnchor constant:-12],
        [self.dividerView.heightAnchor constraintEqualToConstant:3]
    ]];
}

- (void)setupBottomLeftImageView {
    self.bottomLeftImageView = [UIImageView new];
    [self addSubview:self.bottomLeftImageView];
    self.bottomLeftImageView.image = [UIImage imageNamed:@"BottomViewImage"];
    self.bottomLeftImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.bottomLeftImageView.topAnchor constraintEqualToAnchor:self.dividerView.bottomAnchor constant:18],
        [self.bottomLeftImageView.leadingAnchor constraintEqualToAnchor:self.leadingAnchor constant:-(282.0 / 4.0)],
        [self.bottomLeftImageView.heightAnchor constraintEqualToConstant:150],
        [self.bottomLeftImageView.widthAnchor constraintEqualToConstant:282]

    ]];
}

- (void)setupGoogleButton {
    self.googleButton = [UIButton new];
    [self addSubview:self.googleButton];
    self.googleButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.googleButton setImage:[UIImage imageNamed:@"google-plus"] forState:UIControlStateNormal];
    [self.googleButton addTarget:self action:@selector(onGoogleButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.googleButton.topAnchor constraintEqualToAnchor:self.label.bottomAnchor constant:20],
        [self.googleButton.trailingAnchor constraintEqualToAnchor:self.trailingAnchor constant:-30]
    ]];
    
}

- (void)setupFacebookButton {
    self.facebookButton = [UIButton new];
    [self addSubview:self.facebookButton];
    self.facebookButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.facebookButton setImage:[UIImage imageNamed:@"facebook"] forState:UIControlStateNormal];
    [self.facebookButton addTarget:self action:@selector(onFacebookButtonTapped) forControlEvents:UIControlEventTouchUpInside];

    
    [NSLayoutConstraint activateConstraints:@[
        [self.facebookButton.trailingAnchor constraintEqualToAnchor:self.googleButton.leadingAnchor constant:-20],
        [self.facebookButton.centerYAnchor constraintEqualToAnchor:self.googleButton.centerYAnchor]
    ]];
}

- (void)onGoogleButtonTapped {
    if (self.googleButtonTapped) {
        self.googleButtonTapped();
    }
}

- (void)onFacebookButtonTapped {
    if (self.facebookButtonTapped) {
        self.facebookButtonTapped();
    }
}




@end
