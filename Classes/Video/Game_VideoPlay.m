//
//  Game_VideoPlay.m
//  HK_QCS_Game
//
//  Created by Bou on 10-11-30.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "Game_VideoPlay.h"






@implementation Game_VideoPlay



@synthesize n_beHaveControol;







-(id)initWithFrame:(CGRect)frame
{
	if(self == [super initWithFrame:frame])
	{
		n_beHaveControol = FALSE;
	}
	
	return self;
}


-(void)dealloc
{
	if(moviePlayer) 
	{
		[moviePlayer release];
	}
	
	[super dealloc];
}



-(id)initWithName:(NSString*)moviename
{
	return self;
}


-(id)video_play:(NSString*)filename
{
	NSString *path = [[NSBundle mainBundle] pathForResource:filename ofType:@"mp4"];

	
    NSURL *url = [NSURL fileURLWithPath:path isDirectory:YES];
	

	[self playMovieAtURL:url];
	
	
	return self;
}


-(id)playMovieAtURL:(NSURL*)theURL
{
	
	if(moviePlayer)
	{
		[moviePlayer release];
		moviePlayer = nil;
	}
	
	moviePlayer= [[MPMoviePlayerController alloc] initWithContentURL:theURL];
	
	[moviePlayer.view setFrame:CGRectMake(0.0, 0.0, 320.0, 480.0)];
	

	
#pragma mark -
#pragma mark play movie
	
	moviePlayer.repeatMode = MPMovieRepeatModeNone;
	
	
	
	if(n_beHaveControol == FALSE)
	{
		moviePlayer.controlStyle = MPMovieControlStyleNone;
	}
	
	else 
	{
		moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
	}

	
	[moviePlayer play];
	
	[[NSNotificationCenter defaultCenter] addObserver:self
											 selector:@selector(myMovieFinishedCallback:)
												 name:MPMoviePlayerPlaybackDidFinishNotification
											   object:moviePlayer];
	
	[self addSubview:moviePlayer.view];
	return self;
}


-(void)myMovieFinishedCallback:(NSNotification*)aNotification
{
	[moviePlayer stop];
	
	MPMoviePlayerController *_moviePlayer = [aNotification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:_moviePlayer];
	
	
	[moviePlayer.view removeFromSuperview];
	
	[self removeFromSuperview];
	
	
	
	
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeState" object:self];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"OP_BG" object:self];
}





@end
