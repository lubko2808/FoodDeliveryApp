//
//  LoginViewController.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 07.04.2024.
//

#import "LoginViewController.h"
#import "BottomView.h"

@interface LoginViewController ()

@property (nonatomic, strong) BottomView* bottomView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupLayout];
    
    __weak typeof(self) weakSelf = self;
    self.bottomView.googleButtonTapped = ^{
        [weakSelf googleButtonTapped];
    };
    self.bottomView.facebookButtonTapped = ^{
        [weakSelf facebookButtonTapped];
    };
}

// MARK: - Action handlers
- (void)googleButtonTapped {
    NSLog(@"googleButtonTapped");
}

- (void)facebookButtonTapped {
    NSLog(@"facebookButtonTapped");
}

// MARK: - Layout
- (void)setupLayout {
    [self setupBottomView];
}

- (void)setupBottomView {
    self.bottomView = [BottomView new];
    [self.view addSubview:self.bottomView];
    self.bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.bottomView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.bottomView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.bottomView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.bottomView.heightAnchor constraintEqualToConstant:150]
    ]];
}

@end
