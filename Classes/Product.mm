//
//  Product.mm
//  New_Projects
//
//  Created by chen cool on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Product.h"
#import "MainView.h"
#import "Product2.h"
#import "Product4.h"
#import "OpenPDF.h"
#import "EnquiryViewMy.h"
#import "ASIHTTPRequest.h"



#define AppMainMenuImg_Dic	[NSHomeDirectory() stringByAppendingString:@"/Documents/"]



extern MainView *myMainView;
extern int all;
extern BOOL c_ccxml;



@implementation Product
@synthesize c_tableview;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	c_yesorno=[[NSString alloc]initWithFormat:@"0"];
	
    
	c_loading = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(76-15,40-15,30.0f,30.0f)]; 
	[c_loading setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
	c_loading.backgroundColor=[UIColor clearColor];
	
	black=[[UIImageView alloc]initWithFrame:CGRectMake(5, 45+45, 152.5, 80)];
	[black setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]]];
	
	
	
	
	c_loading2 = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(81-15,40-15,30.0f,30.0f)]; 
	[c_loading2 setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhiteLarge];
	c_loading2.backgroundColor=[UIColor clearColor];
	c_black=[[UIImageView alloc]initWithFrame:CGRectMake(162.5, 45+45, 152.5, 80)];
    
	[c_black setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]]];
	
	
	[self loaddate];
	
	
	
	//if (DataArray!=nil) {
    //		[DataArray release];
    //		DataArray=nil;
    //	}
    //	if (DataArray3!=nil) {
    //		[DataArray3 release];
    //		DataArray3=nil;
    //	}
    //	if (DataArray5!=nil) {
    //		[DataArray5 release];
    //		DataArray5=nil;
    //	}
	DataArray =[[NSMutableArray alloc] init];
	DataArray3 =[[NSMutableArray alloc] init];
	DataArray5 =[[NSMutableArray alloc] init];
    
	c_down=[[NSMutableArray alloc]init];
	c_narray=[[NSMutableArray alloc]init];
	c_narray1=[[NSMutableArray alloc]init];
	c_narray2=[[NSMutableArray alloc]init];
	
	c_narrayname1=[[NSMutableArray alloc]init];
	c_narrayname2=[[NSMutableArray alloc]init];
	c_narrayprice1=[[NSMutableArray alloc]init];
	c_narrayprice2=[[NSMutableArray alloc]init];
	c_narraypack1=[[NSMutableArray alloc]init];
	c_narraypack2=[[NSMutableArray alloc]init];
	c_narraypdf1=[[NSMutableArray alloc]init];
	c_narraypdf2=[[NSMutableArray alloc]init];
	
	
	
	
	[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];
	titles = [[NSArray alloc] initWithObjects:@"apan", @"jing", @"dong",@"land",@"eece", nil];
	
	titles2 = [[NSArray alloc] initWithObjects:@"日韓台", @"中國", @"廣東省",@"東南亞",@"長線", nil];
	titles3 = [[NSArray alloc] initWithObjects:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/Tour_2ndLevel.aspx?lang=2&cat_id=2", 
			   @"http://www.sunflower.com.hk/sf2010/iPhoneApps/Tour_2ndLevel.aspx?lang=2&cat_id=1",
			   @"http://www.sunflower.com.hk/sf2010/iPhoneApps/Tour_2ndLevel.aspx?lang=2&cat_id=5",
			   @"http://www.sunflower.com.hk/sf2010/iPhoneApps/Tour_2ndLevel.aspx?lang=2&cat_id=3",
			   @"http://www.sunflower.com.hk/sf2010/iPhoneApps/Tour_2ndLevel.aspx?lang=2&cat_id=4", nil];
	
	titles4 = [[NSArray alloc] initWithObjects:@"日本/韓國/台灣", @"北京/華東/海南島/長江三峽/..", @"惠州/中山/肇慶/番禺長隆/..",
			   @"泰國/馬星/汶萊/越南/..",@"東北歐/地中海/印度/澳洲/..", nil];
	
	
	titles21 = [[NSArray alloc] initWithObjects:@"land", @"apan", @"jing",@"eece", nil];
	titles22 = [[NSArray alloc] initWithObjects:@"東南亞", @"日韓台", @"中國",@"長線", nil];
	titles23 = [[NSArray alloc] initWithObjects:@"泰國/馬星/印尼/越南/..", @"日本/韓國/台灣", @"中國長線/廣東省/澳門/香港",@"歐洲/地中海/斐濟/澳洲/..", nil];
	titles24 = [[NSArray alloc] initWithObjects:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/Package_2ndLevel.aspx?lang=2&cat_id=6", 
				@"http://www.sunflower.com.hk/sf2010/iPhoneApps/Package_2ndLevel.aspx?lang=2&cat_id=7",
				@"http://www.sunflower.com.hk/sf2010/iPhoneApps/Package_2ndLevel.aspx?lang=2&cat_id=8",
				@"http://www.sunflower.com.hk/sf2010/iPhoneApps/Package_2ndLevel.aspx?lang=2&cat_id=9", nil];
	
	
	
	
	for (int i=0; i<[titles count]; i++) 
	{
		
		UIImage *c_Img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",[titles objectAtIndex:i]] ofType:@"png"]];
		[c_narray  addObject:c_Img];
		
		[c_down addObject:[titles3 objectAtIndex:i ]];
		[c_narray1 addObject:[titles2 objectAtIndex:i]];
		[c_narray2 addObject:[titles4 objectAtIndex:i]];
	}
	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	[self.view addSubview:topbar];
	
	
	
	
	UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"新華旅遊";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle];
	[tittle release];
	
	
	
	UIImageView *SwitchBg=[[UIImageView alloc]init];
	SwitchBg.frame=CGRectMake(0, 45, 320, 480);
	[SwitchBg setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
	
	[self.view addSubview:SwitchBg];
	[SwitchBg release];
	
	c_switch1=[[UIButton alloc]initWithFrame:CGRectMake(10, 45+8, 100, 29)];
	[c_switch1 addTarget:self action:@selector(c_switch1:)forControlEvents:UIControlEventTouchUpInside];
	c_switch1.showsTouchWhenHighlighted=YES;
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"lxtd"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"lxtd"] ofType:@"png"]] forState:UIControlStateHighlighted];
	[self.view addSubview:c_switch1];
	
	
	
	c_switch2=[[UIButton alloc]initWithFrame:CGRectMake(110, 45+8, 100, 29)];
	[c_switch2 addTarget:self action:@selector(c_switch2:)forControlEvents:UIControlEventTouchUpInside];
	c_switch2.showsTouchWhenHighlighted=YES;
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"zyx"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"zyxd"] ofType:@"png"]] forState:UIControlStateHighlighted];
	[self.view addSubview:c_switch2];
	
	c_switch3=[[UIButton alloc]initWithFrame:CGRectMake(210, 45+8, 100, 29)];
	[c_switch3 addTarget:self action:@selector(c_switch3:)forControlEvents:UIControlEventTouchUpInside];
	[c_switch3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"bzrm"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"bzrmd"] ofType:@"png"]] forState:UIControlStateHighlighted];
	
	[self.view addSubview:c_switch3];
	
	
	
	
	
	gameimage= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	//[gameimage addTarget:self action:@selector(banner1:)forControlEvents:UIControlEventTouchUpInside];
	[gameimage setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]] forState:UIControlStateNormal];
	gameimage.frame = CGRectMake(5, 45+45, 152.5, 80);
	gameimage.hidden=NO;
	[self.view addSubview:gameimage];
	
	
	
	
	gameimage1= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	//[gameimage1 addTarget:self action:@selector(banner2:)forControlEvents:UIControlEventTouchUpInside];
	[gameimage1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]] forState:UIControlStateNormal];
	gameimage1.frame = CGRectMake(162.5, 45+45, 152.5, 80);
	gameimage1.hidden=NO;
	[self.view addSubview:gameimage1];
	
	
	
	gameimage2= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	//[gameimage2 addTarget:self action:@selector(banner3:)forControlEvents:UIControlEventTouchUpInside];
	[gameimage setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]] forState:UIControlStateNormal];
	gameimage2.frame = CGRectMake(5, 45+45, 152.5, 80);
	gameimage2.hidden=YES;
	[self.view addSubview:gameimage2];
	
	
	
	
	gameimage3= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
	//[gameimage3 addTarget:self action:@selector(banner4:)forControlEvents:UIControlEventTouchUpInside];
	[gameimage1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]] forState:UIControlStateNormal];
	gameimage3.frame = CGRectMake(162.5, 45+45, 152.5, 80);
	gameimage3.hidden=YES;
	[self.view addSubview:gameimage3];
	
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar addSubview:c_I];
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	[self.view addSubview:BTN];
	
    
	[black addSubview:c_loading];
	[c_black addSubview:c_loading2];
	
	[self.view addSubview:black];
	[self.view addSubview:c_black];
	
	[self c_startLoad];
	[self c_startLoad2];
	
	
	c_hidden=[[UIImageView alloc]initWithFrame:CGRectMake(0, 45+45,320 , 480-48-45)];
	c_hidden.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	//[c_hidden setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
	
	c_hidden.hidden=YES;
	[self.view addSubview:c_hidden];
	
	
	c_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,45+45+80+3, 320, 412-45-45-80-3)];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	c_tableview.separatorColor=[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	
	[self.view addSubview:c_tableview];
	
	
	
	
	if (all==0) {
		//[self dosomething1];
		[self performSelector:@selector(dosomething1) withObject:nil afterDelay:0.5];
	}
	else {
		[self performSelector:@selector(dosomething2) withObject:nil afterDelay:0.5];
		//[self dosomething2];
	}
	
}



