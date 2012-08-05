//
//  SampleViewController.m
//  UIViewControllerContainmentSample1
//
//  Created by Peter Friese on 29.11.11.
//  Copyright (c) 2011 http://peterfriese.de. All rights reserved.
//

#import "SampleViewController.h"

@interface SampleViewController ()
@property (nonatomic, copy) UIColor *color;
@property (nonatomic, copy) UIColor *secondaryColor;
@end

@implementation SampleViewController

- (id)initWithColor:(UIColor *)color secondaryColor:(UIColor *)secondaryColor {
    self = [self init];
    
    if (self) {
        self.color = color;
        self.secondaryColor = secondaryColor;
    }
    
    return self;
}

#pragma mark - layout

- (void)layoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        [self.view setBackgroundColor:self.color];
    }
    else {
        [self.view setBackgroundColor:self.secondaryColor];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [UIView animateWithDuration:duration animations:^{
        [self layoutForOrientation:toInterfaceOrientation];
    }];
}

@end
