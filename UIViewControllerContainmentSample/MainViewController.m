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

- (void)setupContainedViewControllers {
    [self addChildViewController:self.leftViewController        forView:self.leftView];
    [self addChildViewController:self.topRightViewController    forView:self.topRightView];
    [self addChildViewController:self.bottomRightViewController forView:self.bottomRightView];
}

#pragma mark - layout

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
