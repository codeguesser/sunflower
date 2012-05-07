//
//  Tips1.mm
//  New_Projects
//
//  Created by chen cool on 11-11-9.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tips1.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
extern MainView *myMainView;
extern int all;
@implementation Tips1

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
	
	
	if (all==0) {
		[self dosomething1];
	}
	else {
		[self dosomething2];
	}
	
	
	
}


-(void)dosomething1
{
	UIImageView *topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	
	[self.view addSubview:topbar];
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	[footbar release];
	
	
	
	
	UIImageView *c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar addSubview:c_I];
	
	UIButton *BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	//[self.navigationController.navigationBar addSubview:BTN];
	[self.view addSubview:BTN];
	
	UILabel *tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=@"";
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font = [UIFont boldSystemFontOfSize:20];
	[topbar addSubview:tittle1];
	
	
	
	UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font = [UIFont boldSystemFontOfSize:20];
	[topbar addSubview:tittle];
	[topbar release];
	
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	
	
	
	m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45, 320, 480-48-45-20)];
	[m_pWebView setDelegate:self];
	[m_pWebView setOpaque:NO];
	//[m_pWebView scalesPageToFit];
	m_pWebView.scalesPageToFit=YES;
	//temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
	temp_URL = [[NSURL alloc]initWithString:@"http://www.chartisinsurance.com.hk/index_tc.html"];
	
	temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	[self.view addSubview:m_pWebView];
	[m_pWebView release];
	
	
	
}
-(void)dosomething2
{
	
	
	
	
	
	m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-48-45-20)];
	[m_pWebView setDelegate:self];
	[m_pWebView setOpaque:NO];
	//[m_pWebView scalesPageToFit];
	m_pWebView.scalesPageToFit=YES;
	//temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
	temp_URL = [[NSURL alloc]initWithString:@"http://www.chartisinsurance.com.hk"];
	
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


-(void)next:(id)sender
{
	
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"2"];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
}
-(void)back:(id)sender
{
	[myMainView loadingStop];
	[self.navigationController popViewControllerAnimated:YES];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView { 
	//NSString* str1 = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	//NSLog(@"tips1: %@",str1);
	[myMainView loadingStop];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	//NSString* str = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	[myMainView startLoad];
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
}


@end
