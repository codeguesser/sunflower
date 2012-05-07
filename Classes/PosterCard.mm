//
//  PosterCard.mm
//  New_Projects
//
//  Created by chen cool on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PosterCard.h"
#import "MainView.h"
#import "News.h"
#import "OpenPDF.h"
#import "ASIHTTPRequest.h"
#import "EnquiryViewMy.h"
#import "Product4.h"
#import <MediaPlayer/MediaPlayer.h>

#import "Game_VideoPlay.h"
extern BOOL c_ccxml;


#define AppMainMenuImg_Dic				[NSHomeDirectory() stringByAppendingString:@"/Documents/"]
int c_kkkkkk=0;
int c_kkk=0;

extern int all;
extern MainView *myMainView;
int c_page;

@implementation PosterCard
@synthesize scrollview;
@synthesize m_pReImgData;
@synthesize TextView,TextView1;




- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor=[UIColor grayColor];
	
	
	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 330, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	[self.view addSubview:topbar];
	
	
	
	
	
	
	UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"最新資訊";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle];
	[tittle release];
	
	
	
	DownLpath=[[NSString alloc]init];
	
	if (c_kkkkkk==0) {
		//[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(VideoPlayFinish1) name:@"ChangeState" object:nil];
		//Game_VideoPlay *m_pVideoPlay = [[Game_VideoPlay alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 480.0)];
		//self.view.backgroundColor=[UIColor clearColor];
		//[m_pVideoPlay video_play:@"sm"];
		c_kkkkkk++;
		//[NSThread detachNewThreadSelector:@selector(VideoPlayFinish:) toTarget:self withObject:nil];
		
		if (all==0) {
			//[self VideoPlayFinish1];
			[self performSelector:@selector(VideoPlayFinish1) withObject:nil afterDelay:0.1];
		}
		else {
			[self performSelector:@selector(VideoPlayFinish2) withObject:nil afterDelay:0.1];
			//[self VideoPlayFinish2];
		}

		
		
		
	}
	else {
		if (all==0) {
			//[self VideoPlayFinish1];
			[self performSelector:@selector(VideoPlayFinish1) withObject:nil afterDelay:0.1];
		}
		else {
			[self performSelector:@selector(VideoPlayFinish2) withObject:nil afterDelay:0.1];
			//[self VideoPlayFinish2];
		}
	}
	
	
}

-(void)VideoPlayFinish1
{
	
	
	
	[myMainView startLoad];
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil alloc] init];
	[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/info.xml"] :[[NSArray alloc]initWithObjects:@"sub_cat_name",@"next_level_api",@"info",@"package_pdf_path",nil]];
	//[XMLUtilView getErrorCode];
	
	//NSLog(@"啊庞被改造%@",(c_ccxml ? @"成功":@"失败"));
	//NSString *c_cg=[[NSString alloc]initWithFormat:@"%@",(c_ccxml ? @"哈哈":@"操，这么垃圾")];
	//NSLog(@"%@",c_cg);
	
	
	if ([(c_ccxml ? @"成功":@"失败")isEqualToString:@"成功"]) 
	{
		//NSLog(@"庞：怎么可能！");
		
		
		NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"info"]objectAtIndex:0]];
		

		
		
		NSString *c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
		NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange(39+12,[c_pdf length]-39-12-4)];
		NSString *c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
		NSString *MainMenuImgStorePath = AppMainMenuImg_Dic;
		
	
		MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
		

		
		if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO)
		{
			
			DownLpath=MainMenuImgPath;
			[self dxc:xmlurl];
		}
		else {
			//NSLog(@"oh my god");
			[myMainView loadingStop];
		}
		
		
		
		
		btn= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		[btn addTarget:self action:@selector(ToNews:)forControlEvents:UIControlEventTouchUpInside];
		[btn setImage:[UIImage imageWithContentsOfFile:MainMenuImgPath] forState:UIControlStateNormal];
		
		btn.frame = CGRectMake(0,45,320,412-45);
		[self.view addSubview:btn];
		
		
		
		c_view=[[UIView alloc] initWithFrame:CGRectMake(0, 480-48-20, 320, 48)];
		//c_view.backgroundColor=[UIColor redColor];
		//c_view.alpha=;
		[self.view addSubview:c_view];
		
		
		c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
		[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
		[topbar addSubview:c_I];
		
		BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
		[BTN addTarget:self action:@selector(next1:)forControlEvents:UIControlEventTouchUpInside];
		//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
		BTN.frame = CGRectMake(270, 0, 55, 45);
		[self.view addSubview:BTN];
		
		
		
		
		
	}
	else {
		NSLog(@"tab1无网络链接");
		
		
		UIAlertView *netWorkError5 = 
		[[UIAlertView alloc] 
		initWithTitle:@"無法連接到伺服器，請檢查你的網絡設定或可瀏覽離線內容\"旅遊錦囊\"。"
		message:@"" 
		delegate:self 
		cancelButtonTitle:nil 
		otherButtonTitles:@"確定",nil];
		[netWorkError5 show];
		[netWorkError5 release];
		
		
	}

	
	
	
	
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch(buttonIndex)
	{
		case 0:
			//[self showPicker];
        {
            [myMainView mainviewinitstate:4];
			[myMainView mainviewdelete];
        }
			
			break;
	}
}



