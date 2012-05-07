//
//  Tips2_pdf.mm
//  New_Projects
//
//  Created by chen cool on 11-10-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tips2_pdf.h"
#import "PDFScrollView.h"
#import "MainView.h"
extern MainView *myMainView;
extern int all;

@implementation Tips2_pdf
@synthesize c_xml;
//#define AppMainMenuImg_Dic				[NSHomeDirectory() stringByAppendingString:@"/Documents/"]


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
	
	
	//NSString *MainMenuImgStorePath = AppMainMenuImg_Dic;
	
	
	//[myMainView startLoad];
	
	//PDFScrollView *temp_PDF = [[PDFScrollView alloc] initWithFrame:CGRectMake(0.0, 45, 320.0, 480.0-64-45)];
	
	//NSURL *PDF_URL = [[NSURL alloc] initWithString:c_xml];
//	[temp_PDF BookReadView_URL:PDF_URL];
//	[self.view addSubview:temp_PDF];
//	[PDF_URL release];
	
	//NSLog(@"%@",c_xml);
	UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 45, 320.0, 480.0-64-45)];
	//[m_pWebView setDelegate:self];
	
	
	[m_pWebView setOpaque:NO];
	[m_pWebView setScalesPageToFit:YES];
	//@"http://www.sunflower.com.hk/visa/Page04-05%E6%97%A5%E6%9C%AC.pdf"
	
	NSURL *temp_URL = [[NSURL alloc]initWithString:c_xml];
	NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	[self.view addSubview:m_pWebView];
	[m_pWebView sizeToFit];
	[m_pWebView setScalesPageToFit:YES];
	[m_pWebView release];
	
	
	
	
	
	
	//[myMainView loadingStop];
	
	
	
	btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	
	
	
	self.navigationItem.hidesBackButton=YES;
    
	
	UIImageView *topbar1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:topbar1];
	
	
	
	UILabel *tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle1.text=@"";
	tittle1.textColor = [UIColor whiteColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	//tittle1.font = [UIFont systemFontOfSize:20];
	tittle1.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle1];
	[tittle1 release];
	
	//[self.navigationController.navigationBar addSubview:btnback];
	[self.view addSubview:btnback];
	for(int i=0;i<5;i++)
	{
		if(i==4)
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

-(void)back:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"PDFFinish" object:nil];
	
	btnback.hidden=YES;
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
