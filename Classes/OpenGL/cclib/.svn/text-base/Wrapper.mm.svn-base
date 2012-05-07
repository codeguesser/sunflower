//
//  Wrapper.mm
//  iDemo
//
//  Created by Dr.Watson on 31/05/08.
//  Copyright 2008 (c) Dr.Watson. All rights reserved.
//

#import "Wrapper.h"
#import "Texture2D.h"

#import "CCTexture.h"


CCTexture *CCTextureCreate(const char *filename, const char *directory)
{
	NSString *name = [[NSString alloc] initWithUTF8String: filename];
	//UIImage *image = [UIImage imageNamed: name];
	NSString *dir = nil;
	if (directory)
		dir = [[NSString alloc] initWithUTF8String: directory];
	NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil inDirectory:dir];
	UIImage *image = [UIImage imageWithContentsOfFile:path];
	//[image initWithContentsOfFile:path];
	Texture2D *tex = [[Texture2D alloc] initWithImage: image];
	//NSLog(@"%@",path);
	CCTexture *texture = new CCTexture([tex name], tex.contentSize.width, tex.contentSize.height, tex.pixelsWide, tex.pixelsHigh);
	
	[tex release];
	//[name release];

	return texture;
}


const char *GetPath(const char *s, const char *directory)
{
	NSString *dir = nil;
	if (directory)
		dir = [[NSString alloc] initWithUTF8String: directory];
	NSString *name = [[NSString alloc] initWithUTF8String: s];
	NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil inDirectory:dir];
	
	return [path UTF8String];
	
}

void changeAlphra(int type)
{
	if(type==2)
	{
		glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	}else{
		 glBlendFunc(GL_DST_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	}
}
void InitPerspective(GLfloat fovy, GLfloat aspect, GLfloat zNear, GLfloat zFar)
{
    GLfloat xmin, xmax, ymin, ymax;
	
    ymax = zNear * (GLfloat)tan(fovy * 3.1415962f / 360.0);
    ymin = -ymax;
    xmin = ymin * aspect;
    xmax = ymax * aspect;
	
    glFrustumf(xmin, xmax, ymin, ymax, zNear, zFar);
}


void Enable2D()
{
	int width = SCREEN_WIDTH;
	int height = SCREEN_HEIGHT;
	
	glViewport      (0, 0, width, height);
	
	glMatrixMode	(GL_PROJECTION);
    glLoadIdentity  ();
	glOrthof(0, (float)width, 0, (float)height, 0, 100);
    glMatrixMode    (GL_MODELVIEW);
	glLoadIdentity();
	
	glEnable				(GL_BLEND);
	glEnable				(GL_TEXTURE_2D);
	glDisable				(GL_CULL_FACE);
	glDisable				(GL_DEPTH_TEST);
	glDisable				(GL_LIGHTING);
	//glDisableClientState	(GL_NORMAL_ARRAY);
	
}


void Enable3D()
{	
	int width = SCREEN_WIDTH;
	int height = SCREEN_HEIGHT;
	float aspect = (float)width/(float)height;
	
	glViewport          (0, 0, width, height);
    glScissor           (0, 0, width, height);
	
    //glMatrixMode        (GL_MODELVIEW);
    //glLoadIdentity      ();
    
    glMatrixMode        (GL_PROJECTION);
    glLoadIdentity      ();
    InitPerspective     (60.f, aspect, 0.1f, 1000.f);
    
    glMatrixMode        (GL_MODELVIEW);
    glLoadIdentity      ();
    
	
	glEnable           (GL_CULL_FACE);
	//glDisable			(GL_BLEND);
	glEnable			(GL_DEPTH_TEST);
	//glEnable			(GL_LIGHTING);
	//glEnableClientState (GL_NORMAL_ARRAY);
	
	//glEnable(GL_NORMALIZE);	
}



