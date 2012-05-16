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

#define kNormalSourceURL [NSURL URLWithString:@"http://a.tiles.mapbox.com/v3/justin.map-s2effxa8.jsonp"] // see https://tiles.mapbox.com/justin/map/map-s2effxa8
#define kRetinaSourceURL [NSURL URLWithString:@"http://a.tiles.mapbox.com/v3/justin.map-kswgei2n.jsonp"] // see https://tiles.mapbox.com/justin/map/map-kswgei2n

@implementation OnlineLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    BOOL retinaCapable = ([[UIScreen mainScreen] scale] == 2.0);
    
    RMMapBoxSource *onlineSource = [[RMMapBoxSource alloc] initWithReferenceURL:(retinaCapable ? kRetinaSourceURL : kNormalSourceURL)];

    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:onlineSource];
    
    mapView.zoom = 2;
    
    mapView.backgroundColor = [UIColor darkGrayColor];
    
    mapView.decelerationMode = RMMapDecelerationFast;
    
    mapView.boundingMask = RMMapMinHeightBound;

    [self.view addSubview:mapView];
}

@end