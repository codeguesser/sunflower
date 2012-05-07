/*
 *  CCTexture.h
 *  iDemo
 *
 *  Created by Dr.Watson on 6/06/08.
 *  Copyright 2008 (c) Dr.Watson. All rights reserved.
 *
 */

#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>

class CCTexture
	{
	public:
		CCTexture(GLuint texId, float width, float height, float texWidth, float texHeight);
		~CCTexture();
		
		void bind();
		float getImageWidth();
		float getImageHeight();
		float getTextureWidth();
		float getTextureHeight();
		GLuint mTextureId;
		
	private:
		
		float mImageWidth;
		float mImageHeight;
		float mTextureWidth;
		float mTextureHeight;
		
	};
