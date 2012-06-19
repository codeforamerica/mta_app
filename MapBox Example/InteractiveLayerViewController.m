//
//  InteractiveLayerViewController.m
//  MapBox Example
//
//  Created by Justin Miller on 4/5/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "InteractiveLayerViewController.h"

#import "RMMapView.h"
#import "RMMapBoxSource.h"
#import "RMMBTilesSource.h"
#import "RMInteractiveSource.h"

#import <QuartzCore/QuartzCore.h>

@implementation InteractiveLayerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    RMMapBoxSource *interactiveSource = [[RMMapBoxSource alloc] initWithReferenceURL:[NSURL URLWithString:@"http://a.tiles.mapbox.com/v3/mapbox.geography-class.json"]];

    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:interactiveSource];

    mapView.delegate = self;
    
    mapView.zoom = 2;
    
    mapView.backgroundColor = [UIColor darkGrayColor];
    
    mapView.decelerationMode = RMMapDecelerationFast;

    mapView.autoresizingMask = UIViewAutoresizingFlexibleHeight;

    mapView.boundingMask = RMMapMinHeightBound;

    mapView.adjustTilesForRetinaDisplay = YES;
    
    [self.view addSubview:mapView];
}

#pragma mark -

- (void)singleTapOnMap:(RMMapView *)mapView at:(CGPoint)point
{
    id source = mapView.tileSource;
    
    if ([source conformsToProtocol:@protocol(RMInteractiveSource)] && [(id <RMInteractiveSource>)source supportsInteractivity])
    {
        source = (id <RMInteractiveSource>)source;
        
        NSString *formattedOutput = [source formattedOutputOfType:RMInteractiveSourceOutputTypeFull 
                                                         forPoint:point 
                                                        inMapView:mapView];
        
        if ( ! formattedOutput || ! [formattedOutput length])
            formattedOutput = [source formattedOutputOfType:RMInteractiveSourceOutputTypeTeaser 
                                                   forPoint:point 
                                                  inMapView:mapView];
        
        if (formattedOutput && [formattedOutput length])
        {
            CGRect frame = CGRectMake(mapView.frame.size.width - 200, 0, 200, 140);
            
            UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
            
            [webView loadHTMLString:formattedOutput baseURL:nil];
            
            webView.layer.borderColor = [[UIColor blackColor] CGColor];
            webView.layer.borderWidth = 2.0;
            
            webView.userInteractionEnabled = NO;
            
            [self.view addSubview:webView];
            
            [UIView animateWithDuration:1.0
                                  delay:0.5
                                options:UIViewAnimationCurveEaseOut
                             animations:^(void)
                             {
                                 webView.alpha = 0.0;
                             }
                             completion:^(BOOL finished)
                             {
                                 [webView removeFromSuperview];
                             }];
        }
    }
}

@end