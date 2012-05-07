//
//  TipsNext.mm
//  New_Projects
//
//  Created by chen cool on 11-9-27.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TipsNext.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
extern MainView *myMainView;
extern int all;
@implementation TipsNext

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
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:topbar];
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	
	
	
	
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 45, 320, 480-45-48)];
	[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:IMG];
	
	
	
	
	UILabel *tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=@"旅遊錦囊";
	tittle1.textColor = [UIColor whiteColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font = [UIFont systemFontOfSize:20];
	[self.view addSubview:tittle1];
	[tittle1 release];
	
	
	
	
	UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"旅遊錦囊";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font = [UIFont systemFontOfSize:20];
	[self.view addSubview:tittle];
	[tittle release];
	
	
	
	NextBtn = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[NextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside]; 
	[NextBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"btn"] ofType:@"png"]] forState:UIControlStateNormal];
	[NextBtn setFrame:CGRectMake(320-60,3,60,40)];
	//NextBtn.hidden=YES;
	[self.view addSubview:NextBtn];
	
	
	UIViewController * webViewController = [self createWebViewController: @"http://google.com/"];
	[self.navigationController pushViewController: webViewController animated: TRUE];
	[webViewController release];
	//[self createWebViewController:@"http://google.com/"];
	
	
}
-(void)dosomething2
{
	
	self.navigationItem.title = @"旅遊錦囊";
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-45-48)];
	[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:IMG];
	
	
	
	
	UIViewController * webViewController = [self createWebViewController: @"http://google.com/"];
	[self.navigationController pushViewController: webViewController animated: TRUE];
	[webViewController release];
	//[self createWebViewController:@"http://google.com/"];
	
	
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


-(UIViewController *) createWebViewController: (NSString *) urlString{
	UIViewController * webViewController = [[UIViewController alloc] init];
	if (all==0) {
		UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45, 320, 368)];
		NSURL *url = [NSURL URLWithString: urlString];
		NSString *body = nil;//[NSString stringWithFormat: @"booking_id=%@&tour_code=%@", @"1",@"2"];
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
		[request setHTTPMethod: @"POST"];
		[request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
		[webView loadRequest: request];
		NSBundle * b = [NSBundle mainBundle];
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"visa" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"visa/index" ofType:@"html"]isDirectory:NO]]];
		[webViewController.view addSubview: webView];
		
	}
	else {
		UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 368)];
		NSURL *url = [NSURL URLWithString: urlString];
		NSString *body = nil;//[NSString stringWithFormat: @"booking_id=%@&tour_code=%@", @"1",@"2"];
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
		[request setHTTPMethod: @"POST"];
		[request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
		[webView loadRequest: request];
		NSBundle * b = [NSBundle mainBundle];
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"visa" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"visa/index" ofType:@"html"]isDirectory:NO]]];
		[webViewController.view addSubview: webView];
		
	}

	
	
	
	
	if (all==0) {
		UIImageView *topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
		[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
		//topbar.backgroundColor = [UIColor lightGrayColor];
		[webViewController.view addSubview:topbar];
		
		UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
		footbar.backgroundColor=[UIColor blackColor];
		[webViewController.view addSubview:footbar];
		
		
		
		UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 45, 320, 480-45-48)];
		[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
		//topbar.backgroundColor = [UIColor lightGrayColor];
		//[webViewController addSubview:IMG];
		
		
		
		UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
		[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
		[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"back_button"] ofType:@"png"]] forState:UIControlStateNormal];
		btnback.frame = CGRectMake(0,10,55,26);
		[webViewController.view addSubview:btnback];
		
		
		UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
		tittle.text=@"旅遊錦囊";
		tittle.textColor = [UIColor whiteColor];
		tittle.backgroundColor = [UIColor clearColor];
		tittle.textAlignment = UITextAlignmentCenter;
		tittle.font = [UIFont systemFontOfSize:20];
		[webViewController.view addSubview:tittle];
		[tittle release];
		
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
	}
	else {
		
		
	}

	
	
	
	return webViewController;
}



-(void)back:(id)sender
{
	
	[self.navigationController popViewControllerAnimated:YES];
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
