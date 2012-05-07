//
//  Tips2_2.mm
//  New_Projects
//
//  Created by chen cool on 11-10-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tips2_2.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
#import "Tips2_pdf.h"

#import <QuartzCore/QuartzCore.h>
extern MainView *myMainView;
extern int all;
extern BOOL c_xmlread;

extern BOOL g_isHaveNetwork;

@implementation Tips2_2
@synthesize c_tittle;
@synthesize c_xml;
@synthesize c_tableview;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];
	
	type = 0;
	
	if (all==0) {
		//[self dosomething1];
	}
	else {
		//[self dosomething2];
	}
	
	
	
	//c_MM=0;
//	c_MM2=0;
//	
//	
//	
//	
//	
//	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-48)];
//	[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
//	[self.view addSubview:IMG];
//	[IMG release];
//	
//	
//	
//	c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
//	c_scrollview.backgroundColor=[UIColor clearColor];
//	
//	c_scrollview.contentSize=CGSizeMake(320, 500);
//	[self.view addSubview:c_scrollview];
//	
//	c_barimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 45, 320, 45)];
//	[c_barimage setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bartp"] ofType:@"png"]]];
//	[self.view addSubview:c_barimage];
//	
//	
//	c_narray= [[NSMutableArray alloc] init];
//	//c_narrayxml=[[NSMutableArray alloc]init];
//	c_narrayxml=[[NSMutableArray alloc]init];
//	
//	
//	
//	[c_narrayxml addObject:@"0"];
//	[c_narrayxml addObject:@"0"];
//	[c_narrayxml addObject:@"0"];
//	
//	
//	
//	NSString *nowdate = [c_xml substringWithRange:NSMakeRange(0,[c_xml length]-4)];
//	
//	if(XMLUtilView!=nil)
//	{
//		[XMLUtilView release];
//		XMLUtilView = nil;
//	}
//	XMLUtilView = [[XMLUtil1 alloc] init];
//	
//	[XMLUtilView initialMyPraseror:[NSString stringWithFormat:nowdate] 
//								  :[[NSArray alloc]initWithObjects:@"hksar",@"hkbno",@"mcsar",@"name",@"detail",@"pdf",nil]];
//	
//	
//	if (c_xmlread==YES) {
//		[c_narrayxml release];
//		c_narrayxml=nil;
//		c_narrayxml=[[NSMutableArray alloc]init];
//		[c_narrayxml addObject:[[XMLUtilView.tmpdic objectForKey:@"hksar"]objectAtIndex:0]];
//		[c_narrayxml addObject:[[XMLUtilView.tmpdic objectForKey:@"hkbno"]objectAtIndex:0]];
//		[c_narrayxml addObject:[[XMLUtilView.tmpdic objectForKey:@"mcsar"]objectAtIndex:0]];
//		
//		
//		for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"detail"]count]; i++) {
//			
//			NSString *c_11=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i]];
//			
//			
//			if ([c_11 length]<17) {
//				[c_narray addObject:@"1"];
//			}
//			else {
//				NSString *c_22=[[NSString alloc]initWithFormat:@"%d",[c_11 length]/16+1];
//				[c_narray addObject:c_22];
//			}
//			
//			
//		}
//		for (int i=0; i<[c_narray count]; i++) {
//			NSLog(@"%@",[c_narray objectAtIndex:i]);
//			c_MM+=[[c_narray objectAtIndex:i] intValue];
//		}
//		
//		
//		
//		
//		
//		
//		
//		UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
//		c_lab2.backgroundColor=[UIColor clearColor];
//		c_lab2.textColor=[UIColor whiteColor];
//		c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
//		c_lab2.font=[UIFont boldSystemFontOfSize:16];
//		[c_scrollview addSubview:c_lab2];
//		[c_lab2 release];
//		
//		UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
//		c_lab.backgroundColor=[UIColor clearColor];
//		c_lab.textColor=[UIColor blackColor];
//		c_lab.alpha=0.8;
//		c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
//		c_lab.font=[UIFont boldSystemFontOfSize:16];
//		[c_scrollview addSubview:c_lab];
//		[c_lab release];
//		
//		
//		
//		//NSString *a;
//		//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
//		
//		
//		black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
//		black.layer.cornerRadius = 15.0;
//		black.layer.masksToBounds = YES;
//		black.textColor=[UIColor brownColor];
//		black.userInteractionEnabled=NO;
//		black.font=[UIFont boldSystemFontOfSize:16];
//		black.text=@"簽證及期限";
//		//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
//		black.backgroundColor=[UIColor whiteColor];
//		[c_scrollview addSubview:black];
//		
//		
//		
//		c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
//		c_tableview.delegate = self;
//		c_tableview.dataSource = self;
//		[c_tableview setScrollEnabled:NO];
//		c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
//		c_tableview.backgroundColor=[UIColor clearColor];
//		c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
//		[c_scrollview addSubview:c_tableview];
//		
//		
//		
//		for (int i=0; i<[c_narray count]; i++) {
//			//c_MM2+=[[c_narray objectAtIndex:i] intValue];
//			if (i==0) {
//				UIImageView *C_IMG=[[UIImageView alloc]initWithFrame:CGRectMake(30+4, 40+30+6, 7, 7)];
//				[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"oimg"] ofType:@"png"]]];
//				
//				C_IMG.backgroundColor=[UIColor clearColor];
//				[c_scrollview addSubview:C_IMG];
//				c_MM2+=[[c_narray objectAtIndex:i] intValue];
//				
//				
//				UITextView *c_tex=[[UITextView alloc]initWithFrame:CGRectMake(50, 30+30, 260, 40)];
//				c_tex.backgroundColor=[UIColor clearColor];
//				c_tex.userInteractionEnabled=NO;
//				c_tex.font=[UIFont systemFontOfSize:15];
//				c_tex.text=[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i];
//				[c_scrollview addSubview:c_tex];
//				[C_IMG release];
//				[c_tex release];
//				
//			}
//			else {
//				UIImageView *C_IMG=[[UIImageView alloc]initWithFrame:CGRectMake(30+4, 40+30+20*c_MM2+6, 7, 7)];
//				C_IMG.backgroundColor=[UIColor clearColor];
//				[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"oimg"] ofType:@"png"]]];
//				[c_scrollview addSubview:C_IMG];
//				
//				
//				UITextView *c_tex=[[UITextView alloc]initWithFrame:CGRectMake(50, 30+30+20*c_MM2, 260, 40*[[c_narray objectAtIndex:i]intValue])];
//				c_tex.backgroundColor=[UIColor clearColor];
//				c_tex.userInteractionEnabled=NO;
//				c_tex.font=[UIFont systemFontOfSize:15];
//				c_tex.text=[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i];
//				[c_scrollview addSubview:c_tex];
//				
//				
//				c_MM2+=[[c_narray objectAtIndex:i] intValue];
//				
//				
//				[C_IMG release];
//				[c_tex release];
//				
//			}
//			
//		}
//	}
//	else {
//		UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
//		c_lab2.backgroundColor=[UIColor clearColor];
//		c_lab2.textColor=[UIColor whiteColor];
//		c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
//		c_lab2.font=[UIFont boldSystemFontOfSize:16];
//		[c_scrollview addSubview:c_lab2];
//		[c_lab2 release];
//		
//		UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
//		c_lab.backgroundColor=[UIColor clearColor];
//		c_lab.textColor=[UIColor blackColor];
//		c_lab.alpha=0.8;
//		c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
//		c_lab.font=[UIFont boldSystemFontOfSize:16];
//		[c_scrollview addSubview:c_lab];
//		[c_lab release];
//		
//		
//		
//		//NSString *a;
//		//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
//		
//		
//		black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
//		black.layer.cornerRadius = 15.0;
//		black.layer.masksToBounds = YES;
//		black.textColor=[UIColor brownColor];
//		black.userInteractionEnabled=NO;
//		black.font=[UIFont boldSystemFontOfSize:16];
//		black.text=@"簽證及期限";
//		//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
//		black.backgroundColor=[UIColor whiteColor];
//		[c_scrollview addSubview:black];
//	}
//
//	
//	
//	
//	
//	
//	c_switch1=[[UIButton alloc]initWithFrame:CGRectMake(10, 45+8, 100, 29)];
//	[c_switch1 addTarget:self action:@selector(c_switch1:)forControlEvents:UIControlEventTouchUpInside];
//	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"xgsard"] ofType:@"png"]] forState:UIControlStateNormal];
//	[self.view addSubview:c_switch1];
//	
//	
//	
//	c_switch2=[[UIButton alloc]initWithFrame:CGRectMake(110, 45+8, 100, 29)];
//	[c_switch2 addTarget:self action:@selector(c_switch2:)forControlEvents:UIControlEventTouchUpInside];
//	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"xgbno"] ofType:@"png"]] forState:UIControlStateNormal];
//	[self.view addSubview:c_switch2];
//	
//	c_switch3=[[UIButton alloc]initWithFrame:CGRectMake(210, 45+8, 100, 29)];
//	[c_switch3 addTarget:self action:@selector(c_switch3:)forControlEvents:UIControlEventTouchUpInside];
//	[c_switch3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"omsar"] ofType:@"png"]] forState:UIControlStateNormal];
//	[self.view addSubview:c_switch3];
//	
//	
//	
//	
//	UIImageView *topbar1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
//	[topbar1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar.png"] ofType:@""]]];
//	
//	
//	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
//	footbar.backgroundColor=[UIColor blackColor];
//	[self.view addSubview:footbar];
//	[footbar release];
//	
//	
//	
//	
//	
//	
//	
//	
//	
//	//[self.navigationController.navigationBar addSubview:topbar1];
//	[self.view addSubview:topbar1];
//	
//	
//	
//	
//	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
//	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
//	[topbar1 addSubview:c_I];
//	
//	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
//	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
//	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
//	BTN.frame = CGRectMake(270, 0, 55, 45);
//	//[self.navigationController.navigationBar addSubview:BTN];
//	[self.view addSubview:BTN];
//	
//	
//	
//	tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
//	tittle1.text=c_tittle;
//	tittle1.textColor = [UIColor blackColor];
//	tittle1.backgroundColor = [UIColor clearColor];
//	tittle1.textAlignment = UITextAlignmentCenter;
//	tittle1.font = [UIFont boldSystemFontOfSize:20];
//	[topbar1 addSubview:tittle1];
//	
//	
//	
//	tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
//	tittle.text=c_tittle;
//	tittle.textColor = [UIColor whiteColor];
//	tittle.backgroundColor = [UIColor clearColor];
//	tittle.textAlignment = UITextAlignmentCenter;
//	tittle.font = [UIFont boldSystemFontOfSize:20];
//	[topbar1 addSubview:tittle];
//	[topbar1 release];
//	
//	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
//	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
//	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
//	btnback.frame = CGRectMake(10,7,71,31);
//	[self.view addSubview:btnback];
//	
//	
//	[self drawfootbtn:nil];
	
	bundle=[[NSString alloc]initWithFormat:@"3"];
	UIViewController * webViewController = [self createWebViewController:@"http://google.com/"];
	//UIViewController * webViewController = [[UIViewController alloc] init];
	[self.navigationController pushViewController: webViewController animated: TRUE];
	//[webViewController release];
	
}



