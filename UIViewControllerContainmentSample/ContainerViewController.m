//
//  ContainerViewController.m
//  UIViewControllerContainmentSample
//
//  Created by Kornelius Kalnbach on 06.08.12.
//  Copyright (c) 2012 http://peterfriese.de. All rights reserved.
//

#import "ContainerViewController.h"

@interface ContainerViewController ()

@end

@implementation ContainerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupContainedViewControllers];
}

- (void)setupContainedViewControllers {
    // overwrite this method in subclasses using addChildViewController:forView:
}

- (void)addChildViewController:(UIViewController *)childController forView:(UIView *)view {
    [self addChildViewController:childController];
    [childController didMoveToParentViewController:self];
    
    childController.view.frame = view.bounds;
    [view addSubview:childController.view];
}

@end
