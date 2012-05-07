//
//  FavoriteBook.mm
//  New_Projects
//
//  Created by chen cool on 11-9-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FavoriteBook.h"
#import "PDFScrollView.h"
#import "MainView.h"
#import "facebook.h"
extern MainView *myMainView;
extern int all;
extern int XX;
@implementation FavoriteBook
@synthesize c_xml,c_pack,c_name;




// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	XX=0;
	[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];
	m_pAppDelegate = [[UIApplication sharedApplication] delegate];
	
	if (all==0) {
		[self dosomething1];
	}
	else {
		[self dosomething2];
	}
	
    _FavoriteBook = [[FavoriteBook alloc]init];
    _FavoriteBook.c_xml=c_xml;
    _FavoriteBook.c_pack=c_pack;
    _FavoriteBook.c_name=c_name;
    
}



- (void)webViewDidFinishLoad:(UIWebView *)webView { 
	
	twoboyview.hidden=YES;
	[myMainView loadingStop];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	//NSString* str = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	//NSLog(@"1%@",str);
	[myMainView startLoad];
} 



-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch (buttonIndex) {
		case 0:
			NSLog(@"1");
			m_pAppDelegate = [[UIApplication sharedApplication] delegate];
			m_pAppDelegate.m_pShareText = c_name;
			m_pAppDelegate.m_pSharepdf=c_xml;
			[facebook facebooklogin];
			
			break;
			
		case 1:
			[self showPicker];
			break;
		case 2:
			NSLog(@"2");
			
			c_telt=[[NSString alloc] initWithFormat:@"%@%@",@"2722",@"8888"];
			
			telAray = [c_telt componentsSeparatedByString:@" "];
			str = @"tel://";
			for(int i=0;i<[telAray count];i++)
			{
				tmpstr = [NSString stringWithString:str];
				str = [NSString stringWithFormat:@"%@%@",tmpstr,[telAray objectAtIndex:i]];
			}
			NSLog(@"str:%@",str);
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
			
			
			break;
		
			
		default:
			break;
	}
}


-(void)dosomething1
{
	
	[myMainView startLoad];
	
	
	twoboyview=[[UIView alloc] init];
	twoboyview.frame=CGRectMake(0, 0, 320, 460);
	twoboyview.backgroundColor=[UIColor clearColor];
	
	
	UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 45, 320.0, 480.0-64-45)];
	[m_pWebView setDelegate:self];
	
	
	[m_pWebView setOpaque:NO];
	[m_pWebView setScalesPageToFit:YES];
	
	
	NSURL *temp_URL = [[NSURL alloc]initWithString:c_xml];
	NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	[self.view addSubview:m_pWebView];
	[m_pWebView sizeToFit];
	[m_pWebView setScalesPageToFit:YES];
	[m_pWebView release];
	
	[myMainView loadingStop];
	
	
	
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
	
	
	
	
	UIImageView *c_fav=[[UIImageView alloc]initWithFrame:CGRectMake(320-45+2,9+2,23,18)];
	[c_fav setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_my_fav"] ofType:@"png"]]];
	[self.view addSubview:c_fav];
	[c_fav release];
	
	
	
	UIButton *btnback1 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback1 addTarget:self action:@selector(send:)forControlEvents:UIControlEventTouchUpInside];
	btnback1.frame = CGRectMake(320-45-45,0,100,45);
	[self.view addSubview:btnback1];
	
	
	
	[self.view addSubview:btnback];
	
	
	[self.view addSubview:twoboyview];
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
-(void)dosomething2
{
	//[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];
	//self.navigationItem.title = @"我的最愛";
	
	[myMainView startLoad];
	
	//PDFScrollView *temp_PDF = [[PDFScrollView alloc] initWithFrame:CGRectMake(0.0, 44.0, 320.0, 480.0-44-64)];
	//	NSURL *PDF_URL = [[NSURL alloc] initWithString:c_xml];
	//	[temp_PDF BookReadView_URL:PDF_URL];
	//	[self.view addSubview:temp_PDF];
	UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 0, 320.0, 480.0-64-45)];
	[m_pWebView setDelegate:self];
	
	
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
	
	[myMainView loadingStop];
	
	
	
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
											  cancelButtonTitle:@"Cancel" 
										 destructiveButtonTitle:nil otherButtonTitles:
							@"Facebook分享",@"Email分享",@"聯繫我們",nil]autorelease];
	//menu.alpha=0.8;
	menu.frame=CGRectMake(0, 0, 320, 480);
	
	menu.tag = 123;
	UIView *c_uiview=[[UIView alloc]init];
	c_uiview.frame=CGRectMake(0, 0, 320, 100);
	c_uiview.backgroundColor=[UIColor blackColor];
	//[menu addSubview:c_uiview];
	
	UILabel *c_img =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
	c_img.backgroundColor=[UIColor clearColor];
	c_img.text=c_pack;
	c_img.font = [UIFont boldSystemFontOfSize:16];
	c_img.textAlignment = UITextAlignmentCenter;
	[menu addSubview:c_img];
	//[self.view addSubview:menu];
	//[menu showInView:self.view];
	[menu showInView:m_pAppDelegate.theView.view];
}