-(UIViewController *) createWebViewController: (NSString *) urlString{
	if (all==0) {
		//UIViewController * webViewController = [[UIViewController alloc] init];
//		
//		UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 368+45)];
//		webView.delegate=self;
//		NSURL *url = [NSURL URLWithString: urlString];
//		NSString *body = nil;//[NSString stringWithFormat: @"booking_id=%@&tour_code=%@", @"1",@"2"];
//		NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
//		[request setHTTPMethod: @"POST"];
//		[request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
//		[webView loadRequest: request];
//		
//		
		
		
		
		
		UIViewController * webViewController = [[UIViewController alloc] init];
		//[webViewController.view setMultipleTouchEnabled:YES];
		//[webViewController.view setUserInteractionEnabled:YES];
		
		
		UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 368+45)];
		webView.delegate=self;
		[webView setScalesPageToFit:YES];
		
		
		NSURL *url = [NSURL URLWithString: urlString];
		NSString *body = nil;
		
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
		[request setHTTPMethod: @"POST"];
		[request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
		
		[webView loadRequest: request];
		NSBundle * b = [NSBundle mainBundle];
		
		// [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"visa/index" ofType:@"html"]isDirectory:NO]]];
		
		
		if ([bundle isEqualToString:@"0"]) {
			NSBundle * c = [NSBundle bundleWithPath:
							[b pathForResource:@"visa" ofType:@"bundle"]];
			[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"chartis" ofType:@"html"]isDirectory:NO]]];
			tittle1.text=@"旅遊保險";
			tittle.text=@"旅遊保險";
		}
		else if ([bundle isEqualToString:@"1"]){
			NSBundle * c = [NSBundle bundleWithPath:
							[b pathForResource:@"visa" ofType:@"bundle"]];
			[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
			tittle1.text=@"簽證";
			tittle.text=@"簽證";
		}
		else if ([bundle isEqualToString:@"2"]) {
			//NSBundle * c = [NSBundle bundleWithPath:
			//				[b pathForResource:@"visa" ofType:@"bundle"]];
			//[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"aboutus/disclaimer" ofType:@"html"]isDirectory:NO]]];
			tittle1.text=@"其他地區資訊";
			tittle.text=@"其他地區資訊";
		}
		else if ([bundle isEqualToString:@"3"]) {
			NSBundle * c = [NSBundle bundleWithPath:
							[b pathForResource:@"visa" ofType:@"bundle"]];
			[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:c_xml ofType:@"html"]isDirectory:NO]]];
            if(type)
            {
                tittle1.hidden = YES;
                tittle.hidden = YES;
            }
			tittle1.text=@"熱線電話指南";
			tittle.text=@"熱線電話指南";
			//webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 368+45)];
			//webView.frame=CGRectMake(0, -45, 320, 368+45);
		}
		
		else {
			NSBundle * c = [NSBundle bundleWithPath:
							[b pathForResource:@"location" ofType:@"bundle"]];
			[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"map" ofType:@"html"]isDirectory:NO]]];
			tittle1.text=@"分行地址";
			tittle.text=@"分行地址";
		}
		
		
		[webViewController.view addSubview: webView];
		
		
		m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-48-45)];
		[m_pWebView setDelegate:self];
		[m_pWebView setOpaque:NO];
		
		
		//temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
		temp_URL = [[NSURL alloc]initWithString:@"http://www.ibrand.hk/client/sunflower/offlinehtml/index.html" ];
		
		temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
		[m_pWebView loadRequest:temp_URLRequest];
		//[webViewController.view addSubview:m_pWebView];
		[m_pWebView release];
		
		
		
		
		
		topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
		[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
		//topbar.backgroundColor = [UIColor lightGrayColor];
		[webViewController.view addSubview:topbar];
		[topbar addSubview:tittle1];
		[topbar addSubview:tittle];
		
		UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
		footbar.backgroundColor=[UIColor blackColor];
		[webViewController.view addSubview:footbar];
		[footbar release];
		
		
		tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
		tittle1.text=c_tittle;
		tittle1.textColor = [UIColor blackColor];
		tittle1.backgroundColor = [UIColor clearColor];
		tittle1.textAlignment = UITextAlignmentCenter;
		tittle1.font = [UIFont boldSystemFontOfSize:20];
		//[topbar addSubview:tittle1];
		
		
		
		tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
		tittle.text=c_tittle;
		tittle.textColor = [UIColor whiteColor];
		tittle.backgroundColor = [UIColor clearColor];
		tittle.textAlignment = UITextAlignmentCenter;
		tittle.font = [UIFont boldSystemFontOfSize:20];
		[topbar addSubview:tittle];
		//[topbar1 release];
		
		
		c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
		[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
		[topbar addSubview:c_I];
		
		
		
		
		BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
		[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
		//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
		BTN.frame = CGRectMake(270, 0, 55, 45);
		//[self.navigationController.navigationBar addSubview:BTN];
		[webViewController.view addSubview:BTN];
		
		
		
		UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
		[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
		[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
		btnback.frame = CGRectMake(10,7,71,31);
		[webViewController.view addSubview:btnback];
		
		
		
		twoboyview=[[UIView alloc] init];
		twoboyview.frame=CGRectMake(0, 0, 320, 460);
		twoboyview.backgroundColor=[UIColor clearColor];
		
		[webViewController.view addSubview:twoboyview];
		
		
		
		
		
		for(int i=0;i<5;i++)
		{
			if(i==2)
			{
				btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
				[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
				[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
				btnfoot.tag = 20+i;
				btnfoot.frame = CGRectMake(i*64,412,64,48);
				
				[webViewController.view addSubview:btnfoot];
				
			}
			else {
				btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
				[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
				[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
				btnfoot.tag = 20+i;
				btnfoot.frame = CGRectMake(i*64,412,64,48);
				
				[webViewController.view addSubview:btnfoot];
			}
		}
		return webViewController;
	}
	else {
		self.navigationItem.title = c_tittle;
		UIViewController * webViewController = [[UIViewController alloc] init];
		
		UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0-45, 320, 368+45)];
		webView.delegate=self;
		[webView setScalesPageToFit:YES];
		NSURL *url = [NSURL URLWithString: urlString];
		NSString *body = nil;//[NSString stringWithFormat: @"booking_id=%@&tour_code=%@", @"1",@"2"];
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
		[request setHTTPMethod: @"POST"];
		[request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
		[webView loadRequest: request];
		NSBundle * b = [NSBundle mainBundle];
		
		// [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"visa/index" ofType:@"html"]isDirectory:NO]]];
		
		
		if ([bundle isEqualToString:@"0"]) {
			NSBundle * c = [NSBundle bundleWithPath:
							[b pathForResource:@"visa" ofType:@"bundle"]];
			[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"chartis" ofType:@"html"]isDirectory:NO]]];
			tittle1.text=@"旅遊保險";
			tittle.text=@"旅遊保險";
		}
		else if ([bundle isEqualToString:@"1"]){
			NSBundle * c = [NSBundle bundleWithPath:
							[b pathForResource:@"visa" ofType:@"bundle"]];
			[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
			tittle1.text=@"簽證";
			tittle.text=@"簽證";
		}
		else if ([bundle isEqualToString:@"2"]) {
			//NSBundle * c = [NSBundle bundleWithPath:
			//				[b pathForResource:@"visa" ofType:@"bundle"]];
			//[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"aboutus/disclaimer" ofType:@"html"]isDirectory:NO]]];
			tittle1.text=@"其他地區資訊";
			tittle.text=@"其他地區資訊";
		}
		else if ([bundle isEqualToString:@"3"]) {
			NSBundle * c = [NSBundle bundleWithPath:
							[b pathForResource:@"visa_xml" ofType:@"bundle"]];
			[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:c_xml ofType:@"html"]isDirectory:NO]]];
			//webView.frame=CGRectMake(0, 0-45-45, 320, 368+45);
			tittle1.text=@"熱線電話指南";
			tittle.text=@"熱線電話指南";
		}
		else {
			NSBundle * c = [NSBundle bundleWithPath:
							[b pathForResource:@"location" ofType:@"bundle"]];
			[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"map" ofType:@"html"]isDirectory:NO]]];
			tittle1.text=@"分行地址";
			tittle.text=@"分行地址";
		}
		
		
		[webViewController.view addSubview: webView];
		
		
		m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-48-45)];
		[m_pWebView setDelegate:self];
		[m_pWebView setOpaque:NO];
		
		
		//temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
		temp_URL = [[NSURL alloc]initWithString:@"http://www.ibrand.hk/client/sunflower/offlinehtml/index.html" ];
		
		temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
		[m_pWebView loadRequest:temp_URLRequest];
		//[webViewController.view addSubview:m_pWebView];
		[m_pWebView release];
		return webViewController;
		
	}

	
	
	
	
}

