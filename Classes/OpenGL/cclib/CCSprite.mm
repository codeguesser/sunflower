/*
 *  CCSprite.cpp
 *  iDemo
 *
 *  Created by Dr.Watson on 31/05/08.
 *  Copyright 2008 (c) Dr.Watson. All rights reserved.
 *
 */

#import "CCSprite.h"
#import "CCTexture.h"
#import "Texture2D.h"
#import "pAppConfig.h"
#import "pFunction.h"

extern int screentime;

CCSprite::CCSprite(CCTexture *texture, float x, float y, float width, float height)
{
	mTexture = texture;
	mX = x;
	mY = y;
	mWidth = width;
	mHeight = height;
	mRed = 1.0f;
	mGreen = 1.0f;
	mBlue = 1.0f;
	mAlpha = 1.0f;
}
CCSprite::CCSprite(CCTexture *texture)
{
	mTexture = texture;
	mX = 0;
	mY = 0;
	mWidth = texture->getImageWidth();
	mHeight = texture->getImageHeight();
	if(mWidth<1)mWidth=1;if(mHeight<1)mHeight=1;
	mRed = 1.0f;
	mGreen = 1.0f;
	mBlue = 1.0f;
	mAlpha = 1.0f;
}

CCSprite::CCSprite(const char *path, float x, float y, float width, float height, const char *directory)
{
	NSString *name = [[NSString alloc] initWithUTF8String: path];
	NSString *dir = nil;
	if (directory)
		dir = [[NSString alloc] initWithUTF8String: directory];
	NSString *path_ = [[NSBundle mainBundle] pathForResource:name ofType:nil inDirectory:dir];
	UIImage *image = [UIImage imageWithContentsOfFile:path_];
	Texture2D *tex = [[Texture2D alloc] initWithImage: image imageX:x imageY:(image.size.height-y-height) imageWidth:width imageHeight:height];
	CCTexture *texture =new CCTexture([tex name], tex.contentSize.width, tex.contentSize.height, tex.pixelsWide, tex.pixelsHigh);
	mTexture=texture;
	[tex release];
	mX = 0;
	mY = 0;
	mWidth = width;
	mHeight = height;
	
	mRed = 1.0f;
	mGreen = 1.0f;
	mBlue = 1.0f;
	mAlpha = 1.0f;
}


CCSprite::~CCSprite()
{
	if(mTexture)
		delete mTexture;
}


void CCSprite::render(float x, float y, float angle, float xScale, float yScale)
{
	if(screentime==2)
	{
		x = doublex(x);
		y = doubley(y);
	}
	y = SCREEN_HEIGHT-y;		// for OpenGL ES, (0,0) is at lower left corner!
	
	GLfloat _minU = mX/mTexture->getTextureWidth();
	GLfloat _maxU = (mX+mWidth)/mTexture->getTextureWidth();
	GLfloat _minV = mY/mTexture->getTextureHeight();
	GLfloat _maxV = (mY+mHeight)/mTexture->getTextureHeight();
	
	GLfloat	coordinates[] = 
	{
		_minU,	_maxV,
		_maxU,	_maxV,
		_minU,	_minV,
		_maxU,	_minV
	};
	
	GLfloat	xx = - mWidth/2;
	GLfloat yy = - mHeight/2;
	
	GLfloat	vertices[] = 
	{
		xx,			yy,				
		xx+mWidth,	yy,				
		xx,			yy+mHeight,
		xx+mWidth,	yy+mHeight	
	};
	
	mTexture->bind();
	
	glColor4f(mRed, mGreen, mBlue, mAlpha);
	
	glPushMatrix();
	glTranslatef(x, y, 0.0f);
	glRotatef(angle, 0.0f, 0.0f, 1.0f);
	glScalef(xScale, yScale, 1.0f);
	glVertexPointer(2, GL_FLOAT, 0, vertices);
	glTexCoordPointer(2, GL_FLOAT, 0, coordinates);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	glPopMatrix();
	
	glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
	
}


