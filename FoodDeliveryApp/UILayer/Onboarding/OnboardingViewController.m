//
//  OnboardingViewController.m
//  FoodDeliveryApp
//
//  Created by Lubomyr Chorniak on 05.04.2024.
//

#import "OnboardingViewController.h"

@interface OnboardingViewController ()

// MARK: - Properties
@property (nonatomic, strong) NSArray<UIViewController*>* pages;

// MARK: - Views
@property (nonatomic, strong) UIPageViewController* pageViewController;
@property (nonatomic, strong) UIPageControl* pageControl;

@end

@implementation OnboardingViewController

// MARK: - Life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupPageViewController];
    [self setupPageControl];
}

// MARK: - init
- (instancetype)initWithPages:(NSArray<UIViewController*>*)pages viewOutput:(OnboardingViewPresenter*)viewOuput {
    self = [super init];
    if (self) {
        _pages = pages;
        _viewOutput = viewOuput;
    }
    return self;
}



// MARK: - Layout
- (void)setupPageViewController {
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
//    [self.pageViewController setViewControllers:self.pages direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    [self.pageViewController setViewControllers:@[self.pages.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)setupPageControl {
    self.pageControl = [UIPageControl new];
    self.pageControl.numberOfPages = self.pages.count;
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    
    [NSLayoutConstraint activateConstraints:@[
        [self.pageControl.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.pageControl.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-30]
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
    self.pageControl.currentPage = index;
}


@end