-(void)dosomething1
{
	UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 368+45)];
	webView.delegate=self;
	NSURL *url = [NSURL URLWithString: @"http://google.com/"];
	NSString *body = nil;//[NSString stringWithFormat: @"booking_id=%@&tour_code=%@", @"1",@"2"];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
	[request setHTTPMethod: @"POST"];
	[request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
	[webView loadRequest: request];
	NSBundle * b = [NSBundle mainBundle];
	
	// [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"visa/index" ofType:@"html"]isDirectory:NO]]];
	
	
	if ([bundle isEqualToString:@"0"]) {
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"visa" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"chartis" ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"旅遊保險";
		tittle.text=@"旅遊保險";
	}
	else if ([bundle isEqualToString:@"1"]){
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"visa" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"簽證";
		tittle.text=@"簽證";
	}
	else if ([bundle isEqualToString:@"2"]) {
		//NSBundle * c = [NSBundle bundleWithPath:
		//				[b pathForResource:@"visa" ofType:@"bundle"]];
		//[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"aboutus/disclaimer" ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"其他地區資訊";
		tittle.text=@"其他地區資訊";
	}
	else if ([bundle isEqualToString:@"3"]) {
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"visa_xml" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:c_xml ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"熱線電話指南";
		tittle.text=@"熱線電話指南";
	}
	else {
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"location" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"map" ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"分行地址";
		tittle.text=@"分行地址";
	}
	[self.view addSubview:webView];
	
	//[webViewController.view addSubview: webView];
	
	
	m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-48-45)];
	[m_pWebView setDelegate:self];
	[m_pWebView setOpaque:NO];
	
	
	//temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
	temp_URL = [[NSURL alloc]initWithString:@"http://www.ibrand.hk/client/sunflower/offlinehtml/index.html" ];
	
	temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	//[webViewController.view addSubview:m_pWebView];
	[m_pWebView release];
	
	
	
	
	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:topbar];
	[topbar addSubview:tittle1];
	[topbar addSubview:tittle];
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	[footbar release];
	
	
	tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=c_tittle;
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font = [UIFont boldSystemFontOfSize:20];
	[topbar addSubview:tittle1];
	
	
	
	tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=c_tittle;
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font = [UIFont boldSystemFontOfSize:20];
	[topbar addSubview:tittle];
	//[topbar1 release];
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar addSubview:c_I];
	
	
	
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	//[self.navigationController.navigationBar addSubview:BTN];
	[self.view addSubview:BTN];
	
	
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	
	
	
	
	
	
	
	
	for(int i=0;i<5;i++)
	{
		if(i==2)
		{
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412,64,48);
			
			[self.view addSubview:btnfoot];
			
		}
		else {
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412,64,48);
			
			[self.view addSubview:btnfoot];
		}
	}
	
}
-(void)dosomething2
{
	UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 368+45)];
	webView.delegate=self;
	NSURL *url = [NSURL URLWithString: @"http://google.com/"];
	NSString *body = nil;//[NSString stringWithFormat: @"booking_id=%@&tour_code=%@", @"1",@"2"];
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
	[request setHTTPMethod: @"POST"];
	[request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
	[webView loadRequest: request];
	NSBundle * b = [NSBundle mainBundle];
	
	// [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"visa/index" ofType:@"html"]isDirectory:NO]]];
	
	
	if ([bundle isEqualToString:@"0"]) {
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"visa" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"chartis" ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"旅遊保險";
		tittle.text=@"旅遊保險";
	}
	else if ([bundle isEqualToString:@"1"]){
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"visa" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"index" ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"簽證";
		tittle.text=@"簽證";
	}
	else if ([bundle isEqualToString:@"2"]) {
		//NSBundle * c = [NSBundle bundleWithPath:
		//				[b pathForResource:@"visa" ofType:@"bundle"]];
		//[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"aboutus/disclaimer" ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"其他地區資訊";
		tittle.text=@"其他地區資訊";
	}
	else if ([bundle isEqualToString:@"3"]) {
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"visa_xml" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:c_xml ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"熱線電話指南";
		tittle.text=@"熱線電話指南";
	}
	else {
		
	}
	
	
	//[webViewController.view addSubview: webView];
	[self.view addSubview:webView];
	
	m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-48-45)];
	[m_pWebView setDelegate:self];
	[m_pWebView setOpaque:NO];
	
	
	//temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
	temp_URL = [[NSURL alloc]initWithString:@"http://www.ibrand.hk/client/sunflower/offlinehtml/index.html" ];
	
	temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	//[webViewController.view addSubview:m_pWebView];
	[m_pWebView release];
	
	
	
	
	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:topbar];
	[topbar addSubview:tittle1];
	[topbar addSubview:tittle];
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	[footbar release];
	
	
	tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=c_tittle;
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font = [UIFont boldSystemFontOfSize:20];
	[topbar addSubview:tittle1];
	
	
	
	tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=c_tittle;
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font = [UIFont boldSystemFontOfSize:20];
	[topbar addSubview:tittle];
	//[topbar1 release];
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar addSubview:c_I];
	
	
	
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	//[self.navigationController.navigationBar addSubview:BTN];
	[self.view addSubview:BTN];
	
	
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	
	
	
	
	
	
	
	
	for(int i=0;i<5;i++)
	{
		if(i==2)
		{
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412,64,48);
			
			[self.view addSubview:btnfoot];
			
		}
		else {
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412,64,48);
			
			[self.view addSubview:btnfoot];
		}
	}
	
}


