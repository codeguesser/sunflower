//
//  Game_VideoPlay.h
//  HK_QCS_Game
//
//  Created by Bou on 10-11-30.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>




@interface Game_VideoPlay : UIView 
{
	MPMoviePlayerController *moviePlayer;
	
	bool n_beHaveControol;
}



@property (nonatomic) bool n_beHaveControol;





//==============================================================================================================================

//------游戏数据处理函数


- (id)initWithName:(NSString*)moviename;

- (id)video_play:(NSString*)filename;

- (id)playMovieAtURL:(NSURL*)theURL;

- (void)myMovieFinishedCallback:(NSNotification*)aNotification;


@end
