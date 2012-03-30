//
//  ViewController.m
//  MapBox Example
//
//  Created by Justin Miller on 3/27/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "ViewController.h"

#import "RMMapView.h"
#import "RMMapBoxSource.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet RMMapView *mapView;

@end

@implementation ViewController

@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    RMMapBoxSource *source = [[RMMapBoxSource alloc] init]; // just use default MapBox style provided

    CLLocationCoordinate2D centerLatLong = {
        .latitude  = [[[source.infoDictionary objectForKey:@"center"] objectAtIndex:1] doubleValue],
        .longitude = [[[source.infoDictionary objectForKey:@"center"] objectAtIndex:0] doubleValue],
    };
    
    self.mapView.tileSource = source;
    self.mapView.zoom = [[[source.infoDictionary objectForKey:@"center"] objectAtIndex:2] floatValue];
    
    [self.mapView setCenterCoordinate:centerLatLong animated:NO];
    
    self.mapView.backgroundColor = [UIColor darkGrayColor];
    
    self.mapView.decelerationMode = RMMapDecelerationFast;
}

@end