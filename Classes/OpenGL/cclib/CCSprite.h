/*
 *  CCSprite.h
 *  iDemo
 *
 *  Created by Dr.Watson on 31/05/08.
 *  Copyright 2008 (c) Dr.Watson. All rights reserved.
 *
 */

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

class CCTexture;

class CCSprite
{
public:
	CCSprite(CCTexture *texture, float x, float y, float width, float height);
	CCSprite(const char *path, float x, float y, float width, float height, const char *directory="");
	CCSprite(CCTexture *texture);
	~CCSprite();
	
	void render(float x, float y, float angle=0.0f, float xScale=1.0f, float yScale=1.0f);
	void draw(float x=0.0f, float y=0.0f, float angle=0.0f, float xScale=1.0f, float yScale=1.0f);
	void setColor(float r, float g, float b, float a=1.0f);
	void draw(float x, float y, float angle, float xScale, float yScale,int type);
	void setAlpha(float a);
	float getWidth();
	float getHeight();
	float gettest();
	
private:
	CCTexture *mTexture;
	float mX;
	float mY;
	float mWidth;
	float mHeight;
	
	float mRed;
	float mGreen;
	float mBlue;
	float mAlpha;

	
};