-(void)dosomething1
{
	m_pNetWorkQueue = [[ASINetworkQueue alloc] init];
	
	
	
	
	
	[m_pNetWorkQueue reset];
	[m_pNetWorkQueue setDelegate:self];
	[m_pNetWorkQueue setRequestDidFinishSelector:@selector(MainMenuNetData_DownLoadFinish)];
	[m_pNetWorkQueue setRequestDidFailSelector:@selector(MainMenuNetData_DownLoadFail)];
	[m_pNetWorkQueue setMaxConcurrentOperationCount:1];
	
	[m_pNetWorkQueue setShouldCancelAllRequestsOnFailure:NO];
	
	
	
	
	
	
	c_type=[[NSString alloc] initWithFormat:@"0"];
	
	
	
	
#pragma mark ffff	
	[NSThread detachNewThreadSelector:@selector(jxanddl) toTarget:self withObject:nil];
	
	
	
	[self initbtnimg];
	
	
	[self initbtn1];
	
	
	
	self.view.backgroundColor=[UIColor grayColor];
	
	
	
	
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	
	
}
-(void)dosomething2
{
	m_pNetWorkQueue = [[ASINetworkQueue alloc] init];
	
	
	self.navigationItem.title = @"新華旅遊";
	
	
	[m_pNetWorkQueue reset];
	[m_pNetWorkQueue setDelegate:self];
	[m_pNetWorkQueue setRequestDidFinishSelector:@selector(MainMenuNetData_DownLoadFinish)];
	[m_pNetWorkQueue setRequestDidFailSelector:@selector(MainMenuNetData_DownLoadFail)];
	[m_pNetWorkQueue setMaxConcurrentOperationCount:1];
	
	[m_pNetWorkQueue setShouldCancelAllRequestsOnFailure:NO];
	
	
	
	
	
	
	c_type=[[NSString alloc] initWithFormat:@"0"];
	c_down=[[NSMutableArray alloc]init];
	c_narray=[[NSMutableArray alloc]init];
	c_narray1=[[NSMutableArray alloc]init];
	c_narray2=[[NSMutableArray alloc]init];
	
	c_narrayname1=[[NSMutableArray alloc]init];
	c_narrayname2=[[NSMutableArray alloc]init];
	c_narrayprice1=[[NSMutableArray alloc]init];
	c_narrayprice2=[[NSMutableArray alloc]init];
	c_narraypack1=[[NSMutableArray alloc]init];
	c_narraypack2=[[NSMutableArray alloc]init];
	c_narraypdf1=[[NSMutableArray alloc]init];
	c_narraypdf2=[[NSMutableArray alloc]init];
	
	
	[myMainView startLoad3];
	
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil alloc] init];
	[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/Tour_1stLevel.aspx?lang=2"] :[[NSArray alloc]initWithObjects:@"area_desc",@"banner",@"cat_id",@"next_level_api",@"category_icon",@"name",nil]];
	//[XMLUtilView getErrorCode];
	
	
	
	NSLog(@"啊庞被改造%@",(c_ccxml ? @"成功":@"失败"));
	NSString *c_cg=[[NSString alloc]initWithFormat:@"%@",(c_ccxml ? @"哈哈":@"操，这么垃圾")];
	NSLog(@"%@",c_cg);
	
	
	if ([(c_ccxml ? @"成功":@"失败")isEqualToString:@"成功"]) 
	{
		
		for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"category_icon"]count]; i++) 
		{
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"category_icon"]objectAtIndex:i]];
            
            
			NSString *c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
            //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
            NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
            NSString *c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
            NSString *MainMenuImgStorePath = AppMainMenuImg_Dic;
            //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
            //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
            MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
			
			if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO)
			{
				//	NSData *data=[NSData dataWithContentsOfURL:url];
				UIImage *c_Img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]];
				[c_narray  addObject:c_Img];
				DownLpath=MainMenuImgPath;
				[self dxc:xmlurl];
			}
			else {
				//NSData *data=[NSData dataWithContentsOfURL:url];
				UIImage *c_Img=[UIImage imageWithContentsOfFile:MainMenuImgPath];
				[c_narray  addObject:c_Img];
				//[btn setImage:[UIImage imageWithContentsOfFile:MainMenuImgPath] forState:UIControlStateNormal];
				//NSLog(@"oh my god");
				//[myMainView loadingStop2];
			}
			
			
			[c_down addObject:[[XMLUtilView.tmpdic objectForKey:@"category_icon"]objectAtIndex:i]];
			[c_narray1 addObject:[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:i]];
			[c_narray2 addObject:[[XMLUtilView.tmpdic objectForKey:@"area_desc"]objectAtIndex:i]];
		}
		
		
		[m_pNetWorkQueue go];
		
		//[myMainView startLoad];
		
		if(XMLUtilView1!=nil)
		{
			[XMLUtilView1 release];
			XMLUtilView1 = nil;
		}
		XMLUtilView1 = [[XMLUtil alloc] init];
		[XMLUtilView1 xmlParserByUrl:[NSString stringWithFormat:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/banner.xml"] :[[NSArray alloc]initWithObjects:@"sub_cat_name",@"cat_id",@"next_level_api",@"banner",@"name",nil]];
		[XMLUtilView1 getErrorCode];
		[myMainView loadingStop3];
		
		
		
		
		
		
		
		UIImageView *SwitchBg=[[UIImageView alloc]init];
		SwitchBg.frame=CGRectMake(0, 0, 320, 480);
		[SwitchBg setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
		
		[self.view addSubview:SwitchBg];
		[SwitchBg release];
		
		
		
		//	}
		
		
		
		
		
		
		c_type=[[NSString alloc] initWithFormat:@"0"];
		
		
		
		
		
		for (int i=0; i<[[XMLUtilView1.tmpdic objectForKey:@"banner"]count]; i++) 
		{
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:i]];
			
            
            NSString *c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
            //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
            NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
            NSString *c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
            NSString *MainMenuImgStorePath = AppMainMenuImg_Dic;
            //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
            //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
            MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
            
			if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
				
				UIImage *c_Img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon"] ofType:@"png"]];
				[c_down  addObject:c_Img];
				DownLpath=MainMenuImgPath;
				
				[self dxc:xmlurl];
			}
			else {
				UIImage *c_Img=[UIImage imageWithContentsOfFile:MainMenuImgPath];
				[c_down  addObject:c_Img];
			}
		}
		[m_pNetWorkQueue go];
		
		
		
		
		
		NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:0]];
		NSURL *url=[NSURL URLWithString:xmlurl];
		NSData *data=[NSData dataWithContentsOfURL:url];
		// Img=[UIImage imageWithData:data];
		
		
		
		NSString *c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
        //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
        NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
        NSString *c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
        NSString *MainMenuImgStorePath = AppMainMenuImg_Dic;
        //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
        //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
        MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
        
        
		if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
			
			Img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]];
			//[c_down  addObject:c_Img];
			//DownLpath=MainMenuImgPath;
			
			//[self dxc:xmlurl];
		}
		else {
			Img=[UIImage imageWithContentsOfFile:MainMenuImgPath];
			//[c_down  addObject:c_Img];
		}
		
		
		
		
		xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:1]];
		url=[NSURL URLWithString:xmlurl];
		data=[NSData dataWithContentsOfURL:url];
		//Img1=[UIImage imageWithData:data];
		
        c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
        //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
        c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
        c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
        MainMenuImgStorePath = AppMainMenuImg_Dic;
        //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
        //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
        MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
		
		MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
		
		
		
		if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
			
			Img1=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]];
			
		}
		else {
			Img1=[UIImage imageWithContentsOfFile:MainMenuImgPath];
		}
		
		
		
		xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:2]];
		url=[NSURL URLWithString:xmlurl];
		data=[NSData dataWithContentsOfURL:url];
		//Img2=[UIImage imageWithData:data];
		
		c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
        //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
        c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
        c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
        MainMenuImgStorePath = AppMainMenuImg_Dic;
        //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
        //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
        MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
		
		
		
		if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
			
			Img2=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]];
			
		}
		else {
			Img2=[UIImage imageWithContentsOfFile:MainMenuImgPath];
		}
		
		
		
		xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:3]];
		url=[NSURL URLWithString:xmlurl];
		data=[NSData dataWithContentsOfURL:url];
		
        
        
        c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
        //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
        c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
        c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
        MainMenuImgStorePath = AppMainMenuImg_Dic;
        //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
        //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
        MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
		
		
		
		if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
			
			Img3=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]];
			
		}
		else {
			Img3=[UIImage imageWithContentsOfFile:MainMenuImgPath];
		}
		
		
		
		
		
		gameimage= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		[gameimage addTarget:self action:@selector(banner1:)forControlEvents:UIControlEventTouchUpInside];
		//[gameimage setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_product4_03"] ofType:@"png"]] forState:UIControlStateNormal];
		[gameimage setImage:Img forState:UIControlStateNormal];
		gameimage.frame = CGRectMake(5, 45, 152.5, 80);
		gameimage.hidden=NO;
		[self.view addSubview:gameimage];
		
		
		
		
		gameimage1= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		[gameimage1 addTarget:self action:@selector(banner2:)forControlEvents:UIControlEventTouchUpInside];
		//[gameimage1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_product4_05"] ofType:@"png"]] forState:UIControlStateNormal];
		[gameimage1 setImage:Img1 forState:UIControlStateNormal];
		gameimage1.frame = CGRectMake(162.5, 45, 152.5, 80);
		gameimage1.hidden=NO;
		[self.view addSubview:gameimage1];
		
		
		
		gameimage2= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		[gameimage2 addTarget:self action:@selector(banner3:)forControlEvents:UIControlEventTouchUpInside];
		//[gameimage setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_product4_03"] ofType:@"png"]] forState:UIControlStateNormal];
		[gameimage2 setImage:Img2 forState:UIControlStateNormal];
		gameimage2.frame = CGRectMake(5, 45, 152.5, 80);
		gameimage2.hidden=YES;
		[self.view addSubview:gameimage2];
		
		
		
		
		gameimage3= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		[gameimage3 addTarget:self action:@selector(banner4:)forControlEvents:UIControlEventTouchUpInside];
		//[gameimage1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_product4_05"] ofType:@"png"]] forState:UIControlStateNormal];
		[gameimage3 setImage:Img3 forState:UIControlStateNormal];
		gameimage3.frame = CGRectMake(162.5, 45, 152.5, 80);
		gameimage3.hidden=YES;
		[self.view addSubview:gameimage3];
		
		
		
		
		self.view.backgroundColor=[UIColor grayColor];
		
		
		
		
		
		
		c_hidden=[[UIImageView alloc]initWithFrame:CGRectMake(0, 45,320 , 480-48-45)];
		c_hidden.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
		//[c_hidden setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
		
		c_hidden.hidden=YES;
		[self.view addSubview:c_hidden];
		
		
		
		c_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,45+80+3, 320, 412-45-45-80-3)];
		c_tableview.delegate = self;
		c_tableview.dataSource = self;
		c_tableview.separatorColor=[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0];
		c_tableview.backgroundColor=[UIColor clearColor];
		
		[self.view addSubview:c_tableview];
	}
	else {
		NSLog(@"tab2无网络链接");
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
			[myMainView mainviewinitstate:4];
			[myMainView mainviewdelete];
			
			break;
	}
}