-(void)VideoPlayFinish2
{

	
	//http://www.sunflower.com.hk/images/iphoneapps/area/latestinfo_1121.jpg
	NSString *xmlurl = [[NSString alloc]initWithFormat:@"http://www.sunflower.com.hk/images/iphoneapps/area/latestinfo-banner-demo.jpg"];
	
	[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];
	
	self.navigationItem.title = @"最新資訊";
	
	NSString *c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
	NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange(39,6)];
	NSString *c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
	NSString *MainMenuImgStorePath = AppMainMenuImg_Dic;
	
	//MainMenuPdfPath = [[NSString alloc]initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_kzm];
	MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
	
	
	NSString *c_pdf1 = [[NSString alloc]initWithFormat:@"http://www.sunflower.com.hk/hotepackpdf/HTOX03-04-05DL.pdf"];
	NSString *c_pdfnow1 = [c_pdf1 substringWithRange:NSMakeRange([c_pdf1 length]-8,4)];
	NSString *c_kzm1 = [c_pdf1 substringWithRange:NSMakeRange([c_pdf1 length]-3, 3)];
	NSString *MainMenuImgStorePath1 = AppMainMenuImg_Dic;
	MainMenuPdfPath = [[NSString alloc]initWithFormat:@"%@%@.%@",MainMenuImgStorePath1,c_pdfnow1,c_kzm1];
	
	//[NSThread detachNewThreadSelector:@selector(dxc:) toTarget:self withObject:nil];
	[myMainView startLoad2];
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil alloc] init];
	[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/info.xml"] :[[NSArray alloc]initWithObjects:@"info",@"package_pdf_path",nil]];
	[XMLUtilView getErrorCode];
	
	//[myMainView startLoad2];
	
	
	//[self dxc:c_pdf1];
	
	if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO)
	{
		
		DownLpath=MainMenuImgPath;
		[self dxc:xmlurl];
	}
	else {
		NSLog(@"oh my god");
		[myMainView loadingStop2];
	}
	
	
	
	
	//NSURL *url=[NSURL URLWithString:MainMenuImgPath];
	//NSData *data=[NSData dataWithContentsOfURL:url];
	//UIImage *Img=[UIImage imageWithData:data];
	
	
	btn= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btn addTarget:self action:@selector(ToNews:)forControlEvents:UIControlEventTouchUpInside];
	//[btn setImage:Img forState:UIControlStateNormal];
	//	[btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",MainMenuImgPath] ofType:@""]]forState:UIControlStateNormal];
	
	[btn setImage:[UIImage imageWithContentsOfFile:MainMenuImgPath] forState:UIControlStateNormal];
	
	btn.frame = CGRectMake(0,0,320,412-44);
	[self.view addSubview:btn];
	
	
	
	c_view=[[UIView alloc] initWithFrame:CGRectMake(0, 480-48-20, 320, 48)];
	//c_view.backgroundColor=[UIColor redColor];
	//c_view.alpha=;
	[self.view addSubview:c_view];
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar addSubview:c_I];
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next1:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	//[self.view addSubview:BTN];
}



