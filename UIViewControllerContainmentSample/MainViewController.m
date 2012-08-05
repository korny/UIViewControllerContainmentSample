//
//  MainViewController.m
//  UIViewControllerContainmentSample1
//
//  Created by Peter Friese on 29.11.11.
//  Copyright (c) 2011 http://peterfriese.de. All rights reserved.
//

#import "MainViewController.h"
#import "SampleViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *topRightView;
@property (weak, nonatomic) IBOutlet UIView *bottomRightView;

@property (strong, nonatomic) SampleViewController *leftViewController;
@property (strong, nonatomic) SampleViewController *topRightViewController;
@property (strong, nonatomic) SampleViewController *bottomRightViewController;

@end

@implementation MainViewController

- (SampleViewController *)leftViewController {
    if (!_leftViewController) {
        _leftViewController = [[SampleViewController alloc] initWithColor:[UIColor blueColor] secondaryColor:[UIColor lightGrayColor]];
    }
    
    return _leftViewController;
}

- (SampleViewController *)topRightViewController {
    if (!_topRightViewController) {
        _topRightViewController = [[SampleViewController alloc] initWithColor:[UIColor redColor] secondaryColor:[UIColor grayColor]];
    }
    
    return _topRightViewController;
}

- (SampleViewController *)bottomRightViewController {
    if (!_bottomRightViewController) {
        _bottomRightViewController = [[SampleViewController alloc] initWithColor:[UIColor greenColor] secondaryColor:[UIColor darkGrayColor]];
    }
    
    return _bottomRightViewController;
}

#pragma mark - Child View Controllers

- (void)addChildViewController:(UIViewController *)childController forView:(UIView *)view {
    [self addChildViewController:childController];
    [childController didMoveToParentViewController:self];
    
    childController.view.frame = view.bounds;
    [view addSubview:childController.view];
}

- (void)setupContainedViewControllers {
    [self addChildViewController:self.leftViewController        forView:self.leftView];
    [self addChildViewController:self.topRightViewController    forView:self.topRightView];
    [self addChildViewController:self.bottomRightViewController forView:self.bottomRightView];
}

#pragma mark - layout

- (void)layoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        self.leftView.frame = CGRectMake(20, 20, 340, 964);
        self.topRightView.frame = CGRectMake(380, 20, 368, 374);
        self.bottomRightView.frame = CGRectMake(380, 415, 368, 569);
    }
    else {
        self.leftView.frame = CGRectMake(20, 20, 340, 708);
        self.topRightView.frame = CGRectMake(380, 20, 624, 374);
        self.bottomRightView.frame = CGRectMake(380, 415, 624, 313);
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupContainedViewControllers];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    [self setLeftView:nil];
    [self setTopRightView:nil];
    [self setBottomRightView:nil];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

@end