-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}




- (CGFloat)tableView:(UITableView *)c_tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
	if ([c_type isEqualToString:@"2"])
	{
		return 120;
	}
	else {
		return 70;
	}
    
	
	
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)c_tableview;              // Default is 1 if not implemented
{
	
	if ([c_type isEqualToString:@"2"])
	{
		if ([c_narrayname1 count]!=0&&[c_narrayname2 count]!=0) {
			return 2;
		}
		else {
			return 1;
		}
        
	}
	else {
		return 1;
	}
    
	//return [c_namenarray count];
}



- (UIView *)tableView:(UITableView *)c_tableview viewForHeaderInSection:(NSInteger)section
{
	
	UIView *view = nil;		
	if ([c_type isEqualToString:@"2"])
	{
		if(section == 0)
		{
			
			if ([c_narrayname1 count]==0&&[c_narrayname2 count]!=0) {
				view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
				view.backgroundColor = [UIColor blueColor];
				UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,320,22)];
				//c_image.backgroundColor=[UIColor whiteColor];
				[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
				[view addSubview:c_image];
				
				[c_image release];
				c_image=nil;
				
				
				
				UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
				lable1.text=@"自悠行";
				lable1.font = [UIFont boldSystemFontOfSize:17];
				lable1.textColor=[UIColor grayColor];
				lable1.backgroundColor = [UIColor clearColor];
				[view addSubview:lable1];
				[lable1 release];
				
				
				
				UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
				lable.text=@"自悠行";
				lable.font = [UIFont boldSystemFontOfSize:17];
				lable.textColor=[UIColor whiteColor];
				lable.backgroundColor = [UIColor clearColor];
				[view addSubview:lable];
				[lable release];
				lable = nil;
				
			}
			else 
			{
				view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
				//view.backgroundColor = [UIColor blueColor];
				UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,320,22)];
				//c_image.backgroundColor=[UIColor whiteColor];
				[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
				c_image.alpha=0.9;
				[view addSubview:c_image];
				
				[c_image release];
				c_image=nil;
				
				
				UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
				lable1.text=@"旅行團";
				lable1.font = [UIFont boldSystemFontOfSize:17];
				lable1.textColor=[UIColor grayColor];
				lable1.backgroundColor = [UIColor clearColor];
				[view addSubview:lable1];
				[lable1 release];
				
				
				
				UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
				lable.text=@"旅行團";
				lable.font = [UIFont boldSystemFontOfSize:17];
				lable.textColor=[UIColor whiteColor];
				lable.backgroundColor = [UIColor clearColor];
				[view addSubview:lable];
				[lable release];
				lable = nil;
			}
            
			
			
			
			
		}
		else 
		{
			view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
			//view.backgroundColor = [UIColor blueColor];
			UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,320,22)];
			//c_image.backgroundColor=[UIColor whiteColor];
			[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
			c_image.alpha=0.9;
			[view addSubview:c_image];
			
			[c_image release];
			c_image=nil;
			
			
			
			UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
			lable1.text=@"自悠行";
			lable1.font = [UIFont boldSystemFontOfSize:17];
			lable1.textColor=[UIColor grayColor];
			lable1.backgroundColor = [UIColor clearColor];
			[view addSubview:lable1];
			[lable1 release];
			
			
			
			UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
			lable.text=@"自悠行";
			lable.font = [UIFont boldSystemFontOfSize:17];
			lable.textColor=[UIColor whiteColor];
			lable.backgroundColor = [UIColor clearColor];
			[view addSubview:lable];
			[lable release];
			lable = nil;
			
			
			
			
		}
        
	}
    
	//view.alpha=0.7;	
	
	
	return view;
	
}