-(void)viewDidAppear:(BOOL)animated
{
	

	
}



-(void)VideoPlayFinish
{
	
	
	
	
	
	
	
	
	
	
	c_page=0;
	
	
	scr=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320,480)];
	scr.contentSize=CGSizeMake(500, 700);
	scr.hidden=YES;
	[self.view addSubview:scr];
	
	scrollview = [[UIScrollView alloc] init];
	scrollview.frame=CGRectMake(0, 0, 320, 480);
	scrollview.contentSize = CGSizeMake(320*6,scrollview.frame.size.height);
	scrollview.pagingEnabled = YES;
	scrollview.delegate=self;
	scrollview.backgroundColor=[UIColor clearColor];
	
	//scrollview.delegate=self;
	[self.view addSubview:scrollview];
	
	scrollview.hidden=YES;
	
	
	
	
	
	
	
	
	
	
	UIImageView *IMGview=[[UIImageView alloc]initWithFrame:CGRectMake(320, 0, 320, 480)];
	[IMGview setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bg"] ofType:@"jpg"]]];
	[scrollview addSubview:IMGview];
	
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[scrollview addSubview:footbar];
	[footbar release];
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//UIButton *btn= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	//	[btn addTarget:self action:@selector(btn:)forControlEvents:UIControlEventTouchUpInside];
	//	[btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"postcard_cover"] ofType:@"jpg"]] forState:UIControlStateNormal];
	//	
	//	btn.frame = CGRectMake(0,45,320,412-45);
	//	[scrollview addSubview:btn];
	//[btn release];
	
	
	
	
	
	photoImageView=[[UIImageView alloc]initWithFrame:CGRectMake(15+35+50, 45+20+100, 300,335)];
	photoImageView.backgroundColor=[UIColor clearColor];
	//photoImageView.backgroundColor=[UIColor blueColor];
	[scr addSubview:photoImageView];
	[scr setContentOffset:CGPointMake(50+15,100) animated:NO];
	
	
	
	
	c_PosterCard = [[UIImageView alloc]initWithFrame:CGRectMake(320*3, 35, 640, 480-45)];
	[c_PosterCard setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"choose_postcard1"] ofType:@"png"]]];
	[scrollview addSubview:c_PosterCard];
	
	
	cut_Photo=[[UIImageView alloc]initWithFrame:CGRectMake(320*5+160-390*0.5+116, 80+5-50+16, 200-40, 200)];
	cut_Photo.backgroundColor=[UIColor blueColor];
	cut_Photo.transform = CGAffineTransformMakeRotation(3.1415926*0.5);
	[scrollview addSubview:cut_Photo];
	
	
	
	c_PosterCard1 = [[UIImageView alloc]initWithFrame:CGRectMake(320*5+160-390*0.5+16, 80+5+16, 480-48-45-20, 320-45-20)];
	[c_PosterCard1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"choose_postcard1"] ofType:@"png"]]];
	c_PosterCard1.transform = CGAffineTransformMakeRotation(3.1415926*0.5);
	[scrollview addSubview:c_PosterCard1];
	
	
	
	
	TextView=[[UITextView alloc]initWithFrame:CGRectMake(320*4+20, 45+100, 320-50, 480-48-45-80)];
	TextView.backgroundColor=[UIColor clearColor];
	//TextView.alpha=0.5;
	
	TextView.font = [UIFont systemFontOfSize:40];
	//[TextView resignFirstResponder];
	[scrollview addSubview:TextView];
	
	
	
	
	TextView1=[[UITextView alloc]initWithFrame:CGRectMake(320*5+20+60, 45+200, 320-50-100, 480-48-45-80-160)];
	TextView1.backgroundColor=[UIColor clearColor];
	//TextView.alpha=0.5;
	TextView1.userInteractionEnabled=NO;
	TextView1.text=[[NSString alloc]initWithFormat:@"%@",TextView.text];
	TextView1.font = [UIFont systemFontOfSize:27];
	TextView1.transform = CGAffineTransformMakeRotation(3.1415926*0.5);
	//[TextView resignFirstResponder];
	[scrollview addSubview:TextView1];
	
	//imgbigest.transform = CGAffineTransformMakeRotation(3.1415926*0.5);
	
	
	
	c_cutPt=[[UIImageView alloc]initWithFrame:CGRectMake(320*5+160-390*0.5,45 , 480-45-45, 320)];
	
	c_cutPt.backgroundColor=[UIColor blueColor];
	//[scrollview addSubview:c_cutPt];
	
	//[self cut:nil];
	
