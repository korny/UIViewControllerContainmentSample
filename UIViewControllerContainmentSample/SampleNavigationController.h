//
//  SampleNavigationController.h
//  UIViewControllerContainmentSample
//
//  Created by Kornelius Kalnbach on 06.08.12.
//  Copyright (c) 2012 http://peterfriese.de. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleViewController.h"

@interface SampleNavigationController : UINavigationController
@property (nonatomic, readonly) SampleViewController *sampleViewController;
@end