-(void)c_switch1:(id)sender
{
	
	[NSThread detachNewThreadSelector:@selector(switch1:) toTarget:self withObject:nil];
	
	
	
	if (c_narray!=nil) {
		[c_narray release];
		[c_narray1 release];
		[c_narray2 release];
		[c_down release];
		c_down=nil;
		c_narray=nil;
		c_narray1=nil;
		c_narray2=nil;
		c_down=[[NSMutableArray alloc]init];
		c_narray=[[NSMutableArray alloc]init];
		c_narray1=[[NSMutableArray alloc]init];
		c_narray2=[[NSMutableArray alloc]init];
	}
	
	
	
	for (int i=0; i<[titles count]; i++) 
	{
		
		UIImage *c_Img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",[titles objectAtIndex:i]] ofType:@"png"]];
		[c_narray  addObject:c_Img];
		[c_down addObject:[titles3 objectAtIndex:i]];
		//[c_down addObject:[[XMLUtilView.tmpdic objectForKey:@"category_icon"]objectAtIndex:i]];
		[c_narray1 addObject:[titles2 objectAtIndex:i]];
		[c_narray2 addObject:[titles4 objectAtIndex:i]];
	}
	
	
	
	c_hidden.hidden=YES;
	c_type=[[NSString alloc] initWithFormat:@"0"];
	
    
	
	//[c_tableview reloadData];
	gameimage.hidden=NO;
	gameimage1.hidden=NO;
	gameimage2.hidden=YES;
	gameimage3.hidden=YES;
	
	
	if(c_tableview)
	{
		[c_tableview removeFromSuperview];
		[c_tableview release];
		c_tableview = nil;
	}
	
	
	c_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,45+45+80+3, 320, 412-45-45-80-3)];
	c_tableview.delegate = self;
	if (all==0) {
		c_tableview.frame=CGRectMake(0,45+45+80+3, 320, 412-45-45-80-3);
	}
	else {
		c_tableview.frame=CGRectMake(0,45+80+3, 320, 412-45-45-80-3);
	}
	c_tableview.dataSource = self;
	c_tableview.separatorColor=[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	
	[self.view addSubview:c_tableview];
	
	
}
-(void)c_switch2:(id)sender
{
	
	[NSThread detachNewThreadSelector:@selector(switch2:) toTarget:self withObject:nil];
	
	
	
	if (c_narray!=nil) {
		[c_narray release];
		[c_narray1 release];
		[c_narray2 release];
		[c_down release];
		c_narray=nil;
		c_narray1=nil;
		c_narray2=nil;
		c_down=nil;
		c_narray=[[NSMutableArray alloc]init];
		c_narray1=[[NSMutableArray alloc]init];
		c_narray2=[[NSMutableArray alloc]init];
		c_down=[[NSMutableArray alloc]init];
	}
	
	
	for (int i=0; i<[titles21 count]; i++) 
	{
		
		UIImage *c_Img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",[titles21 objectAtIndex:i]] ofType:@"png"]];
		[c_narray  addObject:c_Img];
		
		//[c_down addObject:[[XMLUtilView.tmpdic objectForKey:@"category_icon"]objectAtIndex:i]];
		[c_narray1 addObject:[titles22 objectAtIndex:i]];
		[c_narray2 addObject:[titles23 objectAtIndex:i]];
		[c_down addObject:[titles24 objectAtIndex:i ]];
	}
	
	
    
	
	c_type=[[NSString alloc] initWithFormat:@"1"];
	//[c_tableview reloadData];
	
	gameimage.hidden=YES;
	gameimage1.hidden=YES;
	gameimage2.hidden=NO;
	gameimage3.hidden=NO;
	c_hidden.hidden=YES;
	
	
	if(c_tableview)
	{
		[c_tableview removeFromSuperview];
		[c_tableview release];
		c_tableview = nil;
	}
	
	
	c_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,45+45+80+3, 320, 412-45-45-80-3)];
	c_tableview.delegate = self;
	if (all==0) {
		c_tableview.frame=CGRectMake(0,45+45+80+3, 320, 412-90-80-3);
	}
	else {
		c_tableview.frame=CGRectMake(0,45+80+3, 320, 412-45-45-80-3);
	}
	c_tableview.dataSource = self;
	c_tableview.separatorColor=[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	
	[self.view addSubview:c_tableview];
	
}
-(void)c_switch3:(id)sender
{
	
	[NSThread detachNewThreadSelector:@selector(switch3:) toTarget:self withObject:nil];
	
	[myMainView startLoad];
	
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil alloc] init];
	[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/Theme.aspx?sub_cat_id=1"] :[[NSArray alloc]initWithObjects:@"package_code",@"package_type",@"package_name",@"package_desc",@"package_startup_price",@"package_pdf_path",@"package_region",@"package_area",nil]];
	[XMLUtilView getErrorCode];
	[myMainView loadingStop];
	
	
	
	if (c_narraypdf1!=nil) {
		[c_narrayname1 release];
		c_narrayname1=nil;
		c_narrayname1=[[NSMutableArray alloc]init];
		[c_narrayprice1 release];
		c_narrayprice1=nil;
		c_narrayprice1=[[NSMutableArray alloc]init];
		[c_narraypack1 release];
		c_narraypack1=nil;
		c_narraypack1=[[NSMutableArray alloc]init];
		[c_narraypdf1 release];
		c_narraypdf1=nil;
		c_narraypdf1=[[NSMutableArray alloc]init];
		[c_narrayname2 release];
		c_narrayname2=nil;
		c_narrayname2=[[NSMutableArray alloc]init];
		[c_narrayprice2 release];
		c_narrayprice2=nil;
		c_narrayprice2=[[NSMutableArray alloc]init];
		[c_narraypack2 release];
		c_narraypack2=nil;
		c_narraypack2=[[NSMutableArray alloc]init];
		[c_narraypdf2 release];
		c_narraypdf2=nil;
		c_narraypdf2=[[NSMutableArray alloc]init];
	}
	
	
	
	
	
	for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"package_name"]count]; i++) 
	{
		NSString *name= [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:i]];
		NSString *price= [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:i]];
		NSString *pack= [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_code"]objectAtIndex:i]];
		NSString *pdf= [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_pdf_path"]objectAtIndex:i]];
		
		if ([[[XMLUtilView.tmpdic objectForKey:@"package_type"]objectAtIndex:i] isEqualToString:@"tour"])
		{
			
			
			[c_narrayname1  addObject:name];
			[c_narrayprice1  addObject:price];
			[c_narraypack1  addObject:pack];
			[c_narraypdf1  addObject:pdf];
		}
		else {
			
			[c_narrayname2  addObject:name];
			[c_narrayprice2  addObject:price];
			[c_narraypack2  addObject:pack];
			[c_narraypdf2  addObject:pdf];
		}
		
	}
	
	
	
	c_hidden.hidden=NO;
	
	
    
	gameimage.hidden=YES;
	gameimage1.hidden=YES;
	gameimage2.hidden=YES;
	gameimage3.hidden=YES;
	
	c_type=[[NSString alloc] initWithFormat:@"2"];
	//[c_tableview reloadData];
	
	
	if(c_tableview)
	{
		[c_tableview removeFromSuperview];
		[c_tableview release];
		c_tableview = nil;
	}
	
	
	c_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,45+45+80+3, 320, 412-45-45-80-3)];
	c_tableview.delegate = self;
	if (all==0) {
		c_tableview.frame=CGRectMake(0,45+45, 320, 412-45-45);
	}
	else {
		c_tableview.frame=CGRectMake(0,45, 320, 412-45-45);
	}
	c_tableview.dataSource = self;
	c_tableview.separatorColor=[UIColor colorWithRed:219.0/255.0 green:219.0/255.0 blue:219.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	
	[self.view addSubview:c_tableview];
}


