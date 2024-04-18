//
//  LoginViewController.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 07.04.2024.
//

#import "LoginViewController.h"
#import "FDBottomView.h"
#import "FDTextField.h"
#import "FDButton.h"
#import "UIFont+Roboto.h"

@interface LoginViewController ()

// MARK: - Properties
@property (nonatomic, assign) LoginViewState state;
@property (nonatomic, strong) id<LoginViewOutput> loginViewOutput;

// MARK: - Views

@property (nonatomic, strong) UILabel* titleLabel;
@property (nonatomic, strong) UILabel* forgotLabel;
@property (nonatomic, strong) UIStackView* verticalStack;


// MARK: - Sign In
@property (nonatomic, strong) FDTextField* signInUsernameTextField;
@property (nonatomic, strong) FDTextField* signInPasswordTextField;

// MARK: - Sign Up
@property (nonatomic, strong) FDTextField* signUpUsernameTextField;
@property (nonatomic, strong) FDTextField* signUpPasswordTextField;
@property (nonatomic, strong) FDTextField* signUpReneterPasswordTextField;


// MARK: - Initial
@property (nonatomic, strong) UIImageView* logoImage;
@property (nonatomic, strong) FDButton* signInButton;
@property (nonatomic, strong) FDButton* signUpButton;
@property (nonatomic, strong) FDBottomView* bottomView;

@end

@implementation LoginViewController

// MARK: - init
- (instancetype)initWithViewOutput:(id<LoginViewOutput>)viewOutput state:(LoginViewState)state {
    self = [super init];
    if (self) {
        _loginViewOutput = viewOutput;
        _state = state;
        
    }
    return self;
}

// MARK: - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupLayout];
    self.state = LoginViewStateInitial;
    
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
    
    switch (self.state) {
        case LoginViewStateInitial:
            [self setupBottomView];
            [self setupLogoImage];
            [self setupSignInButton];
            [self setupSignUpButton];
            break;
        case LoginViewStateSignIn:
            [self setupBottomView];
            [self setupStack];
            [self setupSignInPasswordTextField];
            [self setupSignInUsernameTextField];
            [self setupTitleLabel];
            [self setupSignInButton];
            [self setupForgorLabel];
            break;
        case LoginViewStateSignUp:
            [self setupBottomView];
            [self setupStack];
            [self setupSignUpUsernameTextField];
            [self setupSignUpPasswordTextField];
            [self setupSignUpReneterPasswordTextField];
            [self setupTitleLabel];
            [self setupSignInButton];
            [self setupForgorLabel];
    }

}

