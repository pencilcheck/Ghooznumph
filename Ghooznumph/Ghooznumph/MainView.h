//
//  MainView.h
//  Ghooznumph
//
//  Created by Penn Su on 3/27/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "isgl3d.h"

@class CameraController;
@class Isgl3dPhysicsWorld;

class btDefaultCollisionConfiguration;
class btDbvtBroadphase;
class btCollisionDispatcher;
class btSequentialImpulseConstraintSolver;
class btDiscreteDynamicsWorld;

@interface MainView : Isgl3dBasic3DView {
    btDefaultCollisionConfiguration * _collisionConfig;
	btDbvtBroadphase * _broadphase;
	btCollisionDispatcher * _collisionDispatcher;
	btSequentialImpulseConstraintSolver * _constraintSolver;
	btDiscreteDynamicsWorld * _discreteDynamicsWorld;
    
	
	Isgl3dMeshNode * _terrain;
	float * _terrainHeightData;
	
	Isgl3dPhysicsWorld * _physicsWorld;
	Isgl3dNode * _spheresNode;
	NSMutableArray * _physicsObjects;
	Isgl3dTextureMaterial * _beachBallMaterial;
	Isgl3dSphere * _sphereMesh;
	float _timeInterval;
	
	CameraController * _cameraController;	
}

@end

/*
 * Principal class to be instantiated in main.h. 
 */
#import "GhooznumphAppDelegate.h"
@interface AppDelegate : GhooznumphAppDelegate
- (void) createViews;
@end