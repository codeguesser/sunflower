//
//  pSoundSys.mm
//  PingXD_
//
//  Created by Ping.w on 09-2-16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "pSoundSys.h"
#import "SoundEngine.h"

#define kListenerDistance			1.0  // Used for creating a realistic sound field


UInt32 _sounds[snd_NumSounds];

void SND_initSound(){
	//Setup sound engine. Run it at 44Khz to match the sound files
	SoundEngine_Initialize(44100);//44100//11025
	
	// Assume the listener is in the center at the start. The sound will pan as the position of the rocket changes.
	SoundEngine_SetListenerPosition(0.0, 0.0, kListenerDistance); 
	
	// Load each of the four sounds used in the game.
//	NSBundle* bundle = [NSBundle mainBundle];
//	SoundEngine_LoadEffect([[bundle pathForResource:@"Start" ofType:@"caf"] UTF8String], &_sounds[snd_Test_One]);
//	SoundEngine_LoadLoopingEffect([[bundle pathForResource:@"Thrust" ofType:@"caf"] UTF8String], NULL, NULL, &_sounds[snd_Test_Loop]);
//	SoundEngine_LoadLoopingEffect([[bundle pathForResource:@"test" ofType:@"wav"] UTF8String], NULL, NULL, &_sounds[snd_Test_Loop]);

}

void SND_playSound(int idx){
	if(idx>=0&&idx<snd_NumSounds){
		SoundEngine_StartEffect( _sounds[idx]);
	}
}
void SND_stopSound(int idx ,bool inDoDecay){
	if(idx>=0&&idx<snd_NumSounds){
		SoundEngine_StopEffect(_sounds[idx],inDoDecay);
	}
}
void SND_SetMusicVolume(float volume)
{
	SoundEngine_SetBackgroundMusicVolume(volume);
}
void SND_SetSoundVolume(float volume)
{
	SoundEngine_SetEffectsVolume(volume);
}
void SND_SetAllVolume(float volume)
{
	SoundEngine_SetMasterVolume(volume);
}