#pragma mark labs(long )	
	//====================================================================================================================	
	
	//UIImageView *topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	//	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	//	[scrollview addSubview:topbar];
	
	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 330, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	[self.view addSubview:topbar];
	
	
	UIImageView *topbar2 = [[UIImageView alloc]initWithFrame:CGRectMake(320*3, 0, 320, 45)];
	[topbar2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	[scrollview addSubview:topbar2];
	
	topbar3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	topbar3.hidden=YES;
	[self.view addSubview:topbar3];
	
	
	UIImageView *topbar4 = [[UIImageView alloc]initWithFrame:CGRectMake(320*5, 0, 320, 45)];
	[topbar4 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	[scrollview addSubview:topbar4];
	
	
	UILabel *tittle2 = [[UILabel alloc]initWithFrame:CGRectMake(320*3-40, 0, 320, 45)];
	tittle2.text=@"拍照";
	tittle2.textColor = [UIColor whiteColor];
	tittle2.backgroundColor = [UIColor clearColor];
	tittle2.textAlignment = UITextAlignmentCenter;
	//tittle2.font = [UIFont systemFontOfSize:20];
	tittle2.font=[UIFont boldSystemFontOfSize:20];
	[scrollview addSubview:tittle2];
	[tittle2 release];
	
	
	
	
	UILabel *tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=@"最新資訊";
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	//tittle.font = [UIFont systemFontOfSize:20];
	tittle1.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle1];
	[tittle1 release];
	
	
	
	UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"最新資訊";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	//tittle.font = [UIFont systemFontOfSize:20];
	tittle.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle];
	[tittle release];
	
	
	
	tittle3 = [[UILabel alloc]initWithFrame:CGRectMake(-40, 0, 320, 45)];
	tittle3.text=@"留言";
	tittle3.textColor = [UIColor whiteColor];
	tittle3.backgroundColor = [UIColor clearColor];
	tittle3.textAlignment = UITextAlignmentCenter;
	//tittle3.font = [UIFont systemFontOfSize:20];
	tittle3.font=[UIFont boldSystemFontOfSize:20];
	tittle3.hidden=YES;
	[self.view addSubview:tittle3];
	//[tittle3 release];
	
	
	
	UILabel *tittle4 = [[UILabel alloc]initWithFrame:CGRectMake(320*5-40, 0, 320, 45)];
	tittle4.text=@"預覽";
	tittle4.textColor = [UIColor whiteColor];
	tittle4.backgroundColor = [UIColor clearColor];
	tittle4.textAlignment = UITextAlignmentCenter;
	tittle4.font=[UIFont boldSystemFontOfSize:20];
	[scrollview addSubview:tittle4];
	[tittle4 release];
	
	
	
