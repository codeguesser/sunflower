//
//  EAGLView.m
//  New_Projects
//
//  Created by Ping.w on 09-4-24.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//



#import <QuartzCore/QuartzCore.h>
#import <OpenGLES/EAGLDrawable.h>
#import "pAppController.h"
#import "EAGLView.h"
#import "pAppConfig.h"
#import "pFunction.h"

#define USE_DEPTH_BUFFER 1

// A class extension to declare private methods
@interface EAGLView ()



@property (nonatomic, retain) EAGLContext *context;
@property (nonatomic, assign) NSTimer *animationTimer;

- (BOOL) createFramebuffer;
- (void) destroyFramebuffer;

@end


@implementation EAGLView

@synthesize context;
@synthesize animationTimer;
@synthesize animationInterval;

AppController *appCtrl=nil;

int screentime;
int screenx;
int screeny;

// You must implement this method
+ (Class)layerClass {
	NSLog(@"layerClass..");
    return [CAEAGLLayer class];
}

//The GL view is stored in the nib file. When it's unarchived it's sent -initWithCoder:
- (id)initWithCoder:(NSCoder*)coder {
	NSLog(@"initWithCoder..");
    if ((self = [super initWithCoder:coder])) {
        // Get the layer
        CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
        
        eaglLayer.opaque = YES;
        eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [NSNumber numberWithBool:YES], kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
        
        context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];
        
        if (!context || ![EAGLContext setCurrentContext:context]) {
            [self release];
            return nil;
        }
        self.contentScaleFactor = [[UIScreen mainScreen] scale];
        screenx = self.bounds.size.width*[[UIScreen mainScreen] scale];
		screeny = self.bounds.size.height*[[UIScreen mainScreen] scale];
		screentime = [[UIScreen mainScreen] scale];
        animationInterval = 1.0/30.0;
		appCtrl = new AppController(self);
	}
    return self;
}

- (void)drawView {
	
	CFTimeInterval time = CFAbsoluteTimeGetCurrent();
	float dt = time - mOldTime;
	mOldTime = time;
	
	//the drawing buffer
	[EAGLContext setCurrentContext:context];
	glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
	glClear(GL_COLOR_BUFFER_BIT);
	glColor4f(1.0f, 1.0f, 1.0f, 1.0f);
	//**************************chon 10.01.29**************************************
	appCtrl->updateApp(dt);
	glPointSize(50);
	//Allocate vertex array buffer

	appCtrl->drawApp();
//////////**************************************************************************************
	//appCtrl->drawApp();
	glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
	[context presentRenderbuffer:GL_RENDERBUFFER_OES];
}
-(void)startLoad:(NSString*)obj{
	NSLog(@"thread start");
	[self performSelectorOnMainThread:@selector(start:) withObject:obj waitUntilDone:NO];
}
-(void)start:(NSString*)obj{
	//NSAutoreleasePool* pool=[[NSAutoreleasePool alloc] init];
	//NSInteger state=[obj intValue];
	//[pool release];
}
- (void)layoutSubviews {
	NSLog(@"layoutSubviews..");
    [EAGLContext setCurrentContext:context];
    [self destroyFramebuffer];
    [self createFramebuffer];
	
	glViewport(0, 0, backingWidth, backingHeight);
	
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrthof(0, (float)backingWidth, 0, (float)backingHeight, 0, 100);
	
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
	
	glEnable(GL_TEXTURE_2D);
	glEnable(GL_BLEND);
	glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
	
	glEnableClientState (GL_VERTEX_ARRAY);
    glEnableClientState (GL_TEXTURE_COORD_ARRAY);
	glClearColor(0.0f, 0.0f, 0.0f, 0.0f);
	
    [self drawView];
}


- (BOOL)createFramebuffer {
    
	NSLog(@"createFramebuffer..");
    glGenFramebuffersOES(1, &viewFramebuffer);
    glGenRenderbuffersOES(1, &viewRenderbuffer);
    
    glBindFramebufferOES(GL_FRAMEBUFFER_OES, viewFramebuffer);
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, viewRenderbuffer);
    [context renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:(CAEAGLLayer*)self.layer];
    glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, viewRenderbuffer);
    
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight);
    
    if (USE_DEPTH_BUFFER) {
        glGenRenderbuffersOES(1, &depthRenderbuffer);
        glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthRenderbuffer);
        glRenderbufferStorageOES(GL_RENDERBUFFER_OES, GL_DEPTH_COMPONENT16_OES, backingWidth, backingHeight);
        glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthRenderbuffer);
    }
    
    if(glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES) {
        NSLog(@"failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
        return NO;
    }
    
    return YES;
}


- (void)destroyFramebuffer {
    NSLog(@"destroyFramebuffer..");
    glDeleteFramebuffersOES(1, &viewFramebuffer);
    viewFramebuffer = 0;
    glDeleteRenderbuffersOES(1, &viewRenderbuffer);
    viewRenderbuffer = 0;
    
    if(depthRenderbuffer) {
        glDeleteRenderbuffersOES(1, &depthRenderbuffer);
        depthRenderbuffer = 0;
    }
}


- (void)startAnimation {
    //self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:1.0/10.0 target:self selector:@selector(drawView) userInfo:nil repeats:YES];
	self.animationTimer = [NSTimer scheduledTimerWithTimeInterval:animationInterval target:self selector:@selector(drawView) userInfo:nil repeats:YES];
	mOldTime = CFAbsoluteTimeGetCurrent();
	location.x = 0;
	location.y = 0;
	
	previousLocation.x = 0;
	previousLocation.y = 0;
	
	Old_location.x = 0;
	Old_location.y = 0;
	
	Old_previousLocation.x = 0;
	Old_previousLocation.y = 0;
}


- (void)stopAnimation {
	self.animationTimer = nil;
}


- (void)setAnimationTimer:(NSTimer *)newTimer {
    [animationTimer invalidate];
    animationTimer = newTimer;
}

#pragma mark --------------------------here-----------------------------
- (void)setAnimationInterval:(NSTimeInterval)interval {
    animationInterval = interval;
    if (animationTimer) {
        [self stopAnimation];
        [self startAnimation];
    }
}


- (void)dealloc {
    
    [self stopAnimation];
    
    if ([EAGLContext currentContext] == context) {
        [EAGLContext setCurrentContext:nil];
    }
    delete appCtrl;
	appCtrl=nil;
    [context release];  
    [super dealloc];
}

#pragma mark ------------ touch -------------
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	for (UITouch *touch in touches) {
		CGPoint point = [touch locationInView:self];
		appCtrl->touchBegan(point.x,point.y);
	}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	for (UITouch *touch in touches) {
		CGPoint point = [touch locationInView:self];
		appCtrl->touchEnded(point.x,point.y);
	}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	for (UITouch *touch in touches) {
		CGPoint point = [touch locationInView:self];
		appCtrl->touchMoved(point.x,point.y);
	}
}
-(void)accelerometerWithX:(float)x Y:(float)y Z:(float)z{
	appCtrl->accelerometer(x,y,z);
}




@end
