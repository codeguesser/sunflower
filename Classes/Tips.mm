//
//  Tips.mm
//  New_Projects
//
//  Created by chen cool on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tips.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
#import "TipsNext.h"
#import "Tips5.h"
#import "Tips2.h"
#import "Tips3.h"
#import "Tips1.h"
extern MainView *myMainView;
extern int all;

extern BOOL g_isHaveNetwork;

@implementation Tips
@synthesize titles;
@synthesize tittle,tittle1;

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
    bFirstLoadWebView=YES;
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
	myMainView.c_maintittle.text=@"111";
	myMainView.c_maintittle1.text=@"111";
	
	
	self.view.backgroundColor=[UIColor grayColor];
	indexIconNames = [[NSArray alloc] initWithObjects:@"icon_tips_chatis.png", @"icon_tips_visa.png", @"icon_tips_others.png", @"icon_tips_tel.png", @"icon_tips_branch.png", @"address.png", nil];
	
	titles = [[NSArray alloc] initWithObjects:@"旅遊保險", @"簽證", @"其他地區資訊",@"熱線電話指南",@"分行地址", nil];
	
	
	
	//[self.navigationController.navigationBar initWithFrame:CGRectMake(0, 0, 160, 45)];
	[self.navigationController.navigationItem setTitleView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 25)]];
	
	
	//[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];
	
	
	
	topbar1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	[footbar release];
	
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-48)];
	//[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	IMG.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	
	//IMG.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:IMG];
	
	
	//[self.navigationController.navigationBar addSubview:topbar1];
	[self.view addSubview:topbar1];
	
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar1 addSubview:c_I];
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	//[self.navigationController.navigationBar addSubview:BTN];
	[self.view addSubview:BTN];
	
	
	
	tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=@"旅遊錦囊";
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font = [UIFont boldSystemFontOfSize:20];
	//[topbar1 addSubview:tittle1];
	
	//[self.navigationController.navigationBar addSubview:topbar1];
	//[self.navigationController.navigationBar insertSubview:topbar1 atIndex:0];
	
	self.navigationItem.title = @"旅遊錦囊";
	
	tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"旅遊錦囊";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font = [UIFont boldSystemFontOfSize:20];
	[topbar1 addSubview:tittle];
	//[topbar1 release];
	
	
	
	NextBtn = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[NextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside]; 
	[NextBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"iicon"] ofType:@"png"]] forState:UIControlStateNormal];
	[NextBtn setFrame:CGRectMake(320-60,3,60,40)];
	
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,5+45, 310, 240) style:UITableViewStyleGrouped];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	[c_tableview setScrollEnabled:NO];
	c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
	[self.view addSubview:c_tableview];
	
	UIImageView *c_image=[[UIImageView alloc]init];
	[c_image setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"banner3"] ofType:@"png"]]];
	c_image.frame=CGRectMake(15, 250+45, 290, 80);
	c_image.backgroundColor=[UIColor clearColor];    
	//[self.view addSubview:c_image];
	[c_image release];
	
	
	UIButton *c_Btn = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[c_Btn addTarget:self action:@selector(c_btn:) forControlEvents:UIControlEventTouchUpInside]; 
	[c_Btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"banner3"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_Btn setFrame:CGRectMake(15, 250+45, 290, 80)];
	[self.view addSubview:c_Btn];
	
	
	
	
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
	
	
	self.view.backgroundColor=[UIColor grayColor];
	indexIconNames = [[NSArray alloc] initWithObjects:@"icon_tips_chatis.png", @"icon_tips_visa.png", @"icon_tips_others.png", @"icon_tips_tel.png", @"icon_tips_branch.png", @"address.png", nil];
	
	titles = [[NSArray alloc] initWithObjects:@"旅遊保險", @"簽證", @"其他地區資訊",@"熱線電話指南",@"分行地址", nil];
	
	
	
	self.navigationItem.title = @"旅遊錦囊";
	
	
	
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,5, 310, 240) style:UITableViewStyleGrouped];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	[c_tableview setScrollEnabled:NO];
	c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
	[self.view addSubview:c_tableview];
	
	UIImageView *c_image=[[UIImageView alloc]init];
	[c_image setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"banner3"] ofType:@"png"]]];
	c_image.frame=CGRectMake(15, 250, 290, 80);
	c_image.backgroundColor=[UIColor clearColor];    
	//[self.view addSubview:c_image];
	[c_image release];
	
	
	UIButton *c_Btn = [[[UIButton buttonWithType:UIButtonTypeCustom]retain]autorelease];
	[c_Btn addTarget:self action:@selector(c_btn:) forControlEvents:UIControlEventTouchUpInside]; 
	[c_Btn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"banner3"] ofType:@"png"]] forState:UIControlStateNormal];
	[c_Btn setFrame:CGRectMake(15, 250, 290, 80)];
	[self.view addSubview:c_Btn];
	
	
	
}