#pragma mark btn	
	//--------------------------------------------------------------------------------------------------------------------	
	HomeBtn = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[HomeBtn addTarget:self action:@selector(home:) forControlEvents:UIControlEventTouchUpInside]; 
	[HomeBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"home_button"] ofType:@"png"]] forState:UIControlStateNormal];
	[HomeBtn setFrame:CGRectMake(0,0,45,45)];
	HomeBtn.hidden=YES;
	[self.view addSubview:HomeBtn];
	
	
	
	BackBtn = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[BackBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside]; 
	[BackBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"back_button"] ofType:@"png"]] forState:UIControlStateNormal];
	[BackBtn setFrame:CGRectMake(320-130,3,60,40)];
	BackBtn.hidden=YES;
	[self.view addSubview:BackBtn];
	
	BackBtn2 = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[BackBtn2 addTarget:self action:@selector(back2:) forControlEvents:UIControlEventTouchUpInside]; 
	[BackBtn2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"back_button"] ofType:@"png"]] forState:UIControlStateNormal];
	[BackBtn2 setFrame:CGRectMake(320-130,3,60,40)];
	BackBtn2.hidden=YES;
	[self.view addSubview:BackBtn2];
	
	
	BackBtn3 = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[BackBtn3 addTarget:self action:@selector(back3:) forControlEvents:UIControlEventTouchUpInside]; 
	[BackBtn3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"back_button"] ofType:@"png"]] forState:UIControlStateNormal];
	[BackBtn3 setFrame:CGRectMake(320*6-130,3,60,40)];
	//BackBtn3.hidden=YES;
	[scrollview addSubview:BackBtn3];
	
	
	NextBtn = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[NextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside]; 
	[NextBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"message_button"] ofType:@"png"]] forState:UIControlStateNormal];
	[NextBtn setFrame:CGRectMake(320-60,3,60,40)];
	NextBtn.hidden=YES;
	[self.view addSubview:NextBtn];
	
	
	NextBtn2 = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[NextBtn2 addTarget:self action:@selector(next2:) forControlEvents:UIControlEventTouchUpInside]; 
	[NextBtn2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"message_button"] ofType:@"png"]] forState:UIControlStateNormal];
	[NextBtn2 setFrame:CGRectMake(320-60,3,60,40)];
	NextBtn2.hidden=YES;
	[self.view addSubview:NextBtn2];
	
	
	
	SendBtn = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[SendBtn addTarget:self action:@selector(send:) forControlEvents:UIControlEventTouchUpInside]; 
	[SendBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"send_button"] ofType:@"png"]] forState:UIControlStateNormal];
	[SendBtn setFrame:CGRectMake(320*6-60,3,60,40)];
	//SendBtn.hidden=YES;
	[scrollview addSubview:SendBtn];
	
	
	
	
	//---------------------------------------------------------------------------------------------------------------------	
	c_view=[[UIView alloc] initWithFrame:CGRectMake(0, 480-48-20, 320, 48)];
	//c_view.backgroundColor=[UIColor redColor];
	//c_view.alpha=;
	[self.view addSubview:c_view];
	
	
	
	
	UIView *imageview3=[[UIView alloc]initWithFrame:CGRectMake(320*2, 0, 320, 480)];
	imageview3.backgroundColor=[UIColor blackColor];
	imageview3.alpha=0.5;
	[scrollview addSubview:imageview3];
	
	
	
	
	btn1 = [[UIButton buttonWithType:UIButtonTypeRoundedRect]retain];
	[btn1 addTarget:self action:@selector(btncamare:) forControlEvents:UIControlEventTouchUpInside];
	[btn1 setTitle:(@"照相") forState:nil]; 
	[btn1 setFrame:CGRectMake(30,150,100,100)];
	[imageview3 addSubview:btn1];
	
	btn2 = [[UIButton buttonWithType:UIButtonTypeRoundedRect]retain];
	[btn2 addTarget:self action:@selector(btnselect:) forControlEvents:UIControlEventTouchUpInside];
	[btn2 setTitle:(@"從相冊選取") forState:nil];
	[btn2 setFrame:CGRectMake(180,150,100,100)];
	[imageview3 addSubview:btn2];
	
	
	
	//c_view.hidden=YES;
	
	for (int i=0; i<6; i++) {
		btn= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
		[btn addTarget:self action:@selector(btn2:)forControlEvents:UIControlEventTouchUpInside];
		[btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"choose_postcard%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
		btn.tag=i;
		btn.frame = CGRectMake(10+i/3*(115+50)+320,(i+1)%3*(90+30)+50,140,100);
		[scrollview addSubview:btn];
	}
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar addSubview:c_I];
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next1:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	[self.view addSubview:BTN];
	
}



-(void)cut:(id)sender
{
	UIGraphicsBeginImageContext(self.view.bounds.size);     //currentView 当前的view
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGImageRef c_image = CGImageRetain(CGBitmapContextCreateImage(context));
	c_image = CGImageCreateWithImageInRect(c_image,CGRectMake(15+25, 45+20+30, 300,335-30));
	catchImage = [[UIImage alloc] initWithCGImage:c_image];
	
	
	CGImageRelease(c_image);
    UIGraphicsEndImageContext();
	
	[cut_Photo setImage:catchImage];
}



-(void)home:(id)sender
{
	[scrollview setContentOffset:CGPointMake(0,0) animated:YES];
}

