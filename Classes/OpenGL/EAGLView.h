//
//  EAGLView.h
//  New_Projects
//
//  Created by Ping.w on 09-4-24.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <OpenGLES/EAGL.h>
#import <OpenGLES/ES1/gl.h>
#import <OpenGLES/ES1/glext.h>
#import <GameKit/GameKit.h>

/*
This class wraps the CAEAGLLayer from CoreAnimation into a convenient UIView subclass.
The view content is basically an EAGL surface you render your OpenGL scene into.
Note that setting the view non-opaque will only work if the EAGL surface has an alpha channel.
*/
@interface EAGLView : UIView{
    
@private
    /* The pixel dimensions of the backbuffer */
    GLint backingWidth;
    GLint backingHeight;
    
    EAGLContext *context;
   
    /* OpenGL names for the renderbuffer and framebuffers used to render to this view */
    GLuint viewRenderbuffer, viewFramebuffer;
    
    /* OpenGL name for the depth buffer that is attached to viewFramebuffer, if it exists (0 if it does not exist) */
    GLuint depthRenderbuffer;
    
    NSTimer *animationTimer;
    NSTimeInterval animationInterval;
	
	CFTimeInterval mOldTime;
	
	CGPoint pointBegan;
	CGPoint pointBegan2;
	CGFloat initDistance;
	CGPoint	previousLocation;
	CGPoint location;
	
	CGPoint	Old_previousLocation;
	CGPoint Old_location;
	BOOL firstTouch;
 }

@property NSTimeInterval animationInterval;

CGFloat distanceBetweenPoint(CGPoint a,CGPoint b);
- (void)startAnimation;
- (void)stopAnimation;
- (void)drawView;
//-(void)startLoad;
-(void)accelerometerWithX:(float)x Y:(float)y Z:(float)z;




@end
