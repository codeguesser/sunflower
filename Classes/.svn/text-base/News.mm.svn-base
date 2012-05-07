//
//  News.mm
//  New_Projects
//
//  Created by chen cool on 11-10-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "News.h"
#import "PDFScrollView.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
extern MainView *myMainView;
extern int all;
@implementation News

@synthesize c_xml,c_ol,c_offline;
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
	if (all==0) {
		[self dosomething1];
	}
	else {
		[self dosomething2];
	}
}


-(void)dosomething1
{
	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	[self.view addSubview:topbar];
	
	
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	
	
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(270, 0, 55, 45)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"i"] ofType:@"png"]]];
	[topbar addSubview:c_I];
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
    BTN.frame = CGRectMake(270, 0, 55, 45);
	[self.view addSubview:BTN];
	
	UILabel *tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=@"最新資訊";
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font=[UIFont boldSystemFontOfSize:20];
	//[self.view addSubview:tittle1];
	[tittle1 release];
	
	UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"最新資訊";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle];
	[tittle release];
	
	
	
	
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	
	
	
	
	if([[NSFileManager defaultManager] fileExistsAtPath:c_offline] == NO)
	{
		UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 45, 320.0, 480.0-64-45)];
		[m_pWebView setDelegate:self];
		
		
		[m_pWebView setOpaque:NO];
		[m_pWebView setScalesPageToFit:YES];
		
		NSURL *temp_URL = [[NSURL alloc]initWithString:c_ol];
		NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
		[m_pWebView loadRequest:temp_URLRequest];
		[self.view addSubview:m_pWebView];
		[m_pWebView sizeToFit];
		[m_pWebView setScalesPageToFit:YES];
		[m_pWebView release];
	}
	else {
		UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 45, 320.0, 480.0-64-45)];
		[m_pWebView setDelegate:self];
		[m_pWebView setOpaque:NO];
		[m_pWebView setScalesPageToFit:YES];
		NSURL *URL = [[NSURL alloc] initFileURLWithPath:c_offline];
		NSLog(@"URL = %@", URL);
		NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:URL];
		[m_pWebView loadRequest:temp_URLRequest];
		[self.view addSubview:m_pWebView];
		[m_pWebView sizeToFit];
		[m_pWebView setScalesPageToFit:YES];
		[m_pWebView release];
	}
	
	
	
	
	
	
	
	
	for(int i=0;i<5;i++)
	{
		if(i==0)
		{
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412,64,48);
			[self.view addSubview:btnfoot];
		}
		else 
		{
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
	
	self.navigationItem.title = @"最新資訊";
	if([[NSFileManager defaultManager] fileExistsAtPath:c_offline] == NO)
	{
		UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0, 320.0, 480.0-64-45)];
		[m_pWebView setDelegate:self];
		
		
		[m_pWebView setOpaque:NO];
		[m_pWebView setScalesPageToFit:YES];
		
		NSURL *temp_URL = [[NSURL alloc]initWithString:c_ol];
		NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
		[m_pWebView loadRequest:temp_URLRequest];
		[self.view addSubview:m_pWebView];
		[m_pWebView sizeToFit];
		[m_pWebView setScalesPageToFit:YES];
		[m_pWebView release];
	}
	else {
		UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0, 320.0, 480.0-64-45)];
		[m_pWebView setDelegate:self];
		[m_pWebView setOpaque:NO];
		[m_pWebView setScalesPageToFit:YES];
		NSURL *URL = [[NSURL alloc] initFileURLWithPath:c_offline];
		NSLog(@"URL = %@", URL);
		NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:URL];
		[m_pWebView loadRequest:temp_URLRequest];
		[self.view addSubview:m_pWebView];
		[m_pWebView sizeToFit];
		[m_pWebView setScalesPageToFit:YES];
		[m_pWebView release];
	}
	
	
}

-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}



- (void)webViewDidFinishLoad:(UIWebView *)webView { 
	NSString* str1 = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	NSLog(@"1111%@",str1);
	[myMainView loadingStop];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	NSString* str = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	NSLog(@"1%@",str);
	[myMainView startLoad];
} 

-(void)back:(id)sender
{
	[myMainView loadingStop];
	[self.navigationController popViewControllerAnimated:YES];
}



-(void)next:(id)sender
{
	
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"3"];
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"0"];
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


- (void)dealloc {
    [super dealloc];
	[topbar release];
	[btnfoot release];
	[c_I release];
	[BTN release];
	
	
}


@end