-(void)switch1:(id)sender
{
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"lxtd"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"zyx"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"bzrm"] ofType:@"png"]] forState:UIControlStateNormal];
	
}
-(void)switch2:(id)sender
{
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"lxt"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"zyxd"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"bzrm"] ofType:@"png"]] forState:UIControlStateNormal];
	
}
-(void)switch3:(id)sender
{
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"lxt"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"zyx"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"bzrmd"] ofType:@"png"]] forState:UIControlStateNormal];
    
}



- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
	[cell setSelected:NO];
	if ([c_type isEqualToString:@"2"])
	{
		
		
		
		OpenPDF *c_open=[[OpenPDF alloc]initWithNibName:@"OpenPDF" bundle:nil];
		if (indexPath.section==0) {
			if ([c_narrayname1 count]==0&&[c_narrayname2 count]!=0) 
			{
				c_open.c_xml=[[NSString alloc]initWithFormat:@"%@",[c_narraypdf2 objectAtIndex:indexPath.row]];
				c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[c_narrayname2 objectAtIndex:indexPath.row]];
				c_open.c_price=[[NSString alloc]initWithFormat:@"%@",[c_narrayprice2 objectAtIndex:indexPath.row]];
				c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[c_narraypack2 objectAtIndex:indexPath.row]];
				c_open.c_type=[[NSString alloc]initWithFormat:@"1"];
			}
			else {
				c_open.c_xml=[[NSString alloc]initWithFormat:@"%@",[c_narraypdf1 objectAtIndex:indexPath.row]];
				c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[c_narrayname1 objectAtIndex:indexPath.row]];
				c_open.c_price=[[NSString alloc]initWithFormat:@"%@",[c_narrayprice1 objectAtIndex:indexPath.row]];
				c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[c_narraypack1 objectAtIndex:indexPath.row]];
				c_open.c_type=[[NSString alloc]initWithFormat:@"0"];
			}
		}
		else if(indexPath.section==1)
		{
			c_open.c_xml=[[NSString alloc]initWithFormat:@"%@",[c_narraypdf2 objectAtIndex:indexPath.row]];
			c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[c_narrayname2 objectAtIndex:indexPath.row]];
			c_open.c_price=[[NSString alloc]initWithFormat:@"%@",[c_narrayprice2 objectAtIndex:indexPath.row]];
			c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[c_narraypack2 objectAtIndex:indexPath.row]];
			c_open.c_type=[[NSString alloc]initWithFormat:@"1"];
		}
		
        
		
		[self.navigationController pushViewController:c_open animated:YES];
	}
	else 
	{
		NSLog(@"%d   %@",indexPath.row,self.navigationController);
		Product2 *c_product2view=[[Product2 alloc]initWithNibName:@"Product2" bundle:nil];
		//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
		c_product2view.c_xml=[[NSString alloc]initWithFormat:@"%@",[c_down objectAtIndex:indexPath.row]];
		c_product2view.c_name=[[NSString alloc]initWithFormat:@"%@",[c_narray1 objectAtIndex:indexPath.row]];
		c_product2view.c_type=[[NSString alloc]initWithFormat:@"%@",c_type];
		[self.navigationController pushViewController:c_product2view animated:YES];
		//[self.view addSubview:c_product2view.view];
		//[self.navigationController presentModalViewController:c_product2view animated:YES];
	}
    
	
	
}





-(NSInteger)tableView:(UITableView *)c_tableview numberOfRowsInSection:(NSInteger)section
{
	if ([c_type isEqualToString:@"2"])
	{
		if (section==0) {
			return [c_narrayname1 count];
		}
		else {
			return [c_narrayname2 count];
		}
        
	}
	else {
		//return [[XMLUtilView.tmpdic objectForKey:@"name"]count];
		return [c_narray count];
	}
    
	
}


