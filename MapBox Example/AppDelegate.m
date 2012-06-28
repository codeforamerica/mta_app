//
//  AppDelegate.m
//  MapBox Example
//
//  Created by Justin Miller on 3/27/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "AppDelegate.h"
#import "OnlineLayerViewController.h"
#import "LegendLayerViewController.h"

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    for (NSString *typeString in @[@"online", @"legend"])
    {
        Class ViewControllerClass = NSClassFromString([NSString stringWithFormat:@"%@LayerViewController", [typeString capitalizedString]]);
        
        UIViewController *viewController = [[ViewControllerClass alloc] initWithNibName:nil bundle:nil];
        
        NSString *title = nil;
        UIImage *image = nil;
        if ([typeString isEqualToString:@"legend"]) {
            title = @"Legend";
            image = [UIImage imageNamed:@"legend.png"];
        } else {
            title = @"Map";
            image = [UIImage imageNamed:@"map.png"];
        }
        
        viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image tag:0];
        
        [viewControllers addObject:viewController];
    }
    
    tabBarController.viewControllers = viewControllers;
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    [self customizeAppearance];
    
    return YES;
}

- (void)customizeAppearance
{
    // Add custom images to the UITabBarController
    [[UITabBar appearance] setBackgroundImage:[UIImage imageNamed:@"tabbarBackground.png"]];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbarSelection.png"]];
}

@end