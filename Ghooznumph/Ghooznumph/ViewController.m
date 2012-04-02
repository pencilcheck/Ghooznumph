//
//  ViewController.m
//  Ghooznumph
//
//  Created by Penn Su on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "isgl3d.h"

@interface ViewController () {
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
}

- (void)viewDidUnload {
	[super viewDidUnload];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)dealloc {    
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect rect = CGRectZero;
    
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown) {		
        rect = screenRect;
		
    } else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        rect.size = CGSizeMake( screenRect.size.height, screenRect.size.width );
    }
    
    UIView * glView = [Isgl3dDirector sharedInstance].openGLView;
    float contentScaleFactor = [Isgl3dDirector sharedInstance].contentScaleFactor;
    
    if (contentScaleFactor != 1) {
        rect.size.width *= contentScaleFactor;
        rect.size.height *= contentScaleFactor;
    }
    glView.frame = rect;
}

@end