-(void)back:(id)sender
{
//	NSLog(@"11111");
	[myMainView loadingStop];
	[self.navigationController popViewControllerAnimated:YES];
	
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"PDFFinish" object:nil];
	
	btnback.hidden=YES;
	
	
	if([m_pTimer isValid])
	{
		[m_pTimer invalidate];
	}
	m_pTimer = nil;
	if (pickers) {
		[pickers.view removeFromSuperview];
		[pickers release];
		pickers=nil;
		
	}
}



//email
//============================================================================================

- (void)replaceWithNoAnimationOldSubview:(UIView *)oldView 
						  WithNewSubview:(UIView *)newView 
						   FromSuperview:(UIView *)superView {
	if(superView == nil)
		superView = newView.superview;
	
	if(oldView == nil) {
		[superView addSubview:newView];
		[superView bringSubviewToFront:newView];
	}
	
	else {		
		[newView setUserInteractionEnabled:YES];
		[oldView setUserInteractionEnabled:NO];
		
		[superView insertSubview:newView aboveSubview:oldView];
		[oldView removeFromSuperview];
	}
}


- (void)PFreplaceSubview:(UIView *)oldView 
			 withSubview:(UIView *)newView 
		   fromSuperview:(UIView *)superView 
			  transition:(NSString *)transition 
			   direction:(NSString *)direction 
				duration:(NSTimeInterval)duration 
			    Delegate:(id)delegate {	
	
	// Set up the animation
	CATransition *animation = [CATransition animation];
	[animation setDelegate:delegate];
	
	
	// Set the type and if appropriate direction of the transition, 
	if (transition == kCATransitionFade) {
		[animation setType:kCATransitionFade];
	} else {
		
		[animation setType:transition];
		[animation setSubtype:direction];
	}
	
	// Set the duration and timing function of the transtion -- duration is passed in as a parameter, use ease in/ease out as the timing function
	[animation setDuration:duration];
	[animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];//kCAMediaTimingFunctionEaseInEaseOut
	
	[[superView layer] addAnimation:animation forKey:@"transitionViewAnimation"];
	
	
	[self replaceWithNoAnimationOldSubview:oldView WithNewSubview:newView FromSuperview:superView];
	
}

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
	
	[pickers setSubject:c_name];
	NSArray *shop_narray1 = [[NSArray alloc] initWithObjects:@"",nil];
	[pickers setToRecipients:shop_narray1];
	UIImage *drawImage = [self emailphoto];
	
	//drawImage.transform = CGAffineTransformMakeRotation(3.1415926*0.5);
	
	if(drawImage !=nil)
	{	
		//NSData *myData = UIImagePNGRepresentation(drawImage);
		//[pickers addAttachmentData:myData mimeType:@"image/png" fileName:@"myphoto"];
	}
	
	
	NSString *emailBody =[[NSString alloc]initWithFormat:@"%@\n\n%@",c_xml,@"如有查詢，請聯絡熱線中心 2722-9260。"];	
	//NSString *emailBody =c_xml;
	[pickers setMessageBody:emailBody isHTML:NO];
	//[self presentModalViewController:pickers animated:YES];
	[pickers.view setFrame:CGRectMake(0, 0, 320, 460)];
	[self.view addSubview:pickers.view];
    
//    [self PFreplaceSubview:_FavoriteBook.view 
//               withSubview:pickers.view 
//             fromSuperview:self.view  
//                transition:kCATransitionReveal 
//                 direction:kCATransitionFromRight 
//                  duration:0.3
//                  Delegate:nil];
	//[self StartTimer];
	
	
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
//    [self PFreplaceSubview:_FavoriteBook.view 
//               withSubview:pickers.view 
//             fromSuperview:self.view  
//                transition:kCATransitionReveal 
//                 direction:kCATransitionFromLeft 
//                  duration:0.3
//                  Delegate:nil];
    [pickers.view removeFromSuperview];
    [pickers release];
    pickers = nil;
	//[self StartTimer2];
	//[self dismissModalViewControllerAnimated:YES];
	//[scrollview setContentOffset:CGPointMake(320,0) animated:YES];
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
	[btnfoot release];
}





-(void)AnimetionUpdate
{
	
	XX++;
	if (XX<26) {
		if (XX%1==0) {
			pickers.view.frame=CGRectMake(0, 500-20*XX, 320, 480-48);
			
		}
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
		
		m_pTimer = nil;
	}
}



-(void)StartTimer
{
	XX=0;
	
	[self DestroyTimer];
	m_pTimer = [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(AnimetionUpdate) userInfo:nil repeats:YES];
}



-(void)AnimetionUpdate2
{
	
	XX++;
	if (XX<26) {
		if (XX%1==0) {
			pickers.view.frame=CGRectMake(0, 20*XX, 320, 480-48);
			
		}
	}
	
}



-(void)DestroyTimer2
{
	if(m_pTimer)
	{
		if([m_pTimer isValid])
		{
			[m_pTimer invalidate];
		}
		m_pTimer = nil;
	}
	
}



-(void)StartTimer2
{
	XX=0;
	
	[self DestroyTimer2];
	m_pTimer = [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(AnimetionUpdate2) userInfo:nil repeats:YES];
}



@end
