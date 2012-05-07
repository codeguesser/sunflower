//
//  pAppController.mm
//  PingXD_
//
//  Created by Ping.w on 09-2-11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "pAppController.h"
#import "pAppConfig.h"
#import "pFunction.h"
#import "CCSprite.h"
#import "CCTexture.h"
#import <OpenGLES/EAGLDrawable.h>
#import <UIKit/UIKit.h>

using namespace std;

EAGLView * GLView;

AppController::AppController(EAGLView * glView){
	GLView = glView;
	glView.userInteractionEnabled = YES;
	app_state = _APPSTATE_MAIN;
	resetClip();
	initState(app_state);
}

AppController::~AppController(){
	deleteAllImages();
}
#pragma mark ---------- delete image  ----------
void AppController::deleteAllImages(){
	
}
#pragma mark ---------- update ----------
void AppController::updateApp(float dt){
	switch (app_state) 
	{
	}
}
#pragma mark ---------- initState ----------
void AppController::initState(int state){
	app_old_state=app_state;
	app_state=state;
}

#pragma mark ---------- touch ----------
void AppController::touchBegan(float x,float y){
	NSLog(@"touch (%d , %d)",(int)x,(int)y);
}
void AppController::touchEnded(float x,float y){
}
void AppController::touchMoved(float x,float y){
}
#pragma mark ---------- accelerometer ----------
void AppController::accelerometer(float x,float y,float z)
{
}
void AppController::drawApp(){
	Enable2D(SCREEN_WIDTH,SCREEN_HEIGHT);
	switch (app_state) 
	{
			
	}
}
	




















