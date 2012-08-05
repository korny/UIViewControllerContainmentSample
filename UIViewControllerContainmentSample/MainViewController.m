//
//  MainViewController.m
//  UIViewControllerContainmentSample1
//
//  Created by Peter Friese on 29.11.11.
//  Copyright (c) 2011 http://peterfriese.de. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *topRightView;
@property (weak, nonatomic) IBOutlet UIView *bottomRightView;

@property (strong, nonatomic) SampleViewController *leftController;
@property (strong, nonatomic) SampleViewController *topRightController;
@property (strong, nonatomic) SampleViewController *bottomRightController;

@end

@implementation MainViewController

#pragma mark - Child View Controllers

- (void)updateLeftView
{
    self.leftController.view.frame = self.leftView.bounds;
    [self.leftView addSubview:self.leftController.view];    
}

- (void)setLeftController:(SampleViewController *)leftController
{
    _leftController = leftController;
    
    // handle view controller hierarchy
    [self addChildViewController:_leftController];
    [_leftController didMoveToParentViewController:self];
    
    if ([self isViewLoaded]) {
        [self updateLeftView];
    }
}

- (void)updateTopRightView
{
    self.topRightController.view.frame = self.topRightView.bounds;
    [self.topRightView addSubview:self.topRightController.view];
}

- (void)setTopRightController:(SampleViewController *)topRightController
{
    _topRightController = topRightController;
    
    // handle view controller hierarchy
    [self addChildViewController:_topRightController];
    [_topRightController didMoveToParentViewController:self];
    
    if ([self isViewLoaded]) {
        [self updateTopRightView];
    }
}

- (void)updateBottomRightView
{
    self.bottomRightController.view.frame = self.bottomRightView.bounds;
    [self.bottomRightView addSubview:self.bottomRightController.view];    
}

- (void)setBottomRightController:(SampleViewController *)bottomRightController
{
    _bottomRightController = bottomRightController;
    
    // handle view controller hierarchy
    [self addChildViewController:_bottomRightController];
    [_bottomRightController didMoveToParentViewController:self];
    
    if ([self isViewLoaded]) {
        [self updateBottomRightView];
    }
}

- (void)setupContainedViewControllers
{
    SampleViewController *leftViewController = [[SampleViewController alloc] init];
    leftViewController.color = [UIColor blueColor];
    leftViewController.secondaryColor = [UIColor lightGrayColor];
    self.leftController = leftViewController;

    SampleViewController *topRightViewController = [[SampleViewController alloc] init];
    topRightViewController.color = [UIColor redColor];
    topRightViewController.secondaryColor = [UIColor grayColor];
    self.topRightController = topRightViewController;

    SampleViewController *bottomRightViewController = [[SampleViewController alloc] init];
    bottomRightViewController.color = [UIColor greenColor];
    bottomRightViewController.secondaryColor = [UIColor blackColor];
    self.bottomRightController = bottomRightViewController;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSLog(@"MainViewController viewDidLoad");
    [self setupContainedViewControllers];
}

- (void)viewDidUnload
{
    NSLog(@"MainViewController viewDidUnload");    
    [self setLeftController:nil];
    [self setTopRightController:nil];
    [self setBottomRightController:nil];
    [self setLeftView:nil];
    [self setTopRightView:nil];
    [self setBottomRightView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    NSLog(@"MainViewController shouldAutorotateToInterfaceOrientation %d", interfaceOrientation);    
    // Return YES for supported orientations
	return YES;
}

- (void)layoutForOrientation:(UIInterfaceOrientation)orientation
{
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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self layoutForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    NSLog(@"MainViewController viewWIllAppear");    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"MainViewController viewWillRotateToInterfaceOrientation");    
    [UIView animateWithDuration:duration animations:^{
        [self layoutForOrientation:toInterfaceOrientation];
    }];
}

@end
