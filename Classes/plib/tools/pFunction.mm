/*
 *  pFunction.cpp
 *  Ping_I
 *
 *  Created by Ping.w on 09年1月4日.
 *  Copyright 2009 __MyCompanyName__. All rights reserved.
 *
 */

#import "pFunction.h"
extern int screentime;

void pExitApp(){
	exit(0);
}

//[minvalue ~ maxvalue-1]
int pRandom(int minvalue,int maxvalue){
	int a=random()+[NSDate timeIntervalSinceReferenceDate];
	a=a%(maxvalue-minvalue);
	if(a<0)
	{
		a*=-1;
	}
	a+=minvalue;
	return a;
}

const char *pSoundCreate(const char *filename,const char *filetype){
	NSString *name = [[NSString alloc] initWithUTF8String: filename];
	NSString *type = [[NSString alloc] initWithUTF8String: filetype];
	NSBundle* bundle = [NSBundle mainBundle];
	const char *inPath = [[bundle pathForResource:name ofType:type] UTF8String];
	return inPath;
}

void pOpenURL(const char *url){
	NSString *name = [[NSString alloc] initWithUTF8String: url];
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:name]];
}

void pSaveScores(unsigned newScore){
	NSUserDefaults*		defaults = [NSUserDefaults standardUserDefaults];
	NSMutableArray*		scores;
	NSString*			name = [defaults stringForKey:kUserNameDefaultKey];
	NSDate*				date = [NSDate date];
	//NSMutableString*	string;
	//unsigned			i;
	//NSDictionary*		dictionary;
	
	//Make sure a player name exists, if only the default
	if(![name length]){
		name = @"Player";
	}
	
	//Update the high-scores in the preferences
	scores = [NSMutableArray arrayWithArray:[defaults objectForKey:kHighScoresDefaultKey]];
	[scores addObject:[NSDictionary dictionaryWithObjectsAndKeys:name, @"name", [NSNumber numberWithUnsignedInt:newScore], @"score", date, @"date", nil]];
	[scores sortUsingDescriptors:[NSArray arrayWithObject:[[[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO] autorelease]]];
	[defaults setObject:scores forKey:kHighScoresDefaultKey];
}


NSString *GetPath(const char *s, const char *directory)
{
	NSString *dir = nil;
	if (directory)
		dir = [[NSString alloc] initWithUTF8String: directory];
	NSString *name = [[NSString alloc] initWithUTF8String: s];
	NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil inDirectory:dir];
	
	return path;
	
}
CCTexture *CCTextureCreate(const char *filename, const char *directory)
{
	NSString *path = GetPath(filename,directory);
	UIImage *image = [UIImage imageWithContentsOfFile:path];
	Texture2D *tex = [[Texture2D alloc] initWithImage: image];
	//NSLog(@"%@",path);
	CCTexture *texture = new CCTexture([tex name], tex.contentSize.width, tex.contentSize.height, tex.pixelsWide, tex.pixelsHigh);
	[tex release];
	return texture;
}
CCTexture *StringTextureCreate(const char *_string){
	NSString *str = [[NSString alloc] initWithUTF8String: _string];
	Texture2D*	tex = [[Texture2D alloc] initWithString:str dimensions:CGSizeMake(256, 256) alignment:UITextAlignmentLeft fontName:kFontName fontSize:kScoreFontSize];
	CCTexture*texture = new CCTexture([tex name], tex.contentSize.width, tex.contentSize.height, tex.pixelsWide, tex.pixelsHigh);
	//NSLog(@"tex %@:",tex);
	[tex release];	
	return texture;
}
CCSprite *ImgSpriteCreate(const char *filename, const char *directory){
	if(screentime == 2)
	{
		char Cfilename[50];
		strcpy(Cfilename,filename);
		strtok(Cfilename,".");
		strcat(Cfilename,"_2x.png");
		return new CCSprite(CCTextureCreate(Cfilename,directory));
	}
	else {
		return new CCSprite(CCTextureCreate(filename,directory));
	}
}
CCSprite *ImgSpriteCreate(const char *filename, float x, float y, float width, float height, const char *directory){
	if(screentime == 2)
	{
		char Cfilename[50];
		strcpy(Cfilename,filename);
		strtok(Cfilename,".");
		strcat(Cfilename,"_2x.png");
		int cx = x*2;
		int cy = y*2;
		int cwidth = width*2;
		int cheight = height*2;
		return new CCSprite(Cfilename,cx,cy,cwidth,cheight,directory);
	}
	else {
		return new CCSprite(filename,x,y,width,height,directory);
	}

}
float doublex(float x)
{
	float a = x*2;
	x = a;
	return x;
}
float doubley(float y)
{
	float b = y*2;
	y = b;
	return y;
}




void Enable2D(float width,float height)
{	
	glViewport      (0, 0, width, height);
	
	glMatrixMode	(GL_PROJECTION);
    glLoadIdentity  ();
	glOrthof(0, (float)width, 0, (float)height, 0, 100);
    glMatrixMode    (GL_MODELVIEW);
	glLoadIdentity();
	
	glEnable				(GL_BLEND);
	glEnable				(GL_TEXTURE_2D);
	glEnable				(GL_SCISSOR_TEST);
	glDisable				(GL_CULL_FACE);
	glDisable				(GL_DEPTH_TEST);
	glDisable				(GL_LIGHTING);
	//glDisableClientState	(GL_NORMAL_ARRAY);
	
}

void InitPerspective(GLfloat fovy, GLfloat aspect, GLfloat zNear, GLfloat zFar)
{
    GLfloat xmin, xmax, ymin, ymax;
	
    ymax = zNear * (GLfloat)tan(fovy * M_PI / 360.0);//3.1415962f
    ymin = -ymax;
    xmin = ymin * aspect;
    xmax = ymax * aspect;
	
    glFrustumf(xmin, xmax, ymin, ymax, zNear, zFar);
}
void Enable3D(float width,float height)
{
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

void setClip(float x,float y,float width,float height){
	glScissor(x, (SCREEN_HEIGHT-height)-y, width, height);
}
void resetClip(){
	glScissor(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

void pCreateAlert(NSString *warning_str){
	UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Warning!" message:warning_str delegate:[[UIApplication sharedApplication]delegate] cancelButtonTitle:@"OK" otherButtonTitles:nil];
//	UITextField * tx_t=[[UITextField alloc] initWithFrame:CGRectMake(0,0, 100, 20)];
//	[tx_t setText:@"dfksjdkf"];
//	[tx_t setBorderStyle:UITextBorderStyleRoundedRect];
//	[alert addSubview:tx_t];
//	NSLog(@"show ..");
//	[alert show];
//	NSLog(@"release ..");
	[alert release];
//	[tx_t release];
}