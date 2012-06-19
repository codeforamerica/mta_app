//
//  AppDelegate.m
//  MapBox Example
//
//  Created by Justin Miller on 3/27/12.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import "AppDelegate.h"

#import "OnlineLayerViewController.h"
#import "OfflineLayerViewController.h"
#import "InteractiveLayerViewController.h"
#import "AttributionViewController.h"

@implementation AppDelegate

@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    NSMutableArray *viewControllers = [NSMutableArray array];
    
    for (NSString *typeString in [NSArray arrayWithObjects:@"online", @"offline", @"interactive", nil])
    {
        Class ViewControllerClass = NSClassFromString([NSString stringWithFormat:@"%@LayerViewController", [typeString capitalizedString]]);
        
        UIViewController *viewController = [[ViewControllerClass alloc] initWithNibName:nil bundle:nil];
        
        viewController.tabBarItem = [[UITabBarItem alloc] initWithTitle:[NSString stringWithFormat:@"%@ Layer", [typeString capitalizedString]]
                                                                  image:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png", typeString]] 
                                                                    tag:0];
        
        [viewControllers addObject:viewController];
    }
    
    tabBarController.viewControllers = viewControllers;
    
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    [infoButton addTarget:self action:@selector(showInfo:) forControlEvents:UIControlEventTouchUpInside];
    
    infoButton.frame = CGRectMake(tabBarController.view.frame.origin.x + 290, 
                                  tabBarController.view.frame.origin.y + 400, 
                                  infoButton.bounds.size.width, 
                                  infoButton.bounds.size.height);
    
    [tabBarController.view addSubview:infoButton];
    
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark -

- (void)showInfo:(id)sender
{
    AttributionViewController *viewController = [[AttributionViewController alloc] initWithNibName:nil bundle:nil];
    
    viewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self.window.rootViewController presentModalViewController:viewController animated:YES];
}

@end