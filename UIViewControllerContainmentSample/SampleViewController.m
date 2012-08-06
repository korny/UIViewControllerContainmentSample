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

- (void)setColor:(UIColor *)color secondaryColor:(UIColor *)secondaryColor {
    self.color = color;
    self.secondaryColor = secondaryColor;
}

#pragma mark - Layout

- (void)layoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsLandscape(orientation)) {
        [self.view setBackgroundColor:self.color];
    }
    else {
        [self.view setBackgroundColor:self.secondaryColor];
    }
}

- (void)viewWillLayoutSubviews {
    [self layoutForOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%d", indexPath.row + 1];
    
    return cell;
}

@end
