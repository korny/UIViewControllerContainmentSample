//
//  SampleViewController.m
//  UIViewControllerContainmentSample1
//
//  Created by Peter Friese on 29.11.11.
//  Copyright (c) 2011 http://peterfriese.de. All rights reserved.
//

#import "SampleViewController.h"

@implementation SampleViewController

- (void)layoutForOrientation:(UIInterfaceOrientation)orientation
{
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        [self.view setBackgroundColor:self.color];
    }
    else {
        [self.view setBackgroundColor:self.secondaryColor];
    }
}

- (void)updateLayout
{
    [self layoutForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

- (void)setColor:(UIColor *)color
{
    _color = color;
    [self updateLayout];
}

- (void)setSecondaryColor:(UIColor *)secondaryColor
{
    _secondaryColor = secondaryColor;
    [self updateLayout];    
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateLayout];
    NSLog(@"SampleViewController viewDidLoad");    
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    NSLog(@"SampleViewController willRotateToInterfaceOrientation");
    [UIView animateWithDuration:duration animations:^{
        [self layoutForOrientation:toInterfaceOrientation];
    }];
}

@end