-(void)drawfootbtn:(id)sender
{
	for(int i=0;i<5;i++)
	{
		if(i==2)
		{
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412-44+45,64,48);
			
			[self.view addSubview:btnfoot];
			
		}
		else {
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412-44+45,64,48);
			
			[self.view addSubview:btnfoot];
		}
	}
}



-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}


-(void)next:(id)sender
{
	
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"2"];
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"1"];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
}
-(void)back:(id)sender
{	
    if(!m_pSaveURL)
    {
        type = 0;
        [self.navigationController popViewControllerAnimated:NO];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        type = 1;
        [self.navigationController popViewControllerAnimated:NO];
        //[self.navigationController popViewControllerAnimated:NO];
        bundle=[[NSString alloc]initWithFormat:@"3"];
        UIViewController * webViewController = [self createWebViewController:@"http://google.com/"];
        //UIViewController * webViewController = [[UIViewController alloc] init];
        [self.navigationController pushViewController: webViewController animated: NO];
        
    }
}


-(void)c_switch1:(id)sender
{
	c_MM=0;
	c_MM2=0;
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"xgsard"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"xgbno"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"omsar"] ofType:@"png"]] forState:UIControlStateNormal];
	
	
	if ([[c_narrayxml objectAtIndex:0] isEqualToString:@"0"])
	{
		UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-90-70)];
		[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
		[self.view addSubview:IMG];
		[IMG release];
		
		
		c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
		c_scrollview.backgroundColor=[UIColor clearColor];
		
		c_scrollview.contentSize=CGSizeMake(320, 500);
		[self.view addSubview:c_scrollview];
		
		UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
		c_lab2.backgroundColor=[UIColor clearColor];
		c_lab2.textColor=[UIColor whiteColor];
		c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
		c_lab2.font=[UIFont boldSystemFontOfSize:16];
		[c_scrollview addSubview:c_lab2];
		[c_lab2 release];
		
		UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
		c_lab.backgroundColor=[UIColor clearColor];
		c_lab.textColor=[UIColor blackColor];
		c_lab.alpha=0.8;
		c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
		c_lab.font=[UIFont boldSystemFontOfSize:16];
		[c_scrollview addSubview:c_lab];
		[c_lab release];
		
		
		
		//NSString *a;
		//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
		
		
		black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
		black.layer.cornerRadius = 15.0;
		black.layer.masksToBounds = YES;
		black.textColor=[UIColor brownColor];
		black.userInteractionEnabled=NO;
		black.font=[UIFont boldSystemFontOfSize:16];
		black.text=@"簽證及期限";
		//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
		black.backgroundColor=[UIColor whiteColor];
		[c_scrollview addSubview:black];
		
		
		c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
		//c_tableview.delegate = self;
		//c_tableview.dataSource = self;
		[c_tableview setScrollEnabled:NO];
		c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
		c_tableview.backgroundColor=[UIColor clearColor];
		c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
		[c_scrollview addSubview:c_tableview];
	}
	else {
		NSString *nowdate = [[c_narrayxml objectAtIndex:0] substringWithRange:NSMakeRange(0,[[c_narrayxml objectAtIndex:0] length]-4)];
		if(XMLUtilView!=nil)
		{
			[XMLUtilView release];
			XMLUtilView = nil;
		}
		XMLUtilView = [[XMLUtil1 alloc] init];
		
		[XMLUtilView initialMyPraseror:[NSString stringWithFormat:@"%@",nowdate] 
									  :[[NSMutableArray alloc]initWithObjects:@"hksar",@"hkbno",@"mcsar",@"name",@"detail",@"pdf",nil]];
		
		
		
		if (c_xmlread==YES)
		{
			if (c_narray!=nil) {
				[c_narray release];
				c_narray=nil;
				c_narray=[[NSMutableArray alloc]init];
			}
			for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"detail"]count]; i++) {
				
				NSString *c_11=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i]];
				
				
				if ([c_11 length]<17) {
					[c_narray addObject:@"1"];
				}
				else {
					NSString *c_22=[[NSString alloc]initWithFormat:@"%d",[c_11 length]/16+1];
					[c_narray addObject:c_22];
				}
				
				
			}
			for (int i=0; i<[c_narray count]; i++) {
				NSLog(@"%@",[c_narray objectAtIndex:i]);
				c_MM+=[[c_narray objectAtIndex:i] intValue];
			}
			
			UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-90-70)];
			[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
			[self.view addSubview:IMG];
			[IMG release];
			
			c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
			c_scrollview.backgroundColor=[UIColor clearColor];
			c_scrollview.contentSize=CGSizeMake(320, 500);
			[self.view addSubview:c_scrollview];
			
			
			
			UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
			c_lab2.backgroundColor=[UIColor clearColor];
			c_lab2.textColor=[UIColor whiteColor];
			c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab2.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab2];
			[c_lab2 release];
			
			UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
			c_lab.backgroundColor=[UIColor clearColor];
			c_lab.textColor=[UIColor blackColor];
			c_lab.alpha=0.8;
			c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab];
			[c_lab release];
			
			
			
			//NSString *a;
			//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
			
			
			black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
			black.layer.cornerRadius = 15.0;
			black.layer.masksToBounds = YES;
			black.textColor=[UIColor brownColor];
			black.userInteractionEnabled=NO;
			black.font=[UIFont boldSystemFontOfSize:16];
			black.text=@"簽證及期限";
			//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
			black.backgroundColor=[UIColor whiteColor];
			[c_scrollview addSubview:black];
			
			
			c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
			//c_tableview.delegate = self;
			//c_tableview.dataSource = self;
			[c_tableview setScrollEnabled:NO];
			c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			c_tableview.backgroundColor=[UIColor clearColor];
			c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
			[c_scrollview addSubview:c_tableview];
			
			
			for (int i=0; i<[c_narray count]; i++) {
				//c_MM2+=[[c_narray objectAtIndex:i] intValue];
				if (i==0) {
					UIImageView *C_IMG=[[UIImageView alloc]initWithFrame:CGRectMake(30+4, 40+30+6, 7, 7)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"oimg"] ofType:@"png"]]];
					
					C_IMG.backgroundColor=[UIColor clearColor];
					[c_scrollview addSubview:C_IMG];
					c_MM2+=[[c_narray objectAtIndex:i] intValue];
					
					
					UITextView *c_tex=[[UITextView alloc]initWithFrame:CGRectMake(50, 30+30, 260, 40)];
					c_tex.backgroundColor=[UIColor clearColor];
					c_tex.userInteractionEnabled=NO;
					c_tex.font=[UIFont systemFontOfSize:15];
					c_tex.text=[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i];
					[c_scrollview addSubview:c_tex];
					[C_IMG release];
					[c_tex release];
					
				}
				else {
					UIImageView *C_IMG=[[UIImageView alloc]initWithFrame:CGRectMake(30+4, 40+30+20*c_MM2+6, 7, 7)];
					C_IMG.backgroundColor=[UIColor clearColor];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"oimg"] ofType:@"png"]]];
					[c_scrollview addSubview:C_IMG];
					
					
					UITextView *c_tex=[[UITextView alloc]initWithFrame:CGRectMake(50, 30+30+20*c_MM2, 260, 40*[[c_narray objectAtIndex:i]intValue])];
					c_tex.backgroundColor=[UIColor clearColor];
					c_tex.userInteractionEnabled=NO;
					c_tex.font=[UIFont systemFontOfSize:15];
					c_tex.text=[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i];
					[c_scrollview addSubview:c_tex];
					
					
					c_MM2+=[[c_narray objectAtIndex:i] intValue];
					
					
					[C_IMG release];
					[c_tex release];
					
				}
				
			}
		}
		else 
		{
			UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-90-70)];
			[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
			[self.view addSubview:IMG];
			[IMG release];
			
			c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
			c_scrollview.backgroundColor=[UIColor clearColor];
			c_scrollview.contentSize=CGSizeMake(320, 500);
			[self.view addSubview:c_scrollview];
			
			
			
			UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
			c_lab2.backgroundColor=[UIColor clearColor];
			c_lab2.textColor=[UIColor whiteColor];
			c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab2.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab2];
			[c_lab2 release];
			
			UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
			c_lab.backgroundColor=[UIColor clearColor];
			c_lab.textColor=[UIColor blackColor];
			c_lab.alpha=0.8;
			c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab];
			[c_lab release];
			
			
			
			//NSString *a;
			//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
			
			
			black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
			black.layer.cornerRadius = 15.0;
			black.layer.masksToBounds = YES;
			black.textColor=[UIColor brownColor];
			black.userInteractionEnabled=NO;
			black.font=[UIFont boldSystemFontOfSize:16];
			black.text=@"簽證及期限";
			//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
			black.backgroundColor=[UIColor whiteColor];
			[c_scrollview addSubview:black];
			
			
			c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
			//c_tableview.delegate = self;
			//c_tableview.dataSource = self;
			[c_tableview setScrollEnabled:NO];
			c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			c_tableview.backgroundColor=[UIColor clearColor];
			c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
			[c_scrollview addSubview:c_tableview];
		}
	}

	
	

	

		
	
	
	
}
-(void)c_switch2:(id)sender
{
	c_MM=0;
	c_MM2=0;
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"xgsar"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"xgbnod"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"omsar"] ofType:@"png"]] forState:UIControlStateNormal];
	
	
	
	if ([[c_narrayxml objectAtIndex:1] isEqualToString:@"0"]) {
		UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-90-70)];
		[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
		[self.view addSubview:IMG];
		[IMG release];
		
		c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
		c_scrollview.backgroundColor=[UIColor clearColor];
		c_scrollview.contentSize=CGSizeMake(320, 500);
		[self.view addSubview:c_scrollview];
		
		
		
		UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
		c_lab2.backgroundColor=[UIColor clearColor];
		c_lab2.textColor=[UIColor whiteColor];
		c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
		c_lab2.font=[UIFont boldSystemFontOfSize:16];
		[c_scrollview addSubview:c_lab2];
		[c_lab2 release];
		
		UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
		c_lab.backgroundColor=[UIColor clearColor];
		c_lab.textColor=[UIColor blackColor];
		c_lab.alpha=0.8;
		c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
		c_lab.font=[UIFont boldSystemFontOfSize:16];
		[c_scrollview addSubview:c_lab];
		[c_lab release];
		
		
		
		//NSString *a;
		//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
		
		
		black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
		black.layer.cornerRadius = 15.0;
		black.layer.masksToBounds = YES;
		black.textColor=[UIColor brownColor];
		black.userInteractionEnabled=NO;
		black.font=[UIFont boldSystemFontOfSize:16];
		black.text=@"簽證及期限";
		//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
		black.backgroundColor=[UIColor whiteColor];
		[c_scrollview addSubview:black];
		
		
		c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
		//c_tableview.delegate = self;
		//c_tableview.dataSource = self;
		[c_tableview setScrollEnabled:NO];
		c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
		c_tableview.backgroundColor=[UIColor clearColor];
		c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
		[c_scrollview addSubview:c_tableview];
	}
	else {
		NSString *nowdate = [[c_narrayxml objectAtIndex:1] substringWithRange:NSMakeRange(0,[[c_narrayxml objectAtIndex:1] length]-4)];
		if(XMLUtilView!=nil)
		{
			[XMLUtilView release];
			XMLUtilView = nil;
		}
		XMLUtilView = [[XMLUtil1 alloc] init];
		
		[XMLUtilView initialMyPraseror:[NSString stringWithFormat:@"%@",nowdate] 
									  :[[NSMutableArray alloc]initWithObjects:@"hksar",@"hkbno",@"mcsar",@"name",@"detail",@"pdf",nil]];
		
		
		if (c_xmlread==YES) {
			if (c_narray!=nil) {
				[c_narray release];
				c_narray=nil;
				c_narray=[[NSMutableArray alloc]init];
			}
			for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"detail"]count]; i++) {
				
				NSString *c_11=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i]];
				
				
				if ([c_11 length]<17) {
					[c_narray addObject:@"1"];
				}
				else {
					NSString *c_22=[[NSString alloc]initWithFormat:@"%d",[c_11 length]/16+1];
					[c_narray addObject:c_22];
				}
				
				
			}
			for (int i=0; i<[c_narray count]; i++) {
				NSLog(@"%@",[c_narray objectAtIndex:i]);
				c_MM+=[[c_narray objectAtIndex:i] intValue];
			}
			
			UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-90-70)];
			[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
			[self.view addSubview:IMG];
			[IMG release];
			
			c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
			c_scrollview.backgroundColor=[UIColor clearColor];
			c_scrollview.contentSize=CGSizeMake(320, 500);
			[self.view addSubview:c_scrollview];
			
			
			UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
			c_lab2.backgroundColor=[UIColor clearColor];
			c_lab2.textColor=[UIColor whiteColor];
			c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab2.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab2];
			[c_lab2 release];
			
			UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
			c_lab.backgroundColor=[UIColor clearColor];
			c_lab.textColor=[UIColor blackColor];
			c_lab.alpha=0.8;
			c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab];
			[c_lab release];
			
			
			black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
			black.layer.cornerRadius = 15.0;
			black.layer.masksToBounds = YES;
			black.textColor=[UIColor brownColor];
			black.userInteractionEnabled=NO;
			black.font=[UIFont boldSystemFontOfSize:16];
			black.text=@"簽證及期限";
			//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
			black.backgroundColor=[UIColor whiteColor];
			[c_scrollview addSubview:black];
			
			
			c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
			//c_tableview.delegate = self;
			//c_tableview.dataSource = self;
			[c_tableview setScrollEnabled:NO];
			c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			c_tableview.backgroundColor=[UIColor clearColor];
			c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
			[c_scrollview addSubview:c_tableview];
			
			
			for (int i=0; i<[c_narray count]; i++) {
				//c_MM2+=[[c_narray objectAtIndex:i] intValue];
				if (i==0) {
					UIImageView *C_IMG=[[UIImageView alloc]initWithFrame:CGRectMake(30+4, 40+30+6, 7, 7)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"oimg"] ofType:@"png"]]];
					
					C_IMG.backgroundColor=[UIColor clearColor];
					[c_scrollview addSubview:C_IMG];
					c_MM2+=[[c_narray objectAtIndex:i] intValue];
					
					
					UITextView *c_tex=[[UITextView alloc]initWithFrame:CGRectMake(50, 30+30, 260, 40)];
					c_tex.backgroundColor=[UIColor clearColor];
					c_tex.userInteractionEnabled=NO;
					c_tex.font=[UIFont systemFontOfSize:15];
					c_tex.text=[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i];
					[c_scrollview addSubview:c_tex];
					[C_IMG release];
					[c_tex release];
					
				}
				else {
					UIImageView *C_IMG=[[UIImageView alloc]initWithFrame:CGRectMake(30+4, 40+30+20*c_MM2+6, 7, 7)];
					C_IMG.backgroundColor=[UIColor clearColor];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"oimg"] ofType:@"png"]]];
					[c_scrollview addSubview:C_IMG];
					
					
					UITextView *c_tex=[[UITextView alloc]initWithFrame:CGRectMake(50, 30+30+20*c_MM2, 260, 40*[[c_narray objectAtIndex:i]intValue])];
					c_tex.backgroundColor=[UIColor clearColor];
					c_tex.userInteractionEnabled=NO;
					c_tex.font=[UIFont systemFontOfSize:15];
					c_tex.text=[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i];
					[c_scrollview addSubview:c_tex];
					
					
					c_MM2+=[[c_narray objectAtIndex:i] intValue];
					
					
					[C_IMG release];
					[c_tex release];
					
				}
				
			}
		}
		else {
			UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-90-70)];
			[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
			[self.view addSubview:IMG];
			[IMG release];
			
			
			
			c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
			c_scrollview.backgroundColor=[UIColor clearColor];
			c_scrollview.contentSize=CGSizeMake(320, 500);
			[self.view addSubview:c_scrollview];
			
			UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
			c_lab2.backgroundColor=[UIColor clearColor];
			c_lab2.textColor=[UIColor whiteColor];
			c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab2.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab2];
			[c_lab2 release];
			
			UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
			c_lab.backgroundColor=[UIColor clearColor];
			c_lab.textColor=[UIColor blackColor];
			c_lab.alpha=0.8;
			c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab];
			[c_lab release];
			
			
			
			//NSString *a;
			//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
			
			
			black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
			black.layer.cornerRadius = 15.0;
			black.layer.masksToBounds = YES;
			black.textColor=[UIColor brownColor];
			black.userInteractionEnabled=NO;
			black.font=[UIFont boldSystemFontOfSize:16];
			black.text=@"簽證及期限";
			//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
			black.backgroundColor=[UIColor whiteColor];
			[c_scrollview addSubview:black];
			
			
			c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
			//c_tableview.delegate = self;
			//c_tableview.dataSource = self;
			[c_tableview setScrollEnabled:NO];
			c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			c_tableview.backgroundColor=[UIColor clearColor];
			c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
			[c_scrollview addSubview:c_tableview];
		}
	}

	

	
	
	
	
}
-(void)c_switch3:(id)sender
{
	c_MM=0;
	c_MM2=0;
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"xgsar"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"xgbno"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"omsard"] ofType:@"png"]] forState:UIControlStateNormal];
	
	if ([[c_narrayxml objectAtIndex:2] isEqualToString:@"0"])
	{
		UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-90-70)];
		[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
		[self.view addSubview:IMG];
		[IMG release];
		
		
		
		c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
		c_scrollview.backgroundColor=[UIColor clearColor];
		c_scrollview.contentSize=CGSizeMake(320, 500);
		[self.view addSubview:c_scrollview];
		
		
		
		UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
		c_lab2.backgroundColor=[UIColor clearColor];
		c_lab2.textColor=[UIColor whiteColor];
		c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
		c_lab2.font=[UIFont boldSystemFontOfSize:16];
		[c_scrollview addSubview:c_lab2];
		[c_lab2 release];
		
		UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
		c_lab.backgroundColor=[UIColor clearColor];
		c_lab.textColor=[UIColor blackColor];
		c_lab.alpha=0.8;
		c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
		c_lab.font=[UIFont boldSystemFontOfSize:16];
		[c_scrollview addSubview:c_lab];
		[c_lab release];
		
		
		
		//NSString *a;
		//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
		
		
		black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
		black.layer.cornerRadius = 15.0;
		black.layer.masksToBounds = YES;
		black.textColor=[UIColor brownColor];
		black.userInteractionEnabled=NO;
		black.font=[UIFont boldSystemFontOfSize:16];
		black.text=@"簽證及期限";
		//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
		black.backgroundColor=[UIColor whiteColor];
		[c_scrollview addSubview:black];
		
		
		c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
		//c_tableview.delegate = self;
		//c_tableview.dataSource = self;
		[c_tableview setScrollEnabled:NO];
		c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
		c_tableview.backgroundColor=[UIColor clearColor];
		c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
		[c_scrollview addSubview:c_tableview];
	}
	else {
		NSString *nowdate = [[c_narrayxml objectAtIndex:2] substringWithRange:NSMakeRange(0,[[c_narrayxml objectAtIndex:2] length]-4)];
		if(XMLUtilView!=nil)
		{
			[XMLUtilView release];
			XMLUtilView = nil;
		}
		XMLUtilView = [[XMLUtil1 alloc] init];
		
		[XMLUtilView initialMyPraseror:[NSString stringWithFormat:@"%@",nowdate] 
									  :[[NSMutableArray alloc]initWithObjects:@"hksar",@"hkbno",@"mcsar",@"name",@"detail",@"pdf",nil]];
		
		if (c_xmlread==YES) {
			if (c_narray!=nil) {
				[c_narray release];
				c_narray=nil;
				c_narray=[[NSMutableArray alloc]init];
			}
			for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"detail"]count]; i++) {
				
				NSString *c_11=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i]];
				
				
				if ([c_11 length]<17) {
					[c_narray addObject:@"1"];
				}
				else {
					NSString *c_22=[[NSString alloc]initWithFormat:@"%d",[c_11 length]/16+1];
					[c_narray addObject:c_22];
				}
				
				
			}
			for (int i=0; i<[c_narray count]; i++) {
				NSLog(@"%@",[c_narray objectAtIndex:i]);
				c_MM+=[[c_narray objectAtIndex:i] intValue];
			}
			
			UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-90-70)];
			[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
			[self.view addSubview:IMG];
			[IMG release];
			
			
			
			c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
			c_scrollview.backgroundColor=[UIColor clearColor];
			c_scrollview.contentSize=CGSizeMake(320, 500);
			[self.view addSubview:c_scrollview];
			
			
			
			
			UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
			c_lab2.backgroundColor=[UIColor clearColor];
			c_lab2.textColor=[UIColor whiteColor];
			c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab2.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab2];
			[c_lab2 release];
			
			UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
			c_lab.backgroundColor=[UIColor clearColor];
			c_lab.textColor=[UIColor blackColor];
			c_lab.alpha=0.8;
			c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab];
			[c_lab release];
			
			
			
			//NSString *a;
			//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
			
			
			black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
			black.layer.cornerRadius = 15.0;
			black.layer.masksToBounds = YES;
			black.textColor=[UIColor brownColor];
			black.userInteractionEnabled=NO;
			black.font=[UIFont boldSystemFontOfSize:16];
			black.text=@"簽證及期限";
			//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
			black.backgroundColor=[UIColor whiteColor];
			[c_scrollview addSubview:black];
			
			
			c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
			//c_tableview.delegate = self;
			//c_tableview.dataSource = self;
			[c_tableview setScrollEnabled:NO];
			c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			c_tableview.backgroundColor=[UIColor clearColor];
			c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
			[c_scrollview addSubview:c_tableview];
			
			
			for (int i=0; i<[c_narray count]; i++) {
				//c_MM2+=[[c_narray objectAtIndex:i] intValue];
				if (i==0) {
					UIImageView *C_IMG=[[UIImageView alloc]initWithFrame:CGRectMake(30+4, 40+30+6, 7, 7)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"oimg"] ofType:@"png"]]];
					
					C_IMG.backgroundColor=[UIColor clearColor];
					[c_scrollview addSubview:C_IMG];
					c_MM2+=[[c_narray objectAtIndex:i] intValue];
					
					
					UITextView *c_tex=[[UITextView alloc]initWithFrame:CGRectMake(50, 30+30, 260, 40)];
					c_tex.backgroundColor=[UIColor clearColor];
					c_tex.userInteractionEnabled=NO;
					c_tex.font=[UIFont systemFontOfSize:15];
					c_tex.text=[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i];
					[c_scrollview addSubview:c_tex];
					[C_IMG release];
					[c_tex release];
					
				}
				else {
					UIImageView *C_IMG=[[UIImageView alloc]initWithFrame:CGRectMake(30+4, 40+30+20*c_MM2+6, 7, 7)];
					C_IMG.backgroundColor=[UIColor clearColor];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"oimg"] ofType:@"png"]]];
					[c_scrollview addSubview:C_IMG];
					
					
					UITextView *c_tex=[[UITextView alloc]initWithFrame:CGRectMake(50, 30+30+20*c_MM2, 260, 40*[[c_narray objectAtIndex:i]intValue])];
					c_tex.backgroundColor=[UIColor clearColor];
					c_tex.userInteractionEnabled=NO;
					c_tex.font=[UIFont systemFontOfSize:15];
					c_tex.text=[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:i];
					[c_scrollview addSubview:c_tex];
					
					
					c_MM2+=[[c_narray objectAtIndex:i] intValue];
					
					
					[C_IMG release];
					[c_tex release];
					
				}
				
			}
			
		}
		else {
			UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-90-70)];
			[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"bagtp"] ofType:@"png"]]];
			[self.view addSubview:IMG];
			[IMG release];
			
			
			c_scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 90, 320, 480-68-90)];
			c_scrollview.backgroundColor=[UIColor clearColor];
			c_scrollview.contentSize=CGSizeMake(320, 500);
			[self.view addSubview:c_scrollview];
			
			
			UILabel *c_lab2=[[UILabel alloc]initWithFrame:CGRectMake(10, 1+12, 200, 30)];
			c_lab2.backgroundColor=[UIColor clearColor];
			c_lab2.textColor=[UIColor whiteColor];
			c_lab2.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab2.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab2];
			[c_lab2 release];
			
			UILabel *c_lab=[[UILabel alloc]initWithFrame:CGRectMake(10, 12, 200, 30)];
			c_lab.backgroundColor=[UIColor clearColor];
			c_lab.textColor=[UIColor blackColor];
			c_lab.alpha=0.8;
			c_lab.text=[[NSString alloc] initWithFormat:@"%@簽證需知",c_tittle];
			c_lab.font=[UIFont boldSystemFontOfSize:16];
			[c_scrollview addSubview:c_lab];
			[c_lab release];
			
			
			
			//NSString *a;
			//a = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:0] stringByReplacingOccurrencesOfString:@"<br/>"withString:@"\n      o "];
			
			
			black=[[UITextView alloc]initWithFrame:CGRectMake(10, 40, 300, 40+20*c_MM)];
			black.layer.cornerRadius = 15.0;
			black.layer.masksToBounds = YES;
			black.textColor=[UIColor brownColor];
			black.userInteractionEnabled=NO;
			black.font=[UIFont boldSystemFontOfSize:16];
			black.text=@"簽證及期限";
			//black.text=[[NSString alloc] initWithFormat:@"      o %@",a];
			black.backgroundColor=[UIColor whiteColor];
			[c_scrollview addSubview:black];
			
			
			c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,40+40+20*c_MM, 310, 240) style:UITableViewStyleGrouped];
			//c_tableview.delegate = self;
			//c_tableview.dataSource = self;
			[c_tableview setScrollEnabled:NO];
			c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			c_tableview.backgroundColor=[UIColor clearColor];
			c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
			[c_scrollview addSubview:c_tableview];
			
		}
	}

	
	

	
	
	
	
	
}


