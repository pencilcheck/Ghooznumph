//
//  AppDelegate.h
//  Ghooznumph
//
//  Created by Penn Su on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@class ViewController;

@interface GhooznumphAppDelegate : NSObject <UIApplicationDelegate> {
    
@private
    ViewController *_viewController;
    UIWindow *_window;
}

@property (nonatomic, retain) UIWindow *window;

- (void)createViews;

@end