-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}

-(void)c_btn:(id)sender
{

	//UIAlertView *netWorkError5 = 
//	[[UIAlertView alloc] 
//	 initWithTitle:@"該網頁需要在瀏覽器中打開，是否打開?" 
//	 message:@"" 
//	 delegate:self 
//	 cancelButtonTitle:@"NO" 
//	 otherButtonTitles:@"YES",nil];
//	[netWorkError5 show];
//	[netWorkError5 release];
	
	
    Tips1 *c_tips1=[[Tips1 alloc]init];
	[self.navigationController pushViewController:c_tips1 animated:YES];


}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch(buttonIndex)
	{
		case 0:
			//[self showPicker];
			break;
		case 1:
		
			
			break;
	}
}

-(void)next:(id)sender
{
	
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"1"];
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"2"];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
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
		int x = indexPath.row;
		//cell.imageView.image =  [UIImage imageNamed:[indexIconNames objectAtIndex:x]];
		//[cell.textLabel setText: [titles objectAtIndex: indexPath.row]];
				
		
		if (indexPath.row==0) {
			UIImageView *c_image2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"apps_tips5_03.png"]];
			c_image2.frame=CGRectMake(130, 5, 83, 31);
			c_image2.backgroundColor=[UIColor clearColor];    
			[cell.contentView addSubview:c_image2];
			[c_image2 release];
		}
		UIImageView *c_image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[indexIconNames objectAtIndex:x]]];
		c_image.frame=CGRectMake(5, 4, 37, 37);
		c_image.backgroundColor=[UIColor clearColor];    
		[cell.contentView addSubview:c_image];
		[c_image release];
		
		
		
		UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(45, 2, 260, 45)];
		c_textview.text=[titles objectAtIndex: indexPath.row];
		[cell.contentView addSubview:c_textview];
		c_textview.backgroundColor=[UIColor clearColor];
		c_textview.userInteractionEnabled=NO;
		//c_textview.font = [UIFont systemFontOfSize:18];
		c_textview.font=[UIFont boldSystemFontOfSize:18];
		[c_textview release];
		
		
		UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(265, 8, 25*0.6, 38*0.6)];
		[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
		//topbar.backgroundColor = [UIColor lightGrayColor];
		[cell.contentView addSubview:C_IMG];
		
	}
	
	[SimpleTableIdentifier release];
	SimpleTableIdentifier = nil;
	
	return cell;
}

- (void)tableView:(UITableView *)c_tableview willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	cell.backgroundColor = [UIColor whiteColor];
}



- (CGFloat)tableView:(UITableView *)c_tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 45;
	
}


- (void)tableView:(UITableView *)c_tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(g_isHaveNetwork)
    {
        UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
        [cell setSelected:NO];
        
        if (indexPath.row ==0) {
            
            bundle=[[NSString alloc]initWithFormat:@"0"];
            UIViewController * webViewController = [self createWebViewController: @"http://google.com/"];
            [self.navigationController pushViewController: webViewController animated: YES];
            [webViewController release];
        }
        else if (indexPath.row==1) {
            
            Tips2 *c_Tips2=[[Tips2 alloc]initWithNibName:@"Tips2" bundle:nil];
            
            [self.navigationController pushViewController:c_Tips2 animated:YES];
            
            
        }
        else if (indexPath.row==2) {
            
            
            
            Tips3 *c_Tips3=[[Tips3 alloc]initWithNibName:@"Tips3" bundle:nil];
            [self.navigationController pushViewController:c_Tips3 animated:YES];
            
            
            
        }
        else if(indexPath.row==3){
            bundle=[[NSString alloc]initWithFormat:@"3"];
            UIViewController * webViewController = [self createWebViewController:@"http://google.com/"];
            
            [self.navigationController pushViewController: webViewController animated: YES];
            [webViewController release];
        }
        else if(indexPath.row==4){
            
            
            Tips5 *c_Tips5=[[Tips5 alloc]initWithNibName:@"Tips5" bundle:nil];
            [c_Tips5 settype:1];
            [self.navigationController pushViewController:c_Tips5 animated:YES];
            
        }
    }
	

	
	
}