- (CGFloat)tableView:(UITableView *)c_tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 45;
	
}
-(NSInteger)tableView:(UITableView *)c_tableview numberOfRowsInSection:(NSInteger)section
{
	return [[XMLUtilView.tmpdic objectForKey:@"pdf"]count];
}




- (UITableViewCell *)tableView:(UITableView *)c_tv
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	
	UITableViewCell *cell = [c_tableview dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	if (cell == nil) {
		CGRect cellFrame = CGRectMake(0,0,320,65);
		cell = [[[UITableViewCell alloc] initWithFrame:cellFrame
									   reuseIdentifier:SimpleTableIdentifier] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
		//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		// Set up the cell...
		//int x = indexPath.row;
		//gaurav cell.imageView.image =  [UIImage imageNamed:@"pdf.png"];
		//[cell.textLabel setText: [titles objectAtIndex: indexPath.row]];
		
		cell.textLabel.text=@"下載更多資料";
		
	}
	
	[SimpleTableIdentifier release];
	SimpleTableIdentifier = nil;
	
	return cell;
}

- (void)tableView:(UITableView *)c_tableview didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(g_isHaveNetwork)
    {
        Tips2_pdf *c_Tips2=[[Tips2_pdf alloc]initWithNibName:@"Tips2_pdf" bundle:nil];
        NSString *c_11111=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"pdf"]objectAtIndex:indexPath.row]];
        NSLog(@"%@",[[XMLUtilView.tmpdic objectForKey:@"pdf"]objectAtIndex:indexPath.row]);
        //c_Tips2.c_tittle=[[NSString alloc]initWithFormat:[[XMLUtilView.tmpdic objectForKey:@"name1"]objectAtIndex:indexPath.row]];
        c_Tips2.c_xml=[[NSString alloc]initWithFormat:@"%@",c_11111];
        
        [self.navigationController pushViewController:c_Tips2 animated:YES];
    }
	
	
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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


- (void)webViewDidFinishLoad:(UIWebView *)webView { 
	NSString* str1 = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	NSLog(@"tips2_2: 1111%@",str1);
    if(m_pSaveURL)
    {
        [m_pSaveURL release];
        m_pSaveURL = nil;
    }
    if([str1 rangeOfString:@"pdf"].length > 0)
    {
        m_pSaveURL = [str1 copy];
    }
	[myMainView loadingStop];
	twoboyview.hidden=YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	//NSString* str = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	[myMainView startLoad];
	twoboyview.hidden=NO;
	
	
} 


- (void)dealloc {

	[c_narray release];
	[c_narrayxml release];
	[c_tableview release];
	[black release];
	[c_barimage release];
	[twoboyview removeFromSuperview];
	[twoboyview release];
    [super dealloc];
}


@end
