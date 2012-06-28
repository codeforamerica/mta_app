//
//  OnlineLayerViewController.m
//  MapBox Example
//
//  Created by Justin Miller on 3/27/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "OnlineLayerViewController.h"

#import "RMMapView.h"
#import "RMMapBoxSource.h"

@implementation OnlineLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"http://a.tiles.mapbox.com/v3/jllord.mta.json"];
    
    RMMapBoxSource *onlineSource = [[RMMapBoxSource alloc] initWithReferenceURL:url];
    
    CLLocationCoordinate2D coord;
    coord.latitude = 32.83651;
    coord.longitude = -83.62915;
    
    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds
                                            andTilesource:onlineSource
                                         centerCoordinate:coord
                                                zoomLevel:14
                                             maxZoomLevel:17
                                             minZoomLevel:11
                                          backgroundImage:[UIImage imageNamed:@"background.png"]];
    
    mapView.decelerationMode = RMMapDecelerationFast;
    
    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    
    mapView.boundingMask = RMMapMinHeightBound;
    
    mapView.viewControllerPresentingAttribution = self;

    [self.view addSubview:mapView];
}

@end