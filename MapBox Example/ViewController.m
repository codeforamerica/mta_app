//
//  ViewController.m
//  MapBox Example
//
//  Created by Justin Miller on 3/27/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "ViewController.h"

#import "RMMapView.h"
#import "RMMapContents.h"
#import "RMMapBoxSource.h"

#define kStartingLat   30.0f
#define kStartingLon  -10.0f
#define kStartingZoom   1.5f

@interface ViewController ()

@property (nonatomic, strong) IBOutlet RMMapView *mapView;

@end

@implementation ViewController

@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    CLLocationCoordinate2D startingPoint;
    
    startingPoint.latitude  = kStartingLat;
    startingPoint.longitude = kStartingLon;
    
    NSDictionary *info = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"geography-class" ofType:@"plist"]];
    
    RMMapBoxSource *source = [[RMMapBoxSource alloc] initWithInfo:info];
    
	[[RMMapContents alloc] initWithView:self.mapView 
                             tilesource:source
                           centerLatLon:startingPoint
                              zoomLevel:kStartingZoom
                           maxZoomLevel:[source maxZoom]
                           minZoomLevel:[source minZoom]
                        backgroundImage:nil
                            screenScale:0.0];
    
    self.mapView.deceleration = YES;
    self.mapView.enableRotate = NO;
    
    self.mapView.backgroundColor = [UIColor darkGrayColor];
    
    self.mapView.contents.zoom = kStartingZoom;
}

@end