-(void)next:(id)sender
{
	
	[self cut:nil];
	[scrollview setContentOffset:CGPointMake(4*320,100) animated:YES];
	
}
-(void)next2:(id)sender
{
	[scrollview setContentOffset:CGPointMake(5*320,0) animated:YES];
	TextView1.text=TextView.text;
}

-(void)back:(id)sender
{
	[scrollview setContentOffset:CGPointMake(2*320,0) animated:YES];
}
-(void)back2:(id)sender
{
	[scrollview setContentOffset:CGPointMake(3*320,0) animated:YES];
}
-(void)back3:(id)sender
{
	[scrollview setContentOffset:CGPointMake(4*320,100) animated:YES];
	TextView.text=@"";
	
}

-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}

-(void)send:(id)sender
{
	
	UIActionSheet *menu = [[[UIActionSheet alloc] initWithTitle:nil
													   delegate:self 
											  cancelButtonTitle:@"取消" 
										 destructiveButtonTitle:nil otherButtonTitles:
							@"加入相冊",@"以Facebook分享",@"以電郵分享",nil]autorelease];
	
	menu.tag = 123;
	[menu showInView:self.view];
}




-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch (buttonIndex) {
		case 0:
			NSLog(@"1");
			
			
			
		//	UIImageWriteToSavedPhotosAlbum([self emailphoto], self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
			UIImageWriteToSavedPhotosAlbum([self emailphoto], nil, nil, nil); 
			[scrollview setContentOffset:CGPointMake(320,0) animated:YES];
			
			
			break;
		case 1:
			
				NSLog(@"2");
			
			break;
		case 2:
				NSLog(@"3");
			[self showPicker];
			break;
		
			
		default:
			break;
	}
}


- (void) image:(UIImage*)image didFinishSavingWithError:(NSError *)error contextInfo:(NSDictionary*)info{
	
	[scrollview setContentOffset:CGPointMake(320,0) animated:YES];
	

	//[self.navigationController dismissModalViewControllerAnimated:YES];
}


-(void)scrollViewDidScroll:(UIScrollView *)sender {
	
	//CGFloat pageWidth = sender.frame.size.width;
	// 根据当前的x坐标和页宽度计算出当前页数
	//int shopid = floor((sender.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
	
	//pageControl.currentPage = shopid;
	if (sender.contentOffset.x==0*320.00) {
		//NSLog(@"1111111122222");
		c_view.hidden=NO;
		
	}
	else if (sender.contentOffset.x==1*320.00) {
	   //NSLog(@"1111111122222");
		c_view.hidden=YES;
		
	}
	else if (sender.contentOffset.x==2*320.00) {
		//NSLog(@"1111111122222");
		
		c_view.hidden=YES;
	}
	else if (sender.contentOffset.x==3*320.00) {
		//NSLog(@"1111111122222");
		c_view.hidden=NO;
		[TextView resignFirstResponder];
		
	}
	if (sender.contentOffset.x==3*320.00) {
		scrollview.userInteractionEnabled=NO;
		scr.hidden=NO;
		//HomeBtn.hidden=NO;
		BackBtn.hidden=NO;
		NextBtn.hidden=NO;
		
	}
	else {
		scr.hidden=YES;
		scrollview.userInteractionEnabled=YES;
		//HomeBtn.hidden=YES;
		BackBtn.hidden=YES;
		NextBtn.hidden=YES;
		
	}
	
	
	if (sender.contentOffset.x==4*320.00) {
		[TextView becomeFirstResponder];
		
		topbar3.hidden=NO;
		tittle3.hidden=NO;
		BackBtn2.hidden=NO;
		NextBtn2.hidden=NO;
		//[scrollview setContentOffset:CGPointMake(4*320,150) animated:YES];
	}
	else {
		[TextView resignFirstResponder];
		topbar3.hidden=YES;
		tittle3.hidden=YES;
		BackBtn2.hidden=YES;
		NextBtn2.hidden=YES;
	}
	
	
	if (sender.contentOffset.x<3*320.00) {
		HomeBtn.hidden=YES;
	}
	else {
		HomeBtn.hidden=NO;
	}



}





