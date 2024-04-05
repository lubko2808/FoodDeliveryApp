//
//  ViewController.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 03.04.2024.
//

#import "ViewController.h"
#import "UIFont+Roboto.h"
#import "UIColor+AppColors.h"

@interface ViewController ()

@property (strong, nonatomic) UILabel* label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.label = [UILabel new];
    self.label.text = @"hello world";
    self.label.translatesAutoresizingMaskIntoConstraints = false;

    
    [self.view addSubview:self.label];
    
    self.label.font = [UIFont getRobotoFont:RobotoBold size:40];
    self.view.backgroundColor = [UIColor background];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.label.frame = CGRectMake(150, 400, 200, 44);
}

@end
 
