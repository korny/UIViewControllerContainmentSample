//
//  SampleNavigationController.m
//  UIViewControllerContainmentSample
//
//  Created by Kornelius Kalnbach on 06.08.12.
//  Copyright (c) 2012 http://peterfriese.de. All rights reserved.
//

#import "SampleNavigationController.h"

@implementation SampleNavigationController

- (SampleViewController *)sampleViewController {
    UIViewController *topViewController = self.topViewController;
    if (![topViewController isKindOfClass:[SampleViewController class]]) {
        topViewController = nil;
    }
    return (SampleViewController *)topViewController;
}

@end