- (void)setupStack {
    self.verticalStack = [UIStackView new];
    [self.view addSubview:self.verticalStack];
    self.verticalStack.translatesAutoresizingMaskIntoConstraints = NO;
    self.verticalStack.axis = UILayoutConstraintAxisVertical;
    self.verticalStack.spacing = 20;
    
    switch (self.state) {
        case LoginViewStateInitial:
            break;
        case LoginViewStateSignIn:
            self.signInUsernameTextField = [FDTextField new];
            self.signInPasswordTextField = [FDTextField new];
            
            [self.verticalStack addArrangedSubview:self.signInUsernameTextField];
            [self.verticalStack addArrangedSubview:self.signInPasswordTextField];
            
            [NSLayoutConstraint activateConstraints:@[
                [self.verticalStack.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
                [self.verticalStack.bottomAnchor constraintEqualToAnchor:self.bottomView.topAnchor constant:-262]
            ]];
            break;
        case LoginViewStateSignUp:
            self.signUpUsernameTextField = [FDTextField new];
            self.signUpPasswordTextField = [FDTextField new];
            self.signUpReneterPasswordTextField = [FDTextField new];
            
            [self.verticalStack addArrangedSubview:self.signUpUsernameTextField];
            [self.verticalStack addArrangedSubview:self.signUpPasswordTextField];
            [self.verticalStack addArrangedSubview:self.signUpReneterPasswordTextField];
            
            [NSLayoutConstraint activateConstraints:@[
                [self.verticalStack.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
                [self.verticalStack.bottomAnchor constraintEqualToAnchor:self.bottomView.topAnchor constant:-227]
            ]];
            break;
    }
    
    
    
}

- (void)setupTitleLabel {
    self.titleLabel = [UILabel new];
    [self.view addSubview:self.titleLabel];
    self.titleLabel.font = [UIFont getRobotoFont:RobotoBold size:24];
    self.titleLabel.text = @"Sign In";
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    switch (self.state) {
        case LoginViewStateInitial: break;
        case LoginViewStateSignIn:
            self.titleLabel.text = @"Sign in";
            break;
        case LoginViewStateSignUp:
            self.titleLabel.text = @"Sign up";
            break;
    }
    
    [NSLayoutConstraint activateConstraints:@[
        [self.titleLabel.bottomAnchor constraintEqualToAnchor:self.verticalStack.topAnchor constant:-38],
        [self.titleLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
        [self.titleLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
        [self.titleLabel.heightAnchor constraintEqualToConstant:50]
    ]];
    
}

- (void)setupForgorLabel {
    self.forgotLabel = [UILabel new];
    [self.view addSubview:self.forgotLabel];
    self.forgotLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.forgotLabel.text = @"Forgot Password?";
    self.forgotLabel.font = [UIFont getRobotoFont:RobotoRegular size:14];
    self.forgotLabel.textColor = [UIColor grayColor];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.forgotLabel.topAnchor constraintEqualToAnchor:self.signInButton.bottomAnchor constant:20],
        [self.forgotLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
    ]];
}

- (void)setupSignInUsernameTextField {
    self.signInUsernameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.signInUsernameTextField.placeholder = @"Username";
    
    [NSLayoutConstraint activateConstraints:@[
        [self.signInUsernameTextField.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
        [self.signInUsernameTextField.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
        [self.signInUsernameTextField.heightAnchor constraintEqualToConstant:50]
    ]];
}
- (void)setupSignInPasswordTextField {
    self.signInPasswordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.signInPasswordTextField.placeholder = @"Password";
    
    [NSLayoutConstraint activateConstraints:@[
        [self.signInPasswordTextField.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
        [self.signInPasswordTextField.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
        [self.signInPasswordTextField.heightAnchor constraintEqualToConstant:50]
    ]];
}

- (void)setupLogoImage {
    self.logoImage = [UIImageView new];
    [self.view addSubview:self.logoImage];
    self.logoImage.translatesAutoresizingMaskIntoConstraints = NO;
    self.logoImage.image = [UIImage imageNamed:@"appstore"];
    self.logoImage.layer.cornerRadius = 24;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.logoImage.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:109],
        [self.logoImage.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:57],
        [self.logoImage.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-57],
        [self.logoImage.heightAnchor constraintEqualToAnchor:self.logoImage.widthAnchor],
    ]];
}

- (void)setupSignInButton {
    self.signInButton = [[FDButton alloc] initWithSceme:FDButtonColorSchemeOrange];
    [self.view addSubview:self.signInButton];
    self.signInButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.signInButton setTitle:@"Sign in" forState:UIControlStateNormal];
    
    __weak typeof(self) weakSelf = self;
    self.signInButton.action = ^{
        [weakSelf onSignInTapped];
    };
    
    switch (self.state) {
        case LoginViewStateInitial: {
            
            [NSLayoutConstraint activateConstraints:@[
                [self.signInButton.topAnchor constraintEqualToAnchor:self.logoImage.bottomAnchor constant:60],
                [self.signInButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
                [self.signInButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
                [self.signInButton.heightAnchor constraintEqualToConstant:50],
            ]];
            break;
        }
        case LoginViewStateSignIn: {
            [NSLayoutConstraint activateConstraints:@[
                [self.signInButton.topAnchor constraintEqualToAnchor:self.verticalStack.bottomAnchor constant:30],
                [self.signInButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
                [self.signInButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
                [self.signInButton.heightAnchor constraintEqualToConstant:50],
            ]];
            break;
        }
        case LoginViewStateSignUp: {
            [NSLayoutConstraint activateConstraints:@[
                [self.signInButton.topAnchor constraintEqualToAnchor:self.verticalStack.bottomAnchor constant:30],
                [self.signInButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
                [self.signInButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
                [self.signInButton.heightAnchor constraintEqualToConstant:50],
            ]];
            break;
        }
    }
    
}

- (void)setupSignUpButton {
    self.signUpButton = [[FDButton alloc] initWithSceme:FDButtonColorSchemeGray];
    [self.view addSubview:self.signUpButton];
    self.signUpButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.signUpButton  setTitle:@"Sign up" forState:UIControlStateNormal];
    
    __weak typeof(self)weakSelf = self;
    self.signUpButton.action = ^{
        [weakSelf onSignUpTapped];
    };
    
    [NSLayoutConstraint activateConstraints:@[
        [self.signUpButton.topAnchor constraintEqualToAnchor:self.signInButton.bottomAnchor constant:20],
        [self.signUpButton.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
        [self.signUpButton.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
        [self.signUpButton.heightAnchor constraintEqualToConstant:50],
    ]];
}

- (void)setupBottomView {
    self.bottomView = [FDBottomView new];
    [self.view addSubview:self.bottomView];
    self.bottomView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.bottomView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor],
        [self.bottomView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
        [self.bottomView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
        [self.bottomView.heightAnchor constraintEqualToConstant:150]
    ]];
    
    
}

- (void)setupSignUpPasswordTextField {
    self.signUpPasswordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.signUpPasswordTextField.placeholder = @"Enter Password";
    
    [NSLayoutConstraint activateConstraints:@[
        [self.signUpPasswordTextField.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
        [self.signUpPasswordTextField.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
        [self.signUpPasswordTextField.heightAnchor constraintEqualToConstant:50]
    ]];
}

- (void)setupSignUpUsernameTextField {
    self.signUpUsernameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.signUpUsernameTextField.placeholder = @"Enter Username";
    
    [NSLayoutConstraint activateConstraints:@[
        [self.signUpUsernameTextField.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
        [self.signUpUsernameTextField.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
        [self.signUpUsernameTextField.heightAnchor constraintEqualToConstant:50]
    ]];
}

- (void)setupSignUpReneterPasswordTextField {
    self.signUpReneterPasswordTextField.translatesAutoresizingMaskIntoConstraints = NO;
    self.signUpReneterPasswordTextField.placeholder = @"Reneter Password";
    
    [NSLayoutConstraint activateConstraints:@[
        [self.signUpReneterPasswordTextField.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:30],
        [self.signUpReneterPasswordTextField.rightAnchor constraintEqualToAnchor:self.view.rightAnchor constant:-30],
        [self.signUpReneterPasswordTextField.heightAnchor constraintEqualToConstant:50]
    ]];
}

// MARK: - LoginViewInput

- (void)onSignInTapped {
    switch (self.state) {
        case LoginViewStateInitial:
            [self.loginViewOutput goToSignIn];
            break;
        case LoginViewStateSignIn:
            break;
        case LoginViewStateSignUp:
            break;
    }
}

- (void)onSignUpTapped {
    switch (self.state) {
        case LoginViewStateInitial:
            [self.loginViewOutput goToSignUp];
            break;
        case LoginViewStateSignIn:
            break;
        case LoginViewStateSignUp:
            break;
    }
}

- (void)onFacebookTapped {
    
}

- (void)onGoogleTapped {
    
}

- (void)onForgorPasswordTapped {
    
}

- (void)onBackPressed {
    
}

@end
