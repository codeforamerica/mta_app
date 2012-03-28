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

@interface ViewController ()

@property (nonatomic, strong) IBOutlet RMMapView *mapView;

@end

@implementation ViewController

@synthesize mapView;

- (void)viewDidLoad
{
    [super viewDidLoad];

    RMMapBoxSource *source;
    
    // use TileJSON & iOS 5.0+ JSON serialization if available
    //
    if ([NSJSONSerialization class])
        source = [[RMMapBoxSource alloc] initWithReferenceURL:[NSURL URLWithString:@"http://api.tiles.mapbox.com/v2/mapbox.mapbox-streets.json"]];

    // use the old property list method
    //
    else
        source = [[RMMapBoxSource alloc] initWithInfo:[NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"geography-class" ofType:@"plist"]]];
    
    RMLatLong centerLatLong = {
        .latitude  = [[[source.infoDictionary objectForKey:@"center"] objectAtIndex:1] doubleValue],
        .longitude = [[[source.infoDictionary objectForKey:@"center"] objectAtIndex:0] doubleValue],
    };
    
	[[RMMapContents alloc] initWithView:self.mapView 
                             tilesource:source
                           centerLatLon:centerLatLong
                              zoomLevel:[[[source.infoDictionary objectForKey:@"center"] objectAtIndex:2] floatValue]
                           maxZoomLevel:[source maxZoom]
                           minZoomLevel:[source minZoom]
                        backgroundImage:nil
                            screenScale:0.0];
    
    self.mapView.backgroundColor = [UIColor darkGrayColor];
}

@end