- (UITableViewCell *)tableView:(UITableView *)c_tv
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
	
	//static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	NSString *SimpleTableIdentifier = [[NSString alloc] initWithFormat:@"SimpleTableIdentifier_%d_%d", indexPath.row, indexPath.section];
	
	UITableViewCell *cell = [c_tableview dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	
	
    
    if ([c_type isEqualToString:@"2"]) {
        
        if (indexPath.section==0) {
            if (cell == nil) {
                CGRect cellFrame = CGRectMake(0,0,320,65);
                cell = [[[UITableViewCell alloc] initWithFrame:cellFrame
                                               reuseIdentifier:SimpleTableIdentifier] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleGray;
                
                
                
                
				UIImageView *IMG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
			    [IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
				IMG.alpha=0.5;
				[cell.contentView addSubview:IMG];
				[IMG release];
				IMG=nil;
                
                
                
                NSString *c_ls=[[NSString alloc]init];
                c_ls = [[c_narrayname1 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,5)];
                NSLog(@"%@and this%@",c_ls,[c_narrayname1 objectAtIndex:indexPath.row]);
                if ([c_ls isEqualToString:@"<font"]) {
                    if ([[c_narrayname1 objectAtIndex:indexPath.row] length]>54+23) {
                        c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......",[[c_narrayname1 objectAtIndex:indexPath.row]substringWithRange:NSMakeRange(16,54)]];
                        
                    }
                    else {
                        c_NSST=[[NSString alloc]initWithFormat:@"%@",[c_narrayname1 objectAtIndex:indexPath.row]];
                        
                    }
                }
                else {
                    if ([[c_narrayname1 objectAtIndex:indexPath.row] length]>54) {
                        c_NSST=[[NSString alloc]initWithFormat:@"%@......",[[c_narrayname1 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,54)]];
                        
                    }
                    else {
                        c_NSST=[[NSString alloc]initWithFormat:@"%@",[c_narrayname1 objectAtIndex:indexPath.row]];
                        
                    }
                    
                }
                
				UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
				//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:indexPath.row];
				c_textview.text=[[NSString alloc]initWithFormat:@"%@",c_NSST];
				[cell.contentView addSubview:c_textview];
				c_textview.backgroundColor=[UIColor clearColor];
				c_textview.userInteractionEnabled=NO;
				c_textview.textAlignment = UITextAlignmentLeft;
				c_textview.font = [UIFont boldSystemFontOfSize:15];
				[c_textview release];
				c_textview=nil;
                
                
				UITextView *c_textview2=[[UITextView alloc]initWithFrame:CGRectMake(0, 10, 240, 120)];
                
				c_textview2.text=[[NSString alloc]initWithFormat:@"\n\n\n\n「%@」",[c_narraypack1 objectAtIndex:indexPath.row]];
				[cell.contentView addSubview:c_textview2];
				c_textview2.backgroundColor=[UIColor clearColor];
				c_textview2.userInteractionEnabled=NO;
				c_textview2.textAlignment = UITextAlignmentLeft;
				c_textview2.font = [UIFont boldSystemFontOfSize:15];
				[c_textview2 release];
				c_textview2=nil;	
                
                
                UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
                [C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
                //topbar.backgroundColor = [UIColor lightGrayColor];
                [cell.contentView addSubview:C_IMG];
                [C_IMG release];
                C_IMG=nil;
				
				if ([[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row]intValue]!=0) 
				{
					UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
					//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
					c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[c_narrayprice1 objectAtIndex:indexPath.row]intValue]];
					[cell.contentView addSubview:c_textview1];
					c_textview1.backgroundColor=[UIColor clearColor];
					c_textview1.userInteractionEnabled=NO;
					c_textview1.textAlignment = UITextAlignmentLeft;
					c_textview1.font = [UIFont boldSystemFontOfSize:15];
					[c_textview1 release];
					c_textview1=nil;
				}
            }
            
        }
        else {
            
            if (cell == nil) {
                CGRect cellFrame = CGRectMake(0,0,320,65);
                cell = [[[UITableViewCell alloc] initWithFrame:cellFrame
                                               reuseIdentifier:SimpleTableIdentifier] autorelease];
                cell.selectionStyle = UITableViewCellSelectionStyleGray;
				
                UIImageView *IMG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
                //IMG.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
                [IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
                IMG.alpha=0.5;
                [cell.contentView addSubview:IMG];
                [IMG release];
                IMG=nil;
                
                
                
                NSString *c_ls=[[NSString alloc]init];
                c_ls = [[c_narrayname2 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,5)];
                NSLog(@"%@and this%@",c_ls,[c_narrayname2 objectAtIndex:indexPath.row]);
                if ([c_ls isEqualToString:@"<font"]) {
                    if ([[c_narrayname2 objectAtIndex:indexPath.row] length]>50+23) {
                        c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......",[[c_narrayname2 objectAtIndex:indexPath.row]substringWithRange:NSMakeRange(16,50)]];
                        
                    }
                    else {
                        c_NSST=[[NSString alloc]initWithFormat:@"%@",[c_narrayname2 objectAtIndex:indexPath.row]];
                        
                    }
                }
                else {
                    if ([[c_narrayname2 objectAtIndex:indexPath.row] length]>50) {
                        c_NSST=[[NSString alloc]initWithFormat:@"%@......",[[c_narrayname2 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,50)]];
                        
                    }
                    else {
                        c_NSST=[[NSString alloc]initWithFormat:@"%@",[c_narrayname2 objectAtIndex:indexPath.row]];
                        
                    }
                    
                }
                
                
				UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
				c_textview.text=[[NSString alloc]initWithFormat:@"%@",c_NSST];
				[cell.contentView addSubview:c_textview];
				c_textview.backgroundColor=[UIColor clearColor];
				c_textview.userInteractionEnabled=NO;
				c_textview.textAlignment = UITextAlignmentLeft;
				c_textview.font = [UIFont boldSystemFontOfSize:15];
				[c_textview release];
				c_textview=nil;
                
                
                
				UITextView *c_textview2=[[UITextView alloc]initWithFrame:CGRectMake(0, 10, 240, 120)];
                
				c_textview2.text=[[NSString alloc]initWithFormat:@"\n\n\n\n「%@」",[c_narraypack2 objectAtIndex:indexPath.row]];
				[cell.contentView addSubview:c_textview2];
				c_textview2.backgroundColor=[UIColor clearColor];
				c_textview2.userInteractionEnabled=NO;
				c_textview2.textAlignment = UITextAlignmentLeft;
				c_textview2.font = [UIFont boldSystemFontOfSize:15];
				[c_textview2 release];
				c_textview2=nil;
				
				
				if ([[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row]intValue]!=0) {
					UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
					//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
					c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[c_narrayprice2 objectAtIndex:indexPath.row]intValue]];
					[cell.contentView addSubview:c_textview1];
					c_textview1.backgroundColor=[UIColor clearColor];
					c_textview1.userInteractionEnabled=NO;
					c_textview1.textAlignment = UITextAlignmentLeft;
					c_textview1.font = [UIFont boldSystemFontOfSize:15];
					[c_textview1 release];
					c_textview1=nil;
				}
				
			}
            
			
			
			
			
			
			UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
			[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
			//topbar.backgroundColor = [UIColor lightGrayColor];
			[cell.contentView addSubview:C_IMG];
			[C_IMG release];
			C_IMG=nil;
            
        }
    }
    else {
        if (cell == nil) {
            CGRect cellFrame = CGRectMake(0,0,320,65);
            cell = [[[UITableViewCell alloc] initWithFrame:cellFrame
                                           reuseIdentifier:SimpleTableIdentifier] autorelease];
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            
            
            UIImageView *IMG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 70)];
            //IMG.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
            [IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
            IMG.alpha=0.5;
            [cell.contentView addSubview:IMG];
            [IMG release];
            IMG=nil;
            
            
			UIImageView *c_image=[[UIImageView alloc]initWithImage:[c_narray objectAtIndex:indexPath.row]];
			c_image.frame=CGRectMake(5, 0, 100, 70);
			c_image.backgroundColor=[UIColor clearColor];    
			[cell.contentView addSubview:c_image];
			[c_image release];
			c_image=nil;
			
			UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(70+50, 00, 260, 60)];
			//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:indexPath.row];
			c_textview.text=[c_narray1 objectAtIndex:indexPath.row];
			[cell.contentView addSubview:c_textview];
			c_textview.backgroundColor=[UIColor clearColor];
			c_textview.userInteractionEnabled=NO;
			//c_textview.font = [UIFont systemFontOfSize:18];
		    c_textview.font=[UIFont boldSystemFontOfSize:20];
			[c_textview release];
			c_textview=nil;
			
			
			UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(70+50, 32, 260, 60)];
			//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"area_desc"]objectAtIndex:indexPath.row];
			c_textview1.text=[c_narray2 objectAtIndex:indexPath.row];
			[cell.contentView addSubview:c_textview1];
			c_textview1.backgroundColor=[UIColor clearColor];
			c_textview1.textColor=[UIColor grayColor];
			c_textview1.userInteractionEnabled=NO;
			c_textview1.alpha=1.0;
			//c_textview.font = [UIFont systemFontOfSize:18];
		    c_textview1.font=[UIFont boldSystemFontOfSize:12];
			[c_textview1 release];
			c_textview1=nil;
			
			
			UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(280, 15, 25*0.6, 38*0.6)];
			[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
			//topbar.backgroundColor = [UIColor lightGrayColor];
			[cell.contentView addSubview:C_IMG];
			[C_IMG release];
			C_IMG=nil;
            
        }
    }
	
	[SimpleTableIdentifier release];
	SimpleTableIdentifier = nil;
	
	return cell;
}