-(void)back:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}
-(void)back1:(id)sender
{
    if(!m_pSaveURL)
    {
        tittle.text=@"旅遊錦囊";
        
        [self.view addSubview:tittle];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:NO];
        bundle=[[NSString alloc]initWithFormat:@"0"];
        UIViewController * webViewController = [self createWebViewController: @"http://google.com/"];
        [self.navigationController pushViewController: webViewController animated: NO];
        [webViewController release];
    }
}



-(NSInteger)tableView:(UITableView *)c_tableview numberOfRowsInSection:(NSInteger)section
{
	return [titles count];
}



- (void)webViewDidStartLoad:(UIWebView *)webView {
	NSString* str = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
    

	NSLog(@"1%@",str);
    if(bFirstLoadWebView)
    {
        [myMainView startLoad];
    }
} 

- (void)webViewDidFinishLoad:(UIWebView *)webView { 
	NSString* str1 = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	NSLog(@"tips: %@",str1);
    if([str1 rangeOfString:@"pdf"].length >0|| [str1 rangeOfString:@"faq"].length >0
       ||[str1 rangeOfString:@"contactchartis"].length > 0 ||[str1 rangeOfString:@"aboutchartis"].length > 0)
    {
        [m_pSaveURL release];
        m_pSaveURL = nil;
        
        m_pSaveURL = [str1 copy];
    }
    else
    {
        [m_pSaveURL release];
        m_pSaveURL = nil;
    }
    
    if(bFirstLoadWebView)
    {
        [myMainView loadingStop];
    }
    else
    {
        bFirstLoadWebView=YES;
    }
}
-(UIViewController *) createWebViewController: (NSString *) urlString{

	
	UIViewController * webViewController = [[UIViewController alloc] init];

    
	UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45, 320, 368)];
	webView.delegate=self;
	[webView setScalesPageToFit:YES];
	
	
	NSURL *url = [NSURL URLWithString: urlString];
    NSString *body = nil;
	
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
	
    [webView loadRequest: request];
    NSBundle * b = [NSBundle mainBundle];
	
	

	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	
	
	
	if ([bundle isEqualToString:@"0"]) {
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"visa" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"chartis" ofType:@"html"]isDirectory:NO]]];
	
		
		[webViewController.navigationController.navigationBar insertSubview:topbar atIndex:0];
		
		
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

        NSString *path = [c pathForResource:@"hotline" ofType:@"html" inDirectory:@"aboutus"];
        NSLog(@"url path: %@", path);
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:path isDirectory:NO]]];
		tittle1.text=@"熱線電話指南";
		tittle.text=@"熱線電話指南";
		webView.frame=CGRectMake(0, 45, 320, 368+45);
	}
	else {
		NSBundle * c = [NSBundle bundleWithPath:
						[b pathForResource:@"location" ofType:@"bundle"]];
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"map" ofType:@"html"]isDirectory:NO]]];
		tittle1.text=@"分行地址";
		tittle.text=@"分行地址";
	}
	
    NSArray *sv = [NSArray arrayWithArray:[webView subviews]];
    UIScrollView *scrollView = (UIScrollView *)[sv objectAtIndex:0];
	scrollView.bounces=NO;
    
	[webViewController.view addSubview: webView];
	[webViewController.view addSubview:topbar];
	
	m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-48-45)];
	[m_pWebView setDelegate:self];
	[m_pWebView setOpaque:NO];
	
	
	//temp_URL = [[NSURL alloc]initWithString:@"http://www.hksunflower.com/enquiry/teacheck.asp" ];
	temp_URL = [[NSURL alloc]initWithString:@"http://www.ibrand.hk/client/sunflower/offlinehtml/index.html" ];
	
	temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
	[m_pWebView loadRequest:temp_URLRequest];
	//[webViewController.view addSubview:m_pWebView];
	[m_pWebView release];
	
	
	
	//[topbar addSubview:tittle1];
	[topbar addSubview:tittle];
	
	
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[webViewController.view addSubview:footbar];
	[footbar release];
	
	
	
	
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 45, 320, 480-45-48)];
	[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	//[webViewController addSubview:IMG];
	
	
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
	[btnback addTarget:self action:@selector(back1:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[webViewController.view addSubview:btnback];
	
	
	
	
	
	
	
	
	
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
