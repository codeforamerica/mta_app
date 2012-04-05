//
//  OfflineLayerViewController.m
//  MapBox Example
//
//  Created by Justin Miller on 4/5/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "OfflineLayerViewController.h"

#import "RMMapView.h"
#import "RMMBTilesTileSource.h"

@implementation OfflineLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Offline Layer" image:[UIImage imageNamed:@"offline.png"] tag:0];
    
    RMMBTilesTileSource *offlineSource = [[RMMBTilesTileSource alloc] initWithTileSetURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"control-room-0.2.0" ofType:@"mbtiles"]]];

    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:offlineSource];
    
    mapView.zoom = 2;
    
    mapView.backgroundColor = [UIColor darkGrayColor];
    
    mapView.decelerationMode = RMMapDecelerationFast;

    mapView.adjustTilesForRetinaDisplay = YES;
    
    [self.view addSubview:mapView];
}

@end