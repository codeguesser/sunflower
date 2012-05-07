/*
 *  pFunction.h
 *  Ping_I
 *
 *  Created by Ping.w on 09年1月4日.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */
#import "pAppConfig.h"
#import "CCTexture.h"
#import "Texture2D.h"
#import "CCSprite.h"

#define kUserNameDefaultKey			@"userName"   // NSString
#define kHighScoresDefaultKey		@"highScores" // NSArray of NSStrings
#define kFontName					@"Arial"
#define kScoreFontSize				18

void pExitApp();

int pRandom(int minvalue,int maxvalue);

const char *pSoundCreate(const char *filename,const char *filetype);

void pOpenURL(const char *url);

void pSaveScores(unsigned newScore);


CCTexture *CCTextureCreate(const char *filename, const char *directory="");
CCTexture *StringTextureCreate(const char *_string);
NSString*GetPath(const char *s, const char *directory="");
CCSprite *ImgSpriteCreate(const char *filename, const char *directory="");
CCSprite *ImgSpriteCreate(const char *filename, float x, float y, float width, float height, const char *directory="");
float doublex(float x);
float doubley(float y);

void Enable2D(float width=SCREEN_WIDTH,float height=SCREEN_HEIGHT);
void Enable3D(float width=SCREEN_WIDTH,float height=SCREEN_HEIGHT);

void setClip(float x,float y,float width,float height);
void resetClip();

void pCreateAlert(NSString *warning_str);



