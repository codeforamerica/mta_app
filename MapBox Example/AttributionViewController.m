//
//  AttributionViewController.m
//  MapBox Example
//
//  Created by Justin Miller on 6/19/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "AttributionViewController.h"

@implementation AttributionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor darkGrayColor];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissModalViewControllerAnimated:)]];

    UILabel *attributionLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - 40, self.view.bounds.size.width, 30)];
    
    attributionLabel.text                      = @"Map data © OpenStreetMap contributors, CC BY-SA";
    attributionLabel.textColor                 = [UIColor lightGrayColor];
    attributionLabel.font                      = [UIFont systemFontOfSize:12];
    attributionLabel.textAlignment             = UITextAlignmentCenter;
    attributionLabel.backgroundColor           = [UIColor clearColor];
    attributionLabel.adjustsFontSizeToFitWidth = NO;
    
    [self.view addSubview:attributionLabel];
}

@end