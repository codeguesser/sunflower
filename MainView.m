//
//  MainView.m
//  New_Projects
//
//  Created by Ghost on 08/05/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainView.h"
#import "EAGLView.h"
#import "PosterCard.h"
#import "Product.h"
#import "Tips.h"
#import "EnquiryView.h"
#import "Favorite.h"
#import <QuartzCore/QuartzCore.h>
#import "facebook.h"
facebook* facebookView;

BOOL c_xmlread;
MainView *myMainView;


PosterCard *PosterCardView;
Product *ProductView;
Tips *TipsView;
EnquiryView *EnquiryView1;
Favorite *FavoriteView;

@implementation MainView
@synthesize glView;
@synthesize app_state;
@synthesize app_old_state;
@synthesize c_maintittle1,c_maintittle,Tab2hiddenBtn;
int all=0;
MainView *myMainView;

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}






- (void)viewDidLoad {
	myMainView = self;
	
	c_item=0;
    c_itemOld=c_item;
    [super viewDidLoad];

	
	facebookView = [[facebook alloc]init];
	[facebookView initFacebook];
	
	
	if (all==0) {
		nav=[[UINavigationController alloc]initWithRootViewController:[[PosterCard alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[nav setNavigationBarHidden:YES];
		[self.view addSubview:nav.view];
	}
	else {
		nav=[[UINavigationController alloc]initWithRootViewController:[[PosterCard alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[nav setNavigationBarHidden:NO];
		[self.view addSubview:nav.view];
	}

	
	
	XX=0;
	
	
	
	black=[[UIImageView alloc]initWithFrame:CGRectMake(90, 140, 140, 100)];
	//black=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
	black.alpha=0.7;
	black.layer.cornerRadius = 15.0;
	black.layer.masksToBounds = YES;
	black.backgroundColor=[UIColor blackColor];
	[self.view addSubview:black];
	
	
	lab=[[UILabel alloc]initWithFrame:CGRectMake(5, 75, 140, 20)];
	lab.text=@"讀取中，請稍等...";
	lab.backgroundColor=[UIColor clearColor];
	lab.textColor=[UIColor whiteColor];
	lab.font=[UIFont boldSystemFontOfSize:16];
	
	[black addSubview:lab];
	
	loading = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140-90,160-140,40.0f,40.0f)]; 
	[loading setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
	//[self.view addSubview:loading];
	[black addSubview:loading];
	[self loadingStop];
	
	
	
	black2=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
	black2.alpha=1.0;
	black2.backgroundColor=[UIColor blackColor];
	[self.view addSubview:black2];
	
	
	c_black=[[UIImageView alloc]initWithFrame:CGRectMake(90, 140, 0, 0)];
	c_black.alpha=0.7;
	c_black.layer.cornerRadius = 15.0;
	c_black.layer.masksToBounds = YES;
	
	
	c_black.backgroundColor=[UIColor blackColor];
	
	
	
	loadtab=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
	//[loadtab setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"loading"] ofType:@"png"]]];
	
	
	
	[black2 addSubview:loadtab];
	
	lab2=[[UILabel alloc]initWithFrame:CGRectMake(160-70, 240+10, 140, 20)];
	lab2.text=@"讀取中，請稍等...";
	lab2.backgroundColor=[UIColor clearColor];
	lab2.textAlignment = UITextAlignmentCenter;
	lab2.textColor=[UIColor whiteColor];
	lab2.font=[UIFont boldSystemFontOfSize:16];
	
	[black2 addSubview:lab2];
	
	loading2 = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(160-20,240-40,40.0f,40.0f)]; 
	[loading2 setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
	//[self.view addSubview:loading];
	[black2 addSubview:loading2];
	[self loadingStop2];
	
	
//=============================================================================================================	
	
	black3=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
	black3.alpha=1.0;
	black3.backgroundColor=[UIColor blackColor];
	[self.view addSubview:black3];
	
	
	c_black3=[[UIImageView alloc]initWithFrame:CGRectMake(90, 140, 140, 100)];
	c_black3.alpha=0.7;
	c_black3.layer.cornerRadius = 15.0;
	c_black3.layer.masksToBounds = YES;
	
	
	c_black3.backgroundColor=[UIColor blackColor];
	
	
	
	loadtab3=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
	[loadtab3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"loading2"] ofType:@"png"]]];
	
	
	
	[black3 addSubview:loadtab3];
	[black3 addSubview:c_black3];
	
	
	
	lab3=[[UILabel alloc]initWithFrame:CGRectMake(5, 75, 140, 20)];
	lab3.text=@"讀取中，請稍等...";
	lab3.backgroundColor=[UIColor clearColor];
	lab3.textColor=[UIColor whiteColor];
	lab3.font=[UIFont boldSystemFontOfSize:16];
	
	[c_black3 addSubview:lab3];
	
	loading3 = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(140-90,160-140,40.0f,40.0f)]; 
	[loading3 setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[self.view addSubview:loading3];
	[c_black3 addSubview:loading3];
	[self loadingStop3];

//=============================================================================================================	
	
	
	c_view=[[UIView alloc] initWithFrame:CGRectMake(0, 480-48, 320, 48)];
	[self.view addSubview:c_view];
	
	
	
	
	for(int i=0;i<5;i++)
	{
		if(i==c_item)
		{
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
			[c_view addSubview:btnfoot];
			
		}
		else {
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
			[c_view addSubview:btnfoot];
		}
	}
	
	if (Tab2hiddenBtn) {
		[Tab2hiddenBtn removeFromSuperview];
		[Tab2hiddenBtn release];
		Tab2hiddenBtn=nil;
	}
	Tab2hiddenBtn= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	[Tab2hiddenBtn addTarget:self action:@selector(initProduct)forControlEvents:UIControlEventTouchUpInside];
	Tab2hiddenBtn.frame=CGRectMake(64, 0, 64, 48);
	Tab2hiddenBtn.hidden=YES;
	[c_view addSubview:Tab2hiddenBtn];
	
	
}




-(IBAction)btnfoot:(UIButton*)sender
{
//	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
//	}
}
-(void)loadingAnimation:(id)arg{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	[self.view addSubview:black];
	[loading startAnimating];
	 black.hidden = NO;
	[pool release];
}
-(void)loadingStop
{
	[loading stopAnimating];  
	black.hidden = YES;
}
-(void)startLoad
{
	[NSThread detachNewThreadSelector:@selector(loadingAnimation:) toTarget:self withObject:nil];
}



-(void)loadingAnimation2:(id)arg{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	[self.view addSubview:black2];
	[loading2 startAnimating];
	black2.hidden = NO;
	[pool release];
}
-(void)loadingStop2
{
	XX=0;
	[loading2 stopAnimating]; 
	black2.hidden = YES;
	
}
-(void)startLoad2
{
	[NSThread detachNewThreadSelector:@selector(loadingAnimation2:) toTarget:self withObject:nil];
}


-(void)loadingAnimation3:(id)arg{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	[self.view addSubview:black3];
	[loading3 startAnimating];
	black3.hidden = NO;
	[pool release];
}
-(void)loadingStop3
{
	XX=0;
	[loading3 stopAnimating]; 
	black3.hidden = YES;
	
}
-(void)startLoad3
{
	[NSThread detachNewThreadSelector:@selector(loadingAnimation3:) toTarget:self withObject:nil];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; 
	// Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}






#pragma mark glcontrol

-(void)ResignActive
{
	glView.animationInterval = 1.0 / 5.0;
}
-(void)BecomeActive
{
	glView.animationInterval = 1.0 / 30.0;
}
-(void)accelerometerWithX:(float)x Y:(float)y Z:(float)z
{
	[glView accelerometerWithX:x Y:y Z:z];

}


#pragma mark *** PTouchs ***

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	[glView touchesBegan:touches withEvent:event];

}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	[glView touchesEnded:touches withEvent:event];
	
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	[glView touchesMoved:touches withEvent:event];
}





-(void)initPosterCard
{
	if (all==0) {
		nav=[[UINavigationController alloc]initWithRootViewController:[[PosterCard alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		[nav setNavigationBarHidden:YES];
			NSLog(@"%d",all);
	}
	else {
		nav=[[UINavigationController alloc]initWithRootViewController:[[PosterCard alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		[nav setNavigationBarHidden:NO];
			NSLog(@"%d",all);
	}

	
	
	
}
-(void)deletePosterCard
{
	[PosterCardView.view removeFromSuperview];
	[PosterCardView release];
	PosterCardView = nil;
}

-(void)initProduct

{
    
	if (all==0) {
		nav=[[UINavigationController alloc]initWithRootViewController:[[Product alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		
		[nav setNavigationBarHidden:YES];
		Tab2hiddenBtn.hidden=YES;
			NSLog(@"%d",all);
	}
	else {
		nav=[[UINavigationController alloc]initWithRootViewController:[[Product alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		
		[nav setNavigationBarHidden:NO];
			NSLog(@"%d",all);
	}
    if(c_itemOld==0)
    {
        app_state=3;
        app_old_state=app_state;
        for(int i=0;i<5;i++)
        {
            if(i==1)
            {
                [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
            }
            else {
                [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                
            }
        }
    }
	
	
	
	//[ProductView.view setFrame:CGRectMake(0,20,320,460)];
}
-(void)deleteProduct
{
	[ProductView.view removeFromSuperview];
	[ProductView release];
	ProductView = nil;
	
}

-(void)initTips
{
	if (all==0) {
		nav=[[UINavigationController alloc]initWithRootViewController:[[Tips alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		
		[nav setNavigationBarHidden:YES];
			NSLog(@"%d",all);
	}
	else {
		nav=[[UINavigationController alloc]initWithRootViewController:[[Tips alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		
		[nav setNavigationBarHidden:NO];
			NSLog(@"%d",all);
	}

	
}

-(void)deleteTips
{
	[TipsView.view removeFromSuperview];
	[TipsView release];
	TipsView = nil;
	
	
	
	
}

-(void)initEnquiryView
{
	
	if (all==0) {
		nav=[[UINavigationController alloc]initWithRootViewController:[[EnquiryView alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		
		[nav setNavigationBarHidden:YES];
			NSLog(@"%d",all);
	}
	else {
		nav=[[UINavigationController alloc]initWithRootViewController:[[EnquiryView alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		
		[nav setNavigationBarHidden:NO];
			NSLog(@"%d",all);
	}

	
	
	
	
	
	
	
}
-(void)deleteEnquiryView
{
	[EnquiryView1.view removeFromSuperview];
	[EnquiryView1 release];
	EnquiryView1 = nil;
	
	
}



-(void)initFavorite
{
	
	
	if (all==0) {
		nav=[[UINavigationController alloc]initWithRootViewController:[[Favorite alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		[nav setNavigationBarHidden:YES];
		NSLog(@"%d",all);
	}
	else {
		nav=[[UINavigationController alloc]initWithRootViewController:[[Favorite alloc]init]];
		nav.view.frame=CGRectMake(0, 20, 320, 460-48);
		[self.view addSubview:nav.view];
		[nav setNavigationBarHidden:NO];
		NSLog(@"%d",all);
	}

	
	
}
-(void)deleteFavorite
{
	
	[FavoriteView.view removeFromSuperview];
	[FavoriteView release];
	FavoriteView = nil;
}





-(void)mainviewinitstate:(int)state
{
	app_old_state=app_state;
	switch (state)
	{
		case _STATE_NEWS:
			
			[self initPosterCard];
			c_item=0;
            c_itemOld=c_item;
			
			for(int i=0;i<5;i++)
			{
                if(i==c_item)
                {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                }
                else {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                    
                }
                /*
				if(i==c_item)
				{
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
					
				}
				else {
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					//btnfoot.alpha=0.5;
					//btnfoot.frame = CGRectMake(i*64,412,64,48);
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
				}
                 */
			}
			
			
			if (Tab2hiddenBtn) {
				[Tab2hiddenBtn removeFromSuperview];
				[Tab2hiddenBtn release];
				Tab2hiddenBtn=nil;
			}
			Tab2hiddenBtn= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
			[Tab2hiddenBtn addTarget:self action:@selector(initProduct)forControlEvents:UIControlEventTouchUpInside];
			Tab2hiddenBtn.frame=CGRectMake(64, 0, 64, 48);
			Tab2hiddenBtn.hidden=YES;
			[c_view addSubview:Tab2hiddenBtn];
			break;
		case _STATE_CALENDAR:
			
			[self initProduct];
			c_item=1;
            c_itemOld=c_item;
			for(int i=0;i<5;i++)
			{
                if(i==c_item)
                {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                }
                else {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                    
                }
                /*
				if(i==c_item)
				{
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
					
				}
				else
                {
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
				}
                 */
			}
			
			
			if (Tab2hiddenBtn) {
				[Tab2hiddenBtn removeFromSuperview];
				[Tab2hiddenBtn release];
				Tab2hiddenBtn=nil;
			}
			Tab2hiddenBtn= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
			[Tab2hiddenBtn addTarget:self action:@selector(initProduct)forControlEvents:UIControlEventTouchUpInside];
			Tab2hiddenBtn.frame=CGRectMake(64, 0, 64, 48);
			Tab2hiddenBtn.hidden=YES;
			[c_view addSubview:Tab2hiddenBtn];
			NSLog(@"11111111");
			break;
		case _STATE_ARCHIVE:
			[self initTips];
			c_item=2;
			c_itemOld=c_item;
			
			for(int i=0;i<5;i++)
			{
                if(i==c_item)
                {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                }
                else {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                    
                }
                /*
				if(i==c_item)
				{
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
					
				}
				else {
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					//btnfoot.alpha=0.5;
					//btnfoot.frame = CGRectMake(i*64,412,64,48);
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
				}
                 */
			}
			
			if (Tab2hiddenBtn) {
				[Tab2hiddenBtn removeFromSuperview];
				[Tab2hiddenBtn release];
				Tab2hiddenBtn=nil;
			}
			Tab2hiddenBtn= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
			[Tab2hiddenBtn addTarget:self action:@selector(initProduct)forControlEvents:UIControlEventTouchUpInside];
			Tab2hiddenBtn.frame=CGRectMake(64, 0, 64, 48);
			Tab2hiddenBtn.hidden=YES;
			[c_view addSubview:Tab2hiddenBtn];
			break;
		case _STATE_FANPAGE:
			[self initEnquiryView];
			c_item=3;
			c_itemOld=c_item;
			
			for(int i=0;i<5;i++)
			{
                if(i==c_item)
                {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                }
                else {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                    
                }
                /*
				if(i==c_item)
				{
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					//btnfoot.alpha=0.5;
					//btnfoot.frame = CGRectMake(i*64,412,64,48);
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
					
				}
				else {
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					//btnfoot.alpha=0.5;
					//btnfoot.frame = CGRectMake(i*64,412,64,48);
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
				}
                 */
			}
			
			
			if (Tab2hiddenBtn) {
				[Tab2hiddenBtn removeFromSuperview];
				[Tab2hiddenBtn release];
				Tab2hiddenBtn=nil;
			}
			Tab2hiddenBtn= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
			[Tab2hiddenBtn addTarget:self action:@selector(initProduct)forControlEvents:UIControlEventTouchUpInside];
			Tab2hiddenBtn.frame=CGRectMake(64, 0, 64, 48);
			Tab2hiddenBtn.hidden=YES;
			[c_view addSubview:Tab2hiddenBtn];
			break;
		case _STATE_CONTACTUS:
			[self initFavorite];
			c_item=4;
			c_itemOld=c_item;
			
			for(int i=0;i<5;i++)
			{
                if(i==c_item)
                {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                }
                else {
                    [(UIButton *)[self.view viewWithTag:20+i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
                    
                }
                /*
				if(i==c_item)
				{
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					//btnfoot.alpha=0.5;
					//btnfoot.frame = CGRectMake(i*64,412,64,48);
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
					
				}
				else {
					btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
					[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
					[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
					btnfoot.tag = 20+i;
					//btnfoot.alpha=0.5;
					//btnfoot.frame = CGRectMake(i*64,412,64,48);
					btnfoot.frame=CGRectMake(i*64, 0, 64, 48);
					[c_view addSubview:btnfoot];
				}
                 */
			}
			
			
			if (Tab2hiddenBtn) {
				[Tab2hiddenBtn removeFromSuperview];
				[Tab2hiddenBtn release];
				Tab2hiddenBtn=nil;
			}
			Tab2hiddenBtn= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
			[Tab2hiddenBtn addTarget:self action:@selector(initProduct)forControlEvents:UIControlEventTouchUpInside];
			Tab2hiddenBtn.frame=CGRectMake(64, 0, 64, 48);
			Tab2hiddenBtn.hidden=YES;
			[c_view addSubview:Tab2hiddenBtn];
			break;
		default:
			break;
	}
	app_state=state;
}
-(void)mainviewdelete{
	switch (app_old_state)
	{
		case _STATE_NEWS:
			[self deletePosterCard];
			break;
		case _STATE_CALENDAR:
			[self deleteProduct];
			break;
		case _STATE_ARCHIVE:
			[self deleteTips];
			break;
		case _STATE_FANPAGE:
			[self deleteEnquiryView];
			break;
		case _STATE_CONTACTUS:
			[self deleteFavorite];
			break;
		default:
			break;
	}
}




-(void)AnimetionUpdate
{
	//m_pImgView=nil;
	
	XX++;
	if (XX%10==1) {
		black2.alpha-=1.0;
	}
	
}


-(void)DestroyTimer
{
	if(m_pTimer)
	{
		if([m_pTimer isValid])
		{
			[m_pTimer invalidate];
		}
		XX=0;
		m_pTimer = nil;
	}
}

-(void)StartTimer
{
	[self DestroyTimer];
	
	m_pTimer = [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(AnimetionUpdate) userInfo:nil repeats:YES];
}





- (void)dealloc {
	
	[loading release];
    [super dealloc];
}

@end