-(void)btn:(id)sender
{
	c_page=0;
	
	[scrollview setContentOffset:CGPointMake(320*(c_page+1),0) animated:YES];
	c_page++;
	//NSLog(@"%@",scrollview.contentSiz)
	
}
-(void)btn2:(UIButton *)sender
{
	int nTime = sender.tag;
	c_page=1;
	
	[c_PosterCard setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"choose_postcard%d",nTime+1] ofType:@"png"]]];
	[c_PosterCard1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"choose_postcard%d",nTime+1] ofType:@"png"]]];
	
	[scrollview setContentOffset:CGPointMake(320*(c_page+1),0) animated:YES];
	NSLog(@"%d",nTime);
	c_page++;
	
	
	
}

-(void)btnselect:(UIButton *)sender
{

	[scrollview setContentOffset:CGPointMake(320*3,0) animated:YES];
	
	UIImagePickerController * imagePickerController = [[UIImagePickerController alloc] init];
	imagePickerController.delegate = self;
	imagePickerController.sourceType = 
	UIImagePickerControllerSourceTypePhotoLibrary;
	[self.navigationController presentModalViewController:imagePickerController animated:YES];
	[imagePickerController release];
	
	//NSLog(@"111");
}

-(void)btncamare:(UIButton *)sender
{
	[scrollview setContentOffset:CGPointMake(320*3,0) animated:YES];
	
	
	
	UIImagePickerController * imagePickerController = [[UIImagePickerController alloc] init];
	imagePickerController.delegate = self;
    imagePickerController.sourceType = 
	UIImagePickerControllerSourceTypeCamera;
	[self.navigationController presentModalViewController:imagePickerController animated:YES];
	
	[imagePickerController release];
	
	
	//NSLog(@"222");
}



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissModalViewControllerAnimated:YES];
    //[picker release];
	
	UIImage * newImage = [info objectForKey:UIImagePickerControllerOriginalImage] ;
	
	self.m_pReImgData = newImage;
	
	n_ReImgX = photoImageView.frame.origin.x;
	n_ReImgY = photoImageView.frame.origin.y;
	
	n_ReImgXX = photoImageView.frame.size.width;
	n_ReImgYY = photoImageView.frame.size.height;
	
	
    photoImageView.image = newImage;
	
	//[self.view addSubview:photoImageView];
	[scrollview setContentOffset:CGPointMake(320*3,0) animated:YES];
	photoImageView.userInteractionEnabled = YES;
	//[self addGestureRecognizersToPiece:photoImageView];
	//[scrollview addSubview:photoImageView];
	
	//[self.view addSubview:scrollView];
	
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}





- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    NSLog(@"gestureRecognizer");
    // if the gesture recognizers are on different views, don't allow simultaneous recognition
    if (gestureRecognizer.view != otherGestureRecognizer.view)
        return NO;
    
    // if either of the gesture recognizers is the long press, don't allow simultaneous recognition
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]])
        return NO;
    
    return YES;
}


//email
//============================================================================================


-(void)showPicker
{	
	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
	if (mailClass != nil)
	{
		if ([mailClass canSendMail])
		{
			[self displayComposerSheet];
		}
	}
}
-(void)displayComposerSheet 
{
	pickers = [[MFMailComposeViewController alloc] init];
	pickers.mailComposeDelegate = self;
	
	//[pickers setSubject:@"HKU GE"];
	NSArray *shop_narray1 = [[NSArray alloc] initWithObjects:@"",nil];
	[pickers setToRecipients:shop_narray1];
	UIImage *drawImage = [self emailphoto];
	
	//drawImage.transform = CGAffineTransformMakeRotation(3.1415926*0.5);
	
		if(drawImage !=nil)
		{	
			NSData *myData = UIImagePNGRepresentation(drawImage);
			[pickers addAttachmentData:myData mimeType:@"image/png" fileName:@"myphoto"];
		}
	
	NSString *emailBody = @"";
	[pickers setMessageBody:emailBody isHTML:NO];
	[self presentModalViewController:pickers animated:YES];
}
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error 
{	
	// Notifies users about errors associated with the interface
	switch (result)
	{
		case MFMailComposeResultCancelled:
			NSLog(@"Result: canceled");
			break;
		case MFMailComposeResultSaved:
			NSLog(@"Result: saved");
			break;
		case MFMailComposeResultSent:
			NSLog(@"Result: sent");
			break;
		case MFMailComposeResultFailed:
			NSLog(@"Result: failed");
			break;
		default:
			NSLog(@"Result: not sent");
			break;
	}
	[self dismissModalViewControllerAnimated:YES];
	[scrollview setContentOffset:CGPointMake(320,0) animated:YES];
}


