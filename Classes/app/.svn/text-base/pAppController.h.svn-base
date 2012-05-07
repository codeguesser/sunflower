//
//  pAppController.h
//  PingXD_
//
//  Created by Ping.w on 09-2-11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
#import <Vector>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <QuartzCore/QuartzCore.h>
#import "EAGLView.h"

class CCSprite;
using namespace std;

class AppController 
{
//add by chon 10.01.28
public:
	
public:
	AppController(EAGLView *glView);
	~AppController();
	void updateApp(float dt);
	void drawApp();
	void touchBegan(float x,float y);
	void touchEnded(float x,float y);
	void touchMoved(float x,float y);
	void accelerometer(float x,float y,float z);
    void deleteAllImages();
	void initState(int state);
	
	
	
	//----------------------------------------------//
	int app_state;
	int app_old_state;
private:
	
	
	//----------------------------------------------//
	UIView *glView;
	
	
public:
	void touchesBegan(NSSet *touches, UIEvent *evet);
	void touchesEnded(NSSet *touches, UIEvent *event);
	void touchesMoved(NSSet *touches, UIEvent *event);
};