-(void)banner1:(id)sender
{
	NSLog(@"1");
    
	Product4 *c_product4view=[[Product4 alloc]initWithNibName:@"Product4" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	//c_product4view.c_xml=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"next_level_api"]objectAtIndex:0]];
	c_product4view.c_xml=[[NSString alloc]initWithFormat:@"%@",[DataArray6 objectAtIndex:0]];
	c_product4view.c_name=[[NSString alloc]initWithFormat:@"%@",[DataArray4
																 objectAtIndex:0]];
	//c_product4view.c_name=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"sub_cat_name"]objectAtIndex:0]];
	//c_product3view.c_type=[[NSString alloc]initWithFormat:@"0"];
	[self.navigationController pushViewController:c_product4view animated:YES];
}
-(void)banner2:(id)sender
{NSLog(@"2");
    
	Product4 *c_product4view=[[Product4 alloc]initWithNibName:@"Product4" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	//c_product4view.c_xml=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"next_level_api"]objectAtIndex:1]];
	//c_product4view.c_name=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"sub_cat_name"]objectAtIndex:1]];
	//c_product3view.c_type=[[NSString alloc]initWithFormat:@"0"];
	c_product4view.c_xml=[[NSString alloc]initWithFormat:@"%@",[DataArray6 objectAtIndex:1]];
	c_product4view.c_name=[[NSString alloc]initWithFormat:@"%@",[DataArray4 objectAtIndex:1]];
	[self.navigationController pushViewController:c_product4view animated:YES];
}
-(void)banner3:(id)sender
{NSLog(@"3");
	Product4 *c_product4view=[[Product4 alloc]initWithNibName:@"Product4" bundle:nil];
	//c_product4view.c_xml=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"next_level_api"]objectAtIndex:2]];
	//c_product4view.c_name=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"sub_cat_name"]objectAtIndex:2]];
	c_product4view.c_xml=[[NSString alloc]initWithFormat:@"%@",[DataArray6 objectAtIndex:2]];
	c_product4view.c_name=[[NSString alloc]initWithFormat:@"%@",[DataArray4 objectAtIndex:2]];
	[self.navigationController pushViewController:c_product4view animated:YES];
}
-(void)banner4:(id)sender
{NSLog(@"4");
    
	Product4 *c_product4view=[[Product4 alloc]initWithNibName:@"Product4" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	//c_product4view.c_xml=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"next_level_api"]objectAtIndex:3]];
	//c_product4view.c_name=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"sub_cat_name"]objectAtIndex:3]];
	c_product4view.c_xml=[[NSString alloc]initWithFormat:@"%@",[DataArray6 objectAtIndex:3]];
	c_product4view.c_name=[[NSString alloc]initWithFormat:@"%@",[DataArray4 objectAtIndex:3]];
	[self.navigationController pushViewController:c_product4view animated:YES];
}



-(void)next:(id)sender
{
	
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"1"];
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"0"];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
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



-(void)dxc:(NSString *)downloadfile
{
	//[myMainView startLoad2];
	//[myMainView loadingStop2];
	
    
	
	
	
	
	NSLog(@"MainMenuImgPath = %@", MainMenuImgPath);
	
	//-------------------***** 初始化Request所需要的数据部分 *****-----------------------
	
	NSString *ImgLink = [[NSString alloc] initWithFormat:@"%@",downloadfile];
	
	NSURL *ImgURL = [[NSURL alloc] initWithString:ImgLink];
	
	
	NSLog(@"ImgLink = %@", ImgLink);
	
	
	ASIHTTPRequest *ImgRequest = [[ASIHTTPRequest alloc] initWithURL:ImgURL];
	
	[ImgRequest setDownloadDestinationPath:DownLpath];
	
	
	[m_pNetWorkQueue addOperation:ImgRequest];
	
	//c_down
	
	
	
	
}



-(void)MainMenuNetData_DownLoadFinish
{
	//[myMainView startLoad2];
	[myMainView loadingStop2];
    
	if (all==0) {
		
		
		[self savedate];
		[self loaddate];
		
		[self initbtnimg];
		
		
		[self initbtn1];
	}
	
	[self c_loadingStop];
	[self c_loadingStop2];
	
	
	
	
	
	
	
	NSLog(@"down load finsh");
}

-(void)MainMenuNetData_DownLoadFail
{
	//[myMainView startLoad2];
	[myMainView loadingStop2];
	NSLog(@"down load fail");
}


-(void)initbtnimg
{
	if (DataArray2!=nil) {
		Img=[UIImage imageWithContentsOfFile:[DataArray2 objectAtIndex:0]];
		Img1=[UIImage imageWithContentsOfFile:[DataArray2 objectAtIndex:1]];
		Img2=[UIImage imageWithContentsOfFile:[DataArray2 objectAtIndex:2]];
		Img3=[UIImage imageWithContentsOfFile:[DataArray2 objectAtIndex:3]];
	}
	else {
		if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] != NO)
		{
			
			if ([[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:0]) {
				
				
				
				NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:0]];
				NSURL *url=[NSURL URLWithString:xmlurl];
				NSData *data=[NSData dataWithContentsOfURL:url];
				// Img=[UIImage imageWithData:data];
				
				
                NSString *c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
                //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
                NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
                NSString *c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
                NSString * MainMenuImgStorePath = AppMainMenuImg_Dic;
                //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
                //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
                MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
                
				
				if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
					
					Img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]];
					
				}
				else {
					Img=[UIImage imageWithContentsOfFile:MainMenuImgPath];
					[self c_loadingStop];
					[self c_loadingStop2];
				}
				
				
				
				
				xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:1]];
				url=[NSURL URLWithString:xmlurl];
				data=[NSData dataWithContentsOfURL:url];
				
				c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
                //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
                c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
                c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
                MainMenuImgStorePath = AppMainMenuImg_Dic;
                //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
                //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
                MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
                
				
				
				if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
					
					Img1=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]];
					
				}
				else {
					Img1=[UIImage imageWithContentsOfFile:MainMenuImgPath];
					[self c_loadingStop];
					[self c_loadingStop2];
					
				}
				
				
				
				xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:2]];
				url=[NSURL URLWithString:xmlurl];
				data=[NSData dataWithContentsOfURL:url];
				//Img2=[UIImage imageWithData:data];
				
				c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
                //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
                c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
                c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
                MainMenuImgStorePath = AppMainMenuImg_Dic;
                //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
                //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
                MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
                
				
				
				if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
					
					Img2=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]];
					
				}
				else {
					Img2=[UIImage imageWithContentsOfFile:MainMenuImgPath];
					//[c_down  addObject:c_Img];
					[self c_loadingStop];
					[self c_loadingStop2];
				}
				
				
				
				xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:3]];
				url=[NSURL URLWithString:xmlurl];
				data=[NSData dataWithContentsOfURL:url];
				//Img3=[UIImage imageWithData:data];
				
                c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
                //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
                c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
                c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
                MainMenuImgStorePath = AppMainMenuImg_Dic;
                //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
                //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
                MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
                
				
				if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
					
					Img3=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"c_bg2"] ofType:@"png"]];
					
				}
				else {
					Img3=[UIImage imageWithContentsOfFile:MainMenuImgPath];
					//[c_down  addObject:c_Img];
					[self c_loadingStop];
					[self c_loadingStop2];
				}
			}
		}
		
		else {
			NSLog(@"fsjflsjdlfs");
		}
	}
    
	
    
    
}

-(void)initbtn1
{
	
	[gameimage setImage:Img forState:UIControlStateNormal];
	gameimage.hidden=NO;
	
	
	
	
	[gameimage1 setImage:Img1 forState:UIControlStateNormal];
	gameimage1.hidden=NO;
	
	
	
	
	[gameimage2 setImage:Img2 forState:UIControlStateNormal];
	
	gameimage2.hidden=YES;
	//[self.view addSubview:gameimage2];
	
	
	
	
	[gameimage3 setImage:Img3 forState:UIControlStateNormal];
	gameimage3.hidden=YES;
    
	
	
	
	
}





-(void)c_loadingAnimation:(id)arg{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	//[self.view addSubview:black];
	[c_loading startAnimating];
	black.hidden = NO;
	[pool release];
}
-(void)c_loadingStop
{
	[c_loading stopAnimating];  
	black.hidden = YES;
}
-(void)c_startLoad
{
	[NSThread detachNewThreadSelector:@selector(c_loadingAnimation:) toTarget:self withObject:nil];
}


-(void)c_loadingAnimation2:(id)arg{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	[c_loading2 startAnimating];
	c_black.hidden = NO;
	[pool release];
}
-(void)c_loadingStop2
{
	[c_loading2 stopAnimating];  
	c_black.hidden = YES;
}
-(void)c_startLoad2
{
	[NSThread detachNewThreadSelector:@selector(c_loadingAnimation2:) toTarget:self withObject:nil];
}


-(void)jxanddl
{
	//if (pool!=nil) {
    //		[pool release];
    //		pool=nil;
    //	}
	//NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	if (DataArray2==nil) {
		if(XMLUtilView1!=nil)
		{
			[XMLUtilView1 release];
			XMLUtilView1 = nil;
		}
		XMLUtilView1 = [[XMLUtil alloc] init];
		[XMLUtilView1 xmlParserByUrl:[NSString stringWithFormat:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/banner.xml"] :[[NSArray alloc]initWithObjects:@"sub_cat_name",@"cat_id",@"next_level_api",@"banner",@"name",nil]];
		[XMLUtilView1 getErrorCode];
		
		
		
		
		
		for (int i=0; i<[[XMLUtilView1.tmpdic objectForKey:@"banner"]count]; i++) 
		{
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:i]];
			
            NSString *c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
            //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
            NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
            NSString *c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
            NSString *MainMenuImgStorePath = AppMainMenuImg_Dic;
            //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
            //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
            MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
			
            
            
			[DataArray addObject:MainMenuImgPath];
			[DataArray3 addObject:[[XMLUtilView1.tmpdic objectForKey:@"sub_cat_name"]objectAtIndex:i]];
			[DataArray5 addObject:[[XMLUtilView1.tmpdic objectForKey:@"next_level_api"]objectAtIndex:i]];
			
			if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
				
				UIImage *c_Img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]];
				[c_down  addObject:c_Img];
				DownLpath=MainMenuImgPath;
				
				[self dxc:xmlurl];
			}
			else {
				UIImage *c_Img=[UIImage imageWithContentsOfFile:MainMenuImgPath];
				[c_down  addObject:c_Img];
			}
		}
		[m_pNetWorkQueue go];
		
		
		[self initbtnimg];
		[self initbtn1];
		
		[gameimage addTarget:self action:@selector(banner1:)forControlEvents:UIControlEventTouchUpInside];
		[gameimage1 addTarget:self action:@selector(banner2:)forControlEvents:UIControlEventTouchUpInside];
		[gameimage2 addTarget:self action:@selector(banner3:)forControlEvents:UIControlEventTouchUpInside];
		[gameimage3 addTarget:self action:@selector(banner4:)forControlEvents:UIControlEventTouchUpInside];
	}
	else {
		[self initbtnimg];
		[self initbtn1];
		
		
		[self c_loadingStop];
		[self c_loadingStop2];
		
		
		[NSThread detachNewThreadSelector:@selector(ddjx) toTarget:self withObject:nil];
		
		[gameimage addTarget:self action:@selector(banner1:)forControlEvents:UIControlEventTouchUpInside];
		[gameimage1 addTarget:self action:@selector(banner2:)forControlEvents:UIControlEventTouchUpInside];
		[gameimage2 addTarget:self action:@selector(banner3:)forControlEvents:UIControlEventTouchUpInside];
		[gameimage3 addTarget:self action:@selector(banner4:)forControlEvents:UIControlEventTouchUpInside];
	}
    
	
	//[pool release];
	//pool = nil;
}