void CCSprite::draw(float x, float y, float angle, float xScale, float yScale)
{
	if(screentime==2)
	{
		x = doublex(x);
		y = doubley(y);
	}
	y = SCREEN_HEIGHT-y;		// for OpenGL ES, (0,0) is at lower left corner!
	
	GLfloat _minU = mX/mTexture->getTextureWidth();
	GLfloat _maxU = (mX+mWidth)/mTexture->getTextureWidth();
	GLfloat _minV = mY/mTexture->getTextureHeight();
	GLfloat _maxV = (mY+mHeight)/mTexture->getTextureHeight();
	
	GLfloat	coordinates[] = 
	{
		_minU,	_maxV,
		_maxU,	_maxV,
		_minU,	_minV,
		_maxU,	_minV
	};
	
	GLfloat	xx = 0;//- mWidth/2;
	GLfloat yy = -mHeight;//- mHeight/2;
	
	GLfloat	vertices[] = 
	{
		xx,			yy,				
		xx+mWidth,	yy,				
		xx,			yy+mHeight,
		xx+mWidth,	yy+mHeight	
	};
	
	mTexture->bind();
	
	glColor4f(mRed, mGreen, mBlue, mAlpha);
	
	glPushMatrix();
	glTranslatef(x, y, 0.0f);
	glRotatef(angle, 0.0f, 0.0f, 1.0f);
	glScalef(xScale, yScale, 1.0f);
	glVertexPointer(2, GL_FLOAT, 0, vertices);
	glTexCoordPointer(2, GL_FLOAT, 0, coordinates);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	glPopMatrix();
	
	glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
	
}

void CCSprite::draw(float x, float y, float angle, float xScale, float yScale,int type)
{
	if(screentime==2)
	{
		x = doublex(x);
		y = doubley(y);
	}
	float tmpx=x;
	x=320-y;
	y=tmpx;
	y = SCREEN_HEIGHT-y;		// for OpenGL ES, (0,0) is at lower left corner!
	GLfloat _minU;
	GLfloat _maxU;
	GLfloat _minV;
	GLfloat _maxV;
	
	_minU = mX/mTexture->getTextureWidth();
	_maxU = (mX+mWidth)/mTexture->getTextureWidth();
	_minV = mY/mTexture->getTextureHeight();	
	_maxV = (mY+mHeight)/mTexture->getTextureHeight();
	
	GLfloat	coordinates[] = 
	{
		_minU,	_maxV,
		_maxU,	_maxV,
		_minU,	_minV,
		_maxU,	_minV
	};
	
	GLfloat	xx = 0;//- mWidth/2;
	GLfloat yy = -mWidth;//- mHeight/2;
	
	GLfloat	vertices[] = 
	{
		xx, yy+mWidth,				
		xx,	yy,				
		xx+mHeight,	yy+mWidth,
		xx+mHeight,	yy	
	};
	
	mTexture->bind();
	
	glColor4f(mRed, mGreen, mBlue, mAlpha);
	
	glPushMatrix();
	glTranslatef(x-mHeight, y, 0.0f);
	glRotatef(angle, 0.0f,0.0f,1.0f);
	glScalef(xScale, yScale, 1.0f);
	glVertexPointer(2, GL_FLOAT, 0, vertices);
	glTexCoordPointer(2, GL_FLOAT, 0, coordinates);
	glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
	glPopMatrix();
	
	glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
	
}


float CCSprite::getWidth()
{
	return mWidth/screentime;
}
float CCSprite::getHeight()
{
	return mHeight/screentime;
}

void CCSprite::setColor(float r, float g, float b, float a)
{
	mRed = r;
	mGreen = g;
	mBlue = b;
	mAlpha = a;
}
void CCSprite::setAlpha(float a){
	mAlpha = a;
}
