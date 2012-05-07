/*
 *  CCTexture.cpp
 *  iDemo
 *
 *  Created by Dr.Watson on 6/06/08.
 *  Copyright 2008 (c) Dr.Watson. All rights reserved.
 *
 */

#include "CCTexture.h"

CCTexture::CCTexture(GLuint texId, float width, float height, float texWidth, float texHeight)
{
	mTextureId = texId;
	mImageWidth = width;
	mImageHeight = height;
	mTextureWidth = texWidth;
	mTextureHeight = texHeight;
}


CCTexture::~CCTexture()
{
	
	if(mTextureId)
	{
//		printf("mTextureId=%d",mTextureId);
		glDeleteTextures(1, &mTextureId);
		
	}
}

void CCTexture::bind()
{
	glBindTexture(GL_TEXTURE_2D, mTextureId);
}


float CCTexture::getImageWidth()
{
	return mImageWidth;
}


float CCTexture::getImageHeight()
{
	return mImageHeight;
}


float CCTexture::getTextureWidth()
{
	return mTextureWidth;
}


float CCTexture::getTextureHeight()
{
	return mTextureHeight;
}

