//
//  EnquiryView.mm
//  New_Projects
//
//  Created by chen cool on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EnquiryView.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
extern MainView *myMainView;
extern int all;
extern BOOL c_ccxml;

@implementation EnquiryView

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
	
	[myMainView startLoad];
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil alloc] init];
	[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/info.xml"] :[[NSMutableArray alloc]initWithObjects:@"sub_cat_name",@"next_level_api",@"info",@"package_pdf_path",nil]];
	//[XMLUtilView getErrorCode];
	
	//NSLog(@"啊庞被改造%@",(c_ccxml ? @"成功":@"失败"));
	//NSString *c_cg=[[NSString alloc]initWithFormat:@"%@",(c_ccxml ? @"哈哈":@"操，这么垃圾")];
	//NSLog(@"%@",c_cg);
	
	
	if ([(c_ccxml ? @"成功":@"失败")isEqualToString:@"成功"]) 
	{
		if (all==0) {
			[self dosomething1];
		}
		else {
			[self dosomething2];
		}
	}
	else {
		
		NSLog(@"tab1都无网络链接");
		UIAlertView *netWorkError5 = 
		[[UIAlertView alloc] 
		 initWithTitle:@"無法連接到伺服器，請檢查你的網絡設定或可瀏覽離線內容\"旅遊錦囊\"。" 
		 message:@"" 
		 delegate:self 
		 cancelButtonTitle:@"確定" 
		 otherButtonTitles:nil,nil];
		[netWorkError5 show];
		[netWorkError5 release];
	}
}


-(void)dosomething1
{
	self.view.backgroundColor=[UIColor redColor];
	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:topbar];
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	
	
	UILabel *tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=@"查詢";
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	//tittle.font = [UIFont systemFontOfSize:20];
	tittle1.font=[UIFont boldSystemFontOfSize:20];
	//[self.view addSubview:tittle1];
	[tittle1 release];
	
	
	
	UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"查詢";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	//tittle.font = [UIFont systemFontOfSize:20];
	tittle.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle];
	[tittle release];
	
	
	
	
	
	
	
	
	
	
	UIImageView *SwitchBg=[[UIImageView alloc]init];
	SwitchBg.frame=CGRectMake(0, 45, 320, 480);
	[SwitchBg setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
	//SwitchBg.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:SwitchBg];
	[SwitchBg release];
	
	
	NSArray *buttonNames = [NSArray arrayWithObjects:@"茶會時間",@"旅行團航班資料", nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:buttonNames];
	//segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar; 
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	[segmentedControl setFrame:CGRectMake(5,45+8,320-10,50-15-6)];
	segmentedControl.segmentedControlStyle=UISegmentedControlStylePlain;
    segmentedControl.tintColor=[UIColor blackColor];
	
	
	
	
	segmentedControl.selectedSegmentIndex=10;
	//[self.view addSubview:segmentedControl];
	
	
	
	c_switch1=[[UIButton alloc]initWithFrame:CGRectMake(10, 45+8, 150, 29)];
	[c_switch1 addTarget:self action:@selector(c_switch1:)forControlEvents:UIControlEventTouchUpInside];
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_teaparty4_03"] ofType:@"png"]] forState:UIControlStateNormal];
	[self.view addSubview:c_switch1];
	
	
	
	c_switch2=[[UIButton alloc]initWithFrame:CGRectMake(160, 45+8, 150, 29)];
	[c_switch2 addTarget:self action:@selector(c_switch2:)forControlEvents:UIControlEventTouchUpInside];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_teaparty4_05"] ofType:@"png"]] forState:UIControlStateNormal];
	[self.view addSubview:c_switch2];
	
	
	
	
	
	
	
	m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45+45, 320, 480-45-48-45)];
	[m_pWebView setDelegate:self];
	[m_pWebView setOpaque:NO];
	m_pWebView.backgroundColor=[UIColor clearColor];
	[m_pWebView setScalesPageToFit:YES];
	
	temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
	//temp_URL = [[NSURL alloc]initWithString:@"http://www.ibrand.hk/client/sunflower/offlinehtml/index.html" ];
	
	temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	[self.view addSubview:m_pWebView];
	
	
	//http://www.hksunflower.com/enquiry/tourcheck.asp   //旅行團航班資料
	//http://www.hksunflower.com/enquiry/teacheck.asp    //茶會時間
	
	
	
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar addSubview:c_I];
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	[self.view addSubview:BTN];
	
	
	
	
	
	
	
	for(int i=0;i<5;i++)
	{
		if(i==3)
		{
			btnfoot= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412,64,48);
			
			[self.view addSubview:btnfoot];
			
		}
		else {
			btnfoot= [[UIButton buttonWithType:UIButtonTypeCustom] retain];
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
	self.view.backgroundColor=[UIColor grayColor];
	
	self.navigationItem.title = @"查詢";
	
	UIImageView *SwitchBg=[[UIImageView alloc]init];
	SwitchBg.frame=CGRectMake(0, 0, 320, 480);
	[SwitchBg setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
	//SwitchBg.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:SwitchBg];
	[SwitchBg release];
	
	
	
	
	
	c_switch1=[[UIButton alloc]initWithFrame:CGRectMake(10, 8, 150, 29)];
	[c_switch1 addTarget:self action:@selector(c_switch1:)forControlEvents:UIControlEventTouchUpInside];
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_teaparty4_03"] ofType:@"png"]] forState:UIControlStateNormal];
	[self.view addSubview:c_switch1];
	
	
	
	c_switch2=[[UIButton alloc]initWithFrame:CGRectMake(160, 8, 150, 29)];
	[c_switch2 addTarget:self action:@selector(c_switch2:)forControlEvents:UIControlEventTouchUpInside];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_teaparty4_05"] ofType:@"png"]] forState:UIControlStateNormal];
	[self.view addSubview:c_switch2];
	
	
	
	
	
	
	
	m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45, 320, 480-45-48-45)];
	[m_pWebView setDelegate:self];
	[m_pWebView setOpaque:NO];
	m_pWebView.backgroundColor=[UIColor clearColor];
	
	
	temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
	//temp_URL = [[NSURL alloc]initWithString:@"http://www.ibrand.hk/client/sunflower/offlinehtml/index.html" ];
	
	temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	[self.view addSubview:m_pWebView];
	[m_pWebView release];
	
	
}

