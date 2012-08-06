//
//  MainViewController.m
//  UIViewControllerContainmentSample1
//
//  Created by Peter Friese on 29.11.11.
//  Copyright (c) 2011 http://peterfriese.de. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController

- (void)setupContainedViewControllers {
    [self addChildViewControllerWithIdentifier:@"Left View Controller" forSubview:leftView];
    [self addChildViewControllerWithIdentifier:@"Top Right View Controller" forSubview:topRightView];
    [self addChildViewControllerWithIdentifier:@"Bottom Right View Controller" forSubview:bottomRightView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

@end
