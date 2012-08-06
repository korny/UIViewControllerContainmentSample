//
//  MainViewController.m
//  UIViewControllerContainmentSample1
//
//  Created by Peter Friese on 29.11.11.
//  Copyright (c) 2011 http://peterfriese.de. All rights reserved.
//

#import "MainViewController.h"
#import "SampleNavigationController.h"
#import "SampleViewController.h"

@interface MainViewController ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *topRightView;
@property (weak, nonatomic) IBOutlet UIView *bottomRightView;

@property (strong, nonatomic) SampleNavigationController *leftViewController;
@property (strong, nonatomic) SampleNavigationController *topRightViewController;
@property (strong, nonatomic) SampleNavigationController *bottomRightViewController;
@end

@implementation MainViewController

- (SampleNavigationController *)leftViewController {
    if (!_leftViewController) {
        _leftViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SampleViewController"];
        [_leftViewController.sampleViewController setColor:[UIColor blueColor] secondaryColor:[UIColor lightGrayColor]];
    }
    
    return _leftViewController;
}

- (SampleNavigationController *)topRightViewController {
    if (!_topRightViewController) {
        _topRightViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SampleViewController"];
        [_topRightViewController.sampleViewController setColor:[UIColor redColor] secondaryColor:[UIColor grayColor]];
    }
    
    return _topRightViewController;
}

- (SampleNavigationController *)bottomRightViewController {
    if (!_bottomRightViewController) {
        _bottomRightViewController = [[self storyboard] instantiateViewControllerWithIdentifier:@"SampleViewController"];
        [_bottomRightViewController.sampleViewController setColor:[UIColor greenColor] secondaryColor:[UIColor darkGrayColor]];
    }
    
    return _bottomRightViewController;
}

#pragma mark - Child View Controllers

- (void)addChildViewController:(UIViewController *)childController forView:(UIView *)view {
    [self addChildViewController:childController];
    childController.view.frame = view.bounds;
    [view addSubview:childController.view];
    [childController didMoveToParentViewController:self];
}

- (void)setupContainedViewControllers {
    [self addChildViewController:self.leftViewController        forView:self.leftView];
    [self addChildViewController:self.topRightViewController    forView:self.topRightView];
    [self addChildViewController:self.bottomRightViewController forView:self.bottomRightView];
}

#pragma mark - Layout

#define PADDING_WIDTH 20
- (void)layoutForOrientation:(UIInterfaceOrientation)orientation {
    self.leftView.frame        = CGRectMake(PADDING_WIDTH,
                                            PADDING_WIDTH,
                                            360,
                                            self.view.bounds.size.height - PADDING_WIDTH * 2);
    self.topRightView.frame    = CGRectMake(self.leftView.frame.size.width + PADDING_WIDTH * 2,
                                            PADDING_WIDTH,
                                            self.view.bounds.size.width - self.leftView.frame.size.width - PADDING_WIDTH * 3,
                                            (self.view.bounds.size.height - PADDING_WIDTH * 3) / 2);
    self.bottomRightView.frame = CGRectMake(self.leftView.frame.size.width + PADDING_WIDTH * 2,
                                            self.topRightView.frame.size.height + PADDING_WIDTH * 2,
                                            self.view.bounds.size.width - self.leftView.frame.size.width - PADDING_WIDTH * 3,
                                            self.view.bounds.size.height - self.topRightView.frame.size.height - PADDING_WIDTH * 3);
}

- (void)viewWillLayoutSubviews {
    [self layoutForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupContainedViewControllers];
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
    self.leftView = nil;
    self.topRightView = nil;
    self.bottomRightView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

// Turn off color changing.
// - (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers {
//     return NO;
// }

@end