-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}


-(void)c_switch1:(id)sender
{
	if (m_pWebView!=nil) {
		[m_pWebView release];
		m_pWebView=nil;
	}
    
	m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45+45, 320, 480-45-48-45-20)];
	[m_pWebView setDelegate:self];
	[m_pWebView setScalesPageToFit:YES];
    
    //[m_pWebView setOpaque:NO];
	//m_pWebView.backgroundColor=[UIColor clearColor];
	
	
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_teaparty4_03"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_teaparty4_05"] ofType:@"png"]] forState:UIControlStateNormal];
	
	
	temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
	temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	[self.view addSubview:m_pWebView];
		
}
-(void)c_switch2:(id)sender
{
	if (m_pWebView!=nil) {
		[m_pWebView release];
		m_pWebView=nil;
	}
	
	m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45+45, 320, 480-45-48-45-20)];
	[m_pWebView setDelegate:self];
	[m_pWebView setScalesPageToFit:YES];
	
	//m_pWebView.backgroundColor=[UIColor clearColor];
	//[m_pWebView setOpaque:NO];
    
	[c_switch1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_teaparty4_07"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_switch2 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"apps_teaparty4_06"] ofType:@"png"]] forState:UIControlStateNormal];
	
	
	temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/tourcheck.asp" ];
	temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	[self.view addSubview:m_pWebView];
	
	
	
}


-(void)segmentAction:(id)sender
{
	switch([sender selectedSegmentIndex])
	{
		case 0:
        {
			m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45+45, 320, 480-45-48-45-20)];
			[m_pWebView setDelegate:self];
			[m_pWebView setOpaque:NO];
			[m_pWebView setScalesPageToFit:YES];
			//[m_pWebView sizeToFit];
			
			temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
			temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
			[m_pWebView loadRequest:temp_URLRequest];
			[self.view addSubview:m_pWebView];
			[m_pWebView release];
        }
			break;
		case 1: 
        {
			m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45+45, 320, 480-45-48-45-20)];
			[m_pWebView setDelegate:self];
			
			[m_pWebView setScalesPageToFit:YES];
			[m_pWebView sizeToFit];
            //[m_pWebView setBackgroundColor:[UIColor blueColor]];
			[m_pWebView setOpaque:NO];
			
			
			temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/tourcheck.asp" ];
			temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
			[m_pWebView loadRequest:temp_URLRequest];
			[self.view addSubview:m_pWebView];
			[m_pWebView release];
			
			
        }
			break;
		
		default: 
			break;
	}
}



- (void)webViewDidFinishLoad:(UIWebView *)webView { 
	NSString* str1 = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	NSLog(@"enquiryview: wenviewdidfinishload: %@",str1);
	[myMainView loadingStop];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	//NSString* str = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	[myMainView startLoad];
} 




-(void)next:(id)sender
{

	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"0"];
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"3"];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
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

- (void)dealloc {
    [super dealloc];
	[btnfoot release];
	[m_pWebView release];

}


@end
