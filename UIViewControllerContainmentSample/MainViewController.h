//
//  MainViewController.h
//  UIViewControllerContainmentSample1
//
//  Created by Peter Friese on 29.11.11.
//  Copyright (c) 2011 http://peterfriese.de. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContainerViewController.h"

@interface MainViewController : ContainerViewController {
    IBOutlet UIView *leftView;
    IBOutlet UIView *topRightView;
    IBOutlet UIView *bottomRightView;
}

@end