-(void)ddjx
{
	//NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	
	if(XMLUtilView1!=nil)
	{
		[XMLUtilView1 release];
		XMLUtilView1 = nil;
	}
	XMLUtilView1 = [[XMLUtil alloc] init];
	[XMLUtilView1 xmlParserByUrl:[NSString stringWithFormat:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/banner.xml"] :[[NSArray alloc]initWithObjects:@"sub_cat_name",@"cat_id",@"next_level_api",@"banner",@"name",nil]];
	//[XMLUtilView1 getErrorCode];
	
	
	NSLog(@"啊庞被改造%@",(c_ccxml ? @"成功":@"失败"));
	NSString *c_cg=[[NSString alloc]initWithFormat:@"%@",(c_ccxml ? @"哈哈":@"操，这么垃圾")];
	NSLog(@"%@",c_cg);
	
	
	if ([(c_ccxml ? @"成功":@"失败")isEqualToString:@"成功"]) 
	{
		for (int i=0; i<[[XMLUtilView1.tmpdic objectForKey:@"banner"]count]; i++) {
			
			
			
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:i]];
			
            
            NSString *c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
            //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
            NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
            NSString *c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
            NSString *MainMenuImgStorePath = AppMainMenuImg_Dic;
            //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
            //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
            MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
			
			
			if ([c_yesorno isEqualToString:@"1"]) {
				c_yesorno=[[NSString alloc]initWithFormat:@"1"];
			}
			else {
				
				if ([[DataArray2 objectAtIndex:i] isEqualToString:MainMenuImgPath]) {
					NSLog(@"1");
				}
				else {
					c_yesorno=[[NSString alloc]initWithFormat:@"1"];
				}
				
				if ([[DataArray4 objectAtIndex:i] isEqualToString:[[XMLUtilView1.tmpdic objectForKey:@"sub_cat_name"]objectAtIndex:i]]) {
					NSLog(@"2");
				}
				else {
					c_yesorno=[[NSString alloc]initWithFormat:@"1"];
				}
				
				if ([[DataArray6 objectAtIndex:i] isEqualToString:[[XMLUtilView1.tmpdic objectForKey:@"next_level_api"]objectAtIndex:i]]) {
					NSLog(@"3");
				}
				else {
					c_yesorno=[[NSString alloc]initWithFormat:@"1"];
				}
				
			}
			
		}
		
		
		if ([c_yesorno isEqualToString:@"1"]) {
			for (int i=0; i<[[XMLUtilView1.tmpdic objectForKey:@"banner"]count]; i++) 
			{
				NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView1.tmpdic objectForKey:@"banner"]objectAtIndex:i]];
				
                
                NSString *c_pdf = [[NSString alloc]initWithFormat:@"%@",xmlurl];
                //NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-8,4)];
                NSString *c_pdfnow = [c_pdf substringWithRange:NSMakeRange(51,[c_pdf length]-51)];
                NSString *c_kzm = [c_pdf substringWithRange:NSMakeRange([c_pdf length]-3, 3)];
                NSString *MainMenuImgStorePath = AppMainMenuImg_Dic;
                //"http://www.sunflower.com.hk/images/iphoneapps/area/banner_fit1_22122011a.png",
                //MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@.%@",MainMenuImgStorePath,c_pdfnow,c_kzm];
                MainMenuImgPath = [[NSString alloc] initWithFormat:@"%@%@",MainMenuImgStorePath,c_pdfnow];
                
                
				[DataArray addObject:MainMenuImgPath];
				[DataArray3 addObject:[[XMLUtilView1.tmpdic objectForKey:@"sub_cat_name"]objectAtIndex:i]];
				[DataArray5 addObject:[[XMLUtilView1.tmpdic objectForKey:@"next_level_api"]objectAtIndex:i]];
				
				if([[NSFileManager defaultManager] fileExistsAtPath:MainMenuImgPath] == NO){
					
					UIImage *c_Img=[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]];
					[c_down  addObject:c_Img];
					DownLpath=MainMenuImgPath;
					
					[self dxc:xmlurl];
				}
				else {
					UIImage *c_Img=[UIImage imageWithContentsOfFile:MainMenuImgPath];
					[c_down  addObject:c_Img];
				}
			}
			[m_pNetWorkQueue go];
			NSLog(@"有更新");
			
			[self initbtnimg];
			[self initbtn1];
		}
		else {
			NSLog(@"无更新");
		}
        
	} else {
		NSLog(@"tab2沒網絡連接");
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
    
	
	
	
    
	
	//[pool release];
	//pool = nil;
	
}

-(void)loaddate
{
	if (DataArray2!=nil) {
		[DataArray2 release];
		DataArray2=nil;
	}
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path=[paths    objectAtIndex:0];
	NSString *filename=[path stringByAppendingPathComponent:@"c_img.plist"];
	DataArray2=[[NSMutableArray alloc] initWithContentsOfFile:filename];
	
	if (DataArray4!=nil) {
		[DataArray4 release];
		DataArray4=nil;
	}
	paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	path=[paths    objectAtIndex:0];
	filename=[path stringByAppendingPathComponent:@"c_namelist.plist"];
	DataArray4=[[NSMutableArray alloc] initWithContentsOfFile:filename];
	
	if (DataArray6!=nil) {
		[DataArray6 release];
		DataArray6=nil;
	}
	paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	path=[paths    objectAtIndex:0];
	filename=[path stringByAppendingPathComponent:@"c_linklist.plist"];
	DataArray6=[[NSMutableArray alloc] initWithContentsOfFile:filename];
}
-(void)savedate
{
	
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path=[paths    objectAtIndex:0];
	NSString *filename=[path stringByAppendingPathComponent:@"c_img.plist"];    
	[DataArray writeToFile:filename  atomically:YES];
	
	
	NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path1=[paths1    objectAtIndex:0];
	NSString *filename1=[path1 stringByAppendingPathComponent:@"c_namelist.plist"];    
	[DataArray3 writeToFile:filename1  atomically:YES];
	
	NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path2=[paths2    objectAtIndex:0];
	NSString *filename2=[path2 stringByAppendingPathComponent:@"c_linklist.plist"];    
	[DataArray5 writeToFile:filename2  atomically:YES];
	
}

-(BOOL)respondsToSelector:(SEL)aSelector{
	
	printf("SELECTOR:%s\n",[NSStringFromSelector(aSelector)UTF8String]);
	return [super respondsToSelector:aSelector];
}
//#endif


- (void)dealloc {
    
	[gameimage release];
	[gameimage1 release];
	[gameimage2 release];
	[gameimage3 release];
	//[c_narray release];
	[c_tableview release];
	//[XMLUtilView release];
    
	//[c_switch1 release];
	//[c_switch2 release];
	//[c_switch3 release];
	//[c_narraypdf1 release];
    //	[c_narraypdf2 release];
    //	[c_narrayname1 release];
    //	[c_narrayname2 release];
    //	[c_narrayprice1 release];
    //	[c_narrayprice2 release];
    //	[c_narraypack1 release];
    //	[c_narraypack2 release];
	//[DataArray release];
    //	[DataArray2 release];
    //	[DataArray3 release];
    //	[DataArray4 release];
    //	[DataArray5 release];
    //	[DataArray6 release];
	[super dealloc];
}


@end
