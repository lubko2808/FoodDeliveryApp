//
//  OnboardingPartViewController.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 06.04.2024.
//

#import "OnboardingPartViewController.h"
#import "UIFont+Roboto.h"
#import "UIColor+AppColors.h"

@interface OnboardingPartViewController ()

@property (nonatomic, strong) UIImageView* iconImageView;
@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* descriptionLabel;

@end

@implementation OnboardingPartViewController

// MARK: - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayout];
}

// MARK: - Init
- (instancetype)initWithIconImage:(UIImage*)image
                        titleText:(NSString*)titleText
                  descriptionText:(NSString*)descriptionText {
    self = [super init];
    if (self) {
        _iconImageView = [UIImageView new];
        _titleLabel = [UILabel new];
        _descriptionLabel = [UILabel new];
        
        _iconImageView.image = image;
        _titleLabel.text = titleText;
        _descriptionLabel.text = descriptionText;
    }
    return self;
}

// MARK: - Layout
- (void)setupLayout {
    [self setupView];
    [self setupIconImageView];
    [self setupTitleLabel];
    [self setupDescriptionLabel];
}

- (void)setupView {
    self.view.backgroundColor = [UIColor accentOrange];
}

- (void)setupIconImageView {
    [self.view addSubview:self.iconImageView];
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.iconImageView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:-50],
        [self.iconImageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.iconImageView.widthAnchor constraintEqualToConstant:200],
        [self.iconImageView.heightAnchor constraintEqualToConstant:200]
    ]];
}

- (void)setupTitleLabel {
    [self.view addSubview:self.titleLabel];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.font = [UIFont getRobotoFont:RobotoBold size:24];
    self.titleLabel.textColor = [UIColor white];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;

    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.iconImageView.bottomAnchor constant:20],
        [self.titleLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    ]];
}

- (void)setupDescriptionLabel {
    [self.view addSubview:self.descriptionLabel];
    self.descriptionLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.descriptionLabel.font = [UIFont getRobotoFont:RobotoRegular size:14];
    self.descriptionLabel.textColor = [UIColor white];
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.descriptionLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:23],
        [self.descriptionLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.descriptionLabel.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:71],
        [self.descriptionLabel.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-72],
    ]];
}



@end
