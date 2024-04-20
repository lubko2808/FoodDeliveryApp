//
//  OnboardingViewController.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "OnboardingViewController.h"
#import "UIColor+AppColors.h"
#import "UIFont+Roboto.h"
#import "FDButton.h"

@interface OnboardingViewController ()

// MARK: - Properties
@property (nonatomic, strong) NSArray<UIViewController*>* pages;
@property (nonatomic) NSInteger currentPageIndex;

// MARK: - Views
@property (nonatomic, strong) UIPageViewController* pageViewController;
@property (nonatomic, strong) UIPageControl* pageControl;
@property (nonatomic, strong) FDButton* bottomButton;


@end

@implementation OnboardingViewController

// MARK: - Constants
static NSInteger const cPage1 = 0;
static NSInteger const cPage2 = 1;
static NSInteger const cPage3 = 2;
static NSInteger const cPage4 = 3;

// MARK: - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLayout];

}

// MARK: - init
- (instancetype)initWithPages:(NSArray<UIViewController*>*)pages viewOutput:(OnboardingViewPresenter*)viewOuput {
    self = [super init];
    if (self) {
        _pages = pages;
        _viewOutput = viewOuput;
        _bottomButton = [[FDButton alloc] initWithSceme:FDButtonColorSchemeGray];
        _currentPageIndex = 0;
            
    }
    return self;
}

// MARK: - Actions
- (void)onButtonPressed {
    switch (self.pageControl.currentPage) {
        case cPage1:
            self.pageControl.currentPage = 1;
            [self.pageViewController setViewControllers:@[self.pages[1]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
            break;
        case cPage2:
            self.pageControl.currentPage = 2;
            [self.pageViewController setViewControllers:@[self.pages[2]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
            break;
        case cPage3:
            self.pageControl.currentPage = 3;
            [self.pageViewController setViewControllers:@[self.pages[3]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
            [self.bottomButton setTitle:@"Cool!" forState:UIControlStateNormal];
            break;
        case cPage4:
            [self.viewOutput onboardingFinished];
            NSLog(@"exit");
        default:
            break;
    }
}

// MARK: - Layout
- (void)setupLayout {
    [self setupPageViewController];
    [self setupPageControl];
    [self setupButton];
}

- (void)setupPageViewController {
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    self.pageViewController.view.backgroundColor = [UIColor accentOrange];
    
    [self.pageViewController setViewControllers:@[self.pages.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)setupPageControl {
    self.pageControl = [UIPageControl new];
    self.pageControl.numberOfPages = self.pages.count;
    self.pageControl.currentPage = 0;
    self.pageControl.userInteractionEnabled = NO;
    [self.view addSubview:self.pageControl];
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.pageControl.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.pageControl.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-45]
    ]];
}

- (void)setupButton {
    [self.view addSubview:self.bottomButton];

    __weak typeof(self) weakSelf = self;
    self.bottomButton.action = ^{
        [weakSelf onButtonPressed];
    }; 
    
    [NSLayoutConstraint activateConstraints:@[
        [self.bottomButton.bottomAnchor constraintEqualToAnchor: self.pageControl.bottomAnchor constant:-44],
        [self.bottomButton.leadingAnchor constraintEqualToAnchor: self.view.leadingAnchor constant:30],
        [self.bottomButton.trailingAnchor constraintEqualToAnchor: self.view.trailingAnchor constant:-30],
        [self.bottomButton.heightAnchor constraintEqualToConstant:50]
    ]];

}

// MARK: - UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSInteger currentIndex = [self.pages indexOfObject:viewController];
    if (currentIndex > 0) {
        return self.pages[currentIndex - 1];
    }
    
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
   
    NSInteger currentIndex = [self.pages indexOfObject:viewController];

    if (currentIndex < self.pages.count - 1) {
        return self.pages[currentIndex + 1];
    }
    
    return nil;
}

// MARK: - UIPageViewControllerDelegate

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    NSInteger index = [self.pages indexOfObject:pendingViewControllers.firstObject];
    self.currentPageIndex = index;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
    if (completed) {
        self.currentPageIndex = self.currentPageIndex;
        self.pageControl.currentPage = self.currentPageIndex;
        if (self.currentPageIndex == self.pages.count - 1) {
            [self.bottomButton setTitle:@"Cool!" forState:UIControlStateNormal];
        } else {
            [self.bottomButton setTitle:@"Next" forState:UIControlStateNormal];
        }
    }
    
}




@end