-(UIImage*)emailphoto
{
	UIGraphicsBeginImageContext(self.view.bounds.size);     //currentView 当前的view
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGImageRef image = CGImageRetain(CGBitmapContextCreateImage(context));
	image = CGImageCreateWithImageInRect(image,CGRectMake(0, 45, 320, 480-45-48-20));
    UIImage *viewImage = [UIImage imageWithCGImage:image];
	
	CGImageRelease(image);
    UIGraphicsEndImageContext();
	return viewImage;
}



//====================================================================================================





-(void)ToNews:(id)sender
{
	Product4 *c_product4view=[[Product4 alloc]initWithNibName:@"Product4" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_product4view.c_xml=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"next_level_api"]objectAtIndex:0]];
	c_product4view.c_name=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"sub_cat_name"]objectAtIndex:0]];
	//c_product3view.c_type=[[NSString alloc]initWithFormat:@"0"];
	[self.navigationController pushViewController:c_product4view animated:YES];
}

-(void)next1:(id)sender
{
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"0"];
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"0"];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
	
	
	
	
	
	
	
	
}







-(void)dxc:(NSString *)downloadfile
{
	//[myMainView startLoad2];
	//[myMainView loadingStop2];
	m_pNetWorkQueue = [[ASINetworkQueue alloc] init];
	[m_pNetWorkQueue reset];
	[m_pNetWorkQueue setDelegate:self];
	[m_pNetWorkQueue setRequestDidFinishSelector:@selector(MainMenuNetData_DownLoadFinish)];
	[m_pNetWorkQueue setRequestDidFailSelector:@selector(MainMenuNetData_DownLoadFail)];
	[m_pNetWorkQueue setMaxConcurrentOperationCount:1];
	[m_pNetWorkQueue setShouldCancelAllRequestsOnFailure:NO];
	
	
	
	
	NSLog(@"MainMenuImgPath = %@", MainMenuImgPath);
	
	//-------------------***** 初始化Request所需要的数据部分 *****-----------------------
	
	NSString *ImgLink = [[NSString alloc] initWithFormat:@"%@",downloadfile];
	
	NSURL *ImgURL = [[NSURL alloc] initWithString:ImgLink];
	
	
	NSLog(@"ImgLink = %@", ImgLink);
	
	
	ASIHTTPRequest *ImgRequest = [[ASIHTTPRequest alloc] initWithURL:ImgURL];
	
	[ImgRequest setDownloadDestinationPath:DownLpath];
	
	
	[m_pNetWorkQueue addOperation:ImgRequest];
	
	
	
	[m_pNetWorkQueue go];
}








-(void)MainMenuNetData_DownLoadFinish
{
	//[myMainView startLoad2];
	[myMainView loadingStop2];
	
	if (c_kkk==0) {
		[self VideoPlayFinish1];
		c_kkk++;
	}
	NSLog(@"down load finsh");
}

-(void)MainMenuNetData_DownLoadFail
{
	//[myMainView startLoad2];
	[myMainView loadingStop2];
	NSLog(@"down load fail");
}

#ifdef _FOR_DEBUG_
-(BOOL)respondsToSelector:(SEL)aSelector{
	
	printf("SELECTOR:%s\n",[NSStringFromSelector(aSelector)UTF8String]);
	return [super respondsToSelector:aSelector];
}
#endif


- (void)dealloc {
	
	//[scrollview release];
	[c_PosterCard release];
	//[m_pReImgData release];
	//[scr release];
	//[catchImage release];
	[c_cutPt release];
	[btn release];
	[btn1 release];
	[btn2 release];
	[topbar3 release];
    [tittle3 release];
	[TextView release];
	[c_view release];
	

	[super dealloc];
	
	
}


@end
