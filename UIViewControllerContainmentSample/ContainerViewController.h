//
//  ContainerViewController.h
//  UIViewControllerContainmentSample
//
//  Created by Kornelius Kalnbach on 06.08.12.
//  Copyright (c) 2012 http://peterfriese.de. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContainerViewController : UIViewController

- (void)setupContainedViewControllers;
- (void)addChildViewController:(UIViewController *)childController forView:(UIView *)view;

@end
