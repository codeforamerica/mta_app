//
//  LegendViewController.m
//  MapBox Example
//
//  Created by Zach Williams on 6/27/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "LegendLayerViewController.h"

@implementation LegendLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    [self.view addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(320, 461);
    scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"background.png"]];
    UIImageView *legendView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"legendBackground.png"]];
    [scrollView addSubview:legendView];
    UIView *hiddenView = [[[NSBundle mainBundle] loadNibNamed:@"HiddenView" owner:self options:nil] lastObject];
    hiddenView.frame = CGRectOffset(hiddenView.frame, 0.0f, -hiddenView.frame.size.height);
    [scrollView addSubview:hiddenView];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
