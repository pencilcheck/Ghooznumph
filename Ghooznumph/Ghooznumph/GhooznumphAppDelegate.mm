//
//  AppDelegate.m
//  Ghooznumph
//
//  Created by Penn Su on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GhooznumphAppDelegate.h"
#import "ViewController.h"
#import "Isgl3d.h"

@implementation GhooznumphAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Create the UIWindow
	_window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	
	// Instantiate the Isgl3dDirector and set background color
	[Isgl3dDirector sharedInstance].backgroundColorString = @"333333ff"; 
    
	// Create the UIViewController
	_viewController = [[ViewController alloc] initWithNibName:nil bundle:nil];
	_viewController.wantsFullScreenLayout = YES;
	
#ifdef USE_LATEST_GLES
    // Create OpenGL view with autodetection of the latest available version
	Isgl3dEAGLView * glView = [Isgl3dEAGLView viewWithFrame:[_window bounds]];
#else
	// Create OpenGL ES 1.1 view
    Isgl3dEAGLView * glView = [Isgl3dEAGLView viewWithFrameForES1:[_window bounds]];
#endif
    
	// Set view in director
	[Isgl3dDirector sharedInstance].openGLView = glView;
    
	// Enable retina display : uncomment if desired
	[[Isgl3dDirector sharedInstance] enableRetinaDisplay:YES];
    
	// Enables anti aliasing (MSAA) : uncomment if desired (note may not be available on all devices and can have performance cost)
    //	[Isgl3dDirector sharedInstance].antiAliasingEnabled = YES;
	
	// Set the animation frame rate
	[[Isgl3dDirector sharedInstance] setAnimationInterval:1.0/60];
    
	// Add the OpenGL view to the view controller
	_viewController.view = glView;
    
	// Add view to window and make visible
	[_window addSubview:glView];
	[_window makeKeyAndVisible];
    
	// Creates the view(s) and adds them to the director
	[self createViews];
	
	// Run the director
	[[Isgl3dDirector sharedInstance] run];
    return YES;
}

- (void)dealloc {
	if (_viewController) {
		[_viewController release];
	}
	if (_window) {
		[_window release];
	}
	
	[super dealloc];
}

- (void)createViews {
	// Implement in sub-classes
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    [[Isgl3dDirector sharedInstance] pause];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[Isgl3dDirector sharedInstance] stopAnimation];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[Isgl3dDirector sharedInstance] startAnimation];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [[Isgl3dDirector sharedInstance] resume];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Remove the OpenGL view from the view controller
	[[Isgl3dDirector sharedInstance].openGLView removeFromSuperview];
	
	// End and reset the director	
	[Isgl3dDirector resetInstance];
	
	// Release
	_viewController = nil;
	_window = nil;
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
	[[Isgl3dDirector sharedInstance] onMemoryWarning];
}

- (void)applicationSignificantTimeChange:(UIApplication *)application {
	[[Isgl3dDirector sharedInstance] onSignificantTimeChange];
}

@end
