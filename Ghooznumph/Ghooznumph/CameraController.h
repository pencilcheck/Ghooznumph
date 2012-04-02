//
//  CameraController.h
//  Ghooznumph
//
//  Created by Penn Su on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "isgl3d.h"

@interface CameraController : NSObject <Isgl3dTouchScreenResponder> {
}

@property (nonatomic,retain) Isgl3dNode *target;
@property (nonatomic) float orbit;
@property (nonatomic) float orbitMin;
@property (nonatomic) float theta;
@property (nonatomic) float phi;
@property (nonatomic) float damping;
@property (nonatomic) BOOL doubleTapEnabled;

- (id)initWithNodeCamera:(Isgl3dNodeCamera *)camera andView:(Isgl3dView *)view;

- (void)update;

@end
