//
//  EnquiryViewMy.mm
//  New_Projects
//
//  Created by chen cool on 11-9-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EnquiryViewMy.h"

#import "MainView.h"
#import "EnquirViewMyWeb.h"
#import "Tips5.h"

extern MainView *myMainView;
extern int all;

@implementation EnquiryViewMy

@synthesize backkind;
@synthesize c_tabbtn;


- (void)buttonaction
{
    Tips5 *c_Tips5=[[Tips5 alloc]initWithNibName:@"Tips5" bundle:nil];
    [c_Tips5 settype:0];
    [self.navigationController pushViewController:c_Tips5 animated:NO];
    //            NSBundle * c = [NSBundle bundleWithPath:
    //                            [b pathForResource:@"location" ofType:@"bundle"]];
    //            [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"map" ofType:@"html"]isDirectory:NO]]];
    tittle.text=@"分行地址";
    tittle3.text=@"分行地址";
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];
	
    _button = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
    [_button setFrame:CGRectMake(0, 403, 320, 40)];
    [_button addTarget:self action:@selector(buttonaction) forControlEvents:UIControlEventTouchUpInside];
	
	if (all==0) {
		[self dosomething1];
	}
	else {
		[self dosomething2];
	}
	
	
	
}


-(void)dosomething1
{
	c_number=0;
	
	
	UIImageView *IMG1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-48)];
	//[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	IMG1.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	
	//IMG.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:IMG1];
	
	titles = [[NSArray alloc] initWithObjects:@"公司資料", @"公司網頁", @"免責聲明", 
              //@"熱線電話指南",
              //@"分行地址",
              nil];
	
	
	UIImageView *topbar1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:topbar1];
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	[footbar release];
	
	
	
	c_Secret1 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_Secret1 addTarget:self action:@selector(se1:)forControlEvents:UIControlEventTouchUpInside];
	c_Secret1.frame = CGRectMake(0,300,75,75);
	//c_Secret1.backgroundColor=[UIColor blueColor];
	[self.view addSubview:c_Secret1];
	
	
	
	
	
	c_Secret2 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_Secret2 addTarget:self action:@selector(se2:)forControlEvents:UIControlEventTouchUpInside];
	c_Secret2.frame = CGRectMake(105,205,75,75);
	//c_Secret2.backgroundColor=[UIColor blackColor];
	[self.view addSubview:c_Secret2];
	
	
	
	
	
	c_Secret3 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_Secret3 addTarget:self action:@selector(se3:)forControlEvents:UIControlEventTouchUpInside];
	//c_Secret3.backgroundColor=[UIColor redColor];
	c_Secret3.frame = CGRectMake(220,300,75,75);
	[self.view addSubview:c_Secret3];
	
	
	
	
	UILabel *tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=@"關於我們";
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	//tittle1.font = [UIFont systemFontOfSize:20];
	tittle1.font=[UIFont boldSystemFontOfSize:20];
	//[self.view addSubview:tittle1];
	[tittle1 release];
	
	UILabel *tittle2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle2.text=@"關於我們";
	tittle2.textColor = [UIColor whiteColor];
	tittle2.backgroundColor = [UIColor clearColor];
	tittle2.textAlignment = UITextAlignmentCenter;
	//tittle1.font = [UIFont systemFontOfSize:20];
	tittle2.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle2];
	[tittle2 release];
	
	
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,5+45, 310, 180+90) style:UITableViewStyleGrouped];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	[c_tableview setScrollEnabled:NO];
	c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
	[self.view addSubview:c_tableview];
	
	
	
	scrollview = [[UIScrollView alloc] init];
	scrollview.frame=CGRectMake(0, 45, 320, 480-45-48);
	scrollview.contentSize = CGSizeMake(320,521);
	scrollview.pagingEnabled = YES;
	scrollview.delegate=self;
	scrollview.backgroundColor=[UIColor clearColor];
	
	//scrollview.delegate=self;
	//[self.view addSubview:scrollview];
	
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 521)];
	[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"company_info"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[scrollview addSubview:IMG];
	
	
	verison=[[UILabel alloc]initWithFrame:CGRectMake(190, 350, 150, 20)];
	verison.backgroundColor=[UIColor clearColor];
    [verison setTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
	verison.text=@"Version 1.02.02";
	verison.hidden=YES;
	[self.view addSubview:verison];
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	for(int i=0;i<5;i++)
	{
		if(i==[c_tabbtn intValue])
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
	c_number=0;
	self.navigationItem.title = @"關於我們";
	
	UIImageView *IMG1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-48)];
	//[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	IMG1.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	
	//IMG.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:IMG1];
	
	
	
	
	c_Secret1 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_Secret1 addTarget:self action:@selector(se1:)forControlEvents:UIControlEventTouchUpInside];
	c_Secret1.frame = CGRectMake(0,300-45,75,75);
	//c_Secret1.backgroundColor=[UIColor blueColor];
	[self.view addSubview:c_Secret1];
	
	
	
	
	
	c_Secret2 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_Secret2 addTarget:self action:@selector(se2:)forControlEvents:UIControlEventTouchUpInside];
	c_Secret2.frame = CGRectMake(105,205-45,75,75);
	//c_Secret2.backgroundColor=[UIColor blackColor];
	[self.view addSubview:c_Secret2];
	
	
	
	
	
	c_Secret3 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_Secret3 addTarget:self action:@selector(se3:)forControlEvents:UIControlEventTouchUpInside];
	//c_Secret3.backgroundColor=[UIColor redColor];
	c_Secret3.frame = CGRectMake(220,300-45,75,75);
	[self.view addSubview:c_Secret3];
	
	
	
	
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,5, 310, 180+90) style:UITableViewStyleGrouped];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	[c_tableview setScrollEnabled:NO];
	c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
	[self.view addSubview:c_tableview];
	
	
	
	scrollview = [[UIScrollView alloc] init];
	scrollview.frame=CGRectMake(0, 45, 320, 480-45-48);
	scrollview.contentSize = CGSizeMake(320,521);
	scrollview.pagingEnabled = YES;
	scrollview.delegate=self;
	scrollview.backgroundColor=[UIColor clearColor];
	
	//scrollview.delegate=self;
	//[self.view addSubview:scrollview];
	
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 521)];
	[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"company_info"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[scrollview addSubview:IMG];
	
	
	verison=[[UILabel alloc]initWithFrame:CGRectMake(190, 350, 150, 20)];
	verison.backgroundColor=[UIColor clearColor];
    [verison setTextColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
	
	verison.text=@"Version 1.02.02";
	verison.hidden=YES;
	[self.view addSubview:verison];
	
	
}

-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}

-(IBAction)back:(UIButton *)sender
{
    if(!m_pSaveURL)
    {
        type = 0;
        if ([backkind isEqualToString:@"1"]) {
            //[self.navigationController setNavigationBarHidden:NO animated:NO];
            [self.navigationController popViewControllerAnimated:YES];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"PDFFinish" object:nil];
        }
        else {
            [self.navigationController popViewControllerAnimated:YES];
            //[self.navigationController popViewControllerAnimated:YES];
        }
    }
    else
    {
        bundle=[[NSString alloc]initWithFormat:@"0"];
		UIViewController * webViewController = [self createWebViewController: @"http://google.com/"];
		[self.navigationController pushViewController: webViewController animated: TRUE];
		
		[webViewController release];
    }
    
	[myMainView loadingStop];
}

-(IBAction)back2:(UIButton *)sender
{
    if(!m_pSaveURL)
    {
        type = 0;
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
    [myMainView loadingStop];
}





- (UITableViewCell *)tableView:(UITableView *)c_tv
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	
	UITableViewCell *cell = [c_tableview dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	if (cell == nil) {
		CGRect cellFrame = CGRectMake(0,0,320,65);
		cell = [[[UITableViewCell alloc] initWithFrame:cellFrame
									   reuseIdentifier:SimpleTableIdentifier] autorelease];
		//cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		// Set up the cell...
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
		//int x = indexPath.row;
		
		
		
		UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(5, 0, 260, 45)];
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
	UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
	[cell setSelected:NO];
	
	if (indexPath.row==0) {
		
        
		bundle=[[NSString alloc]initWithFormat:@"0"];
		UIViewController * webViewController = [self createWebViewController: @"http://google.com/"];
		[self.navigationController pushViewController: webViewController animated: TRUE];
		
		[webViewController release];
		
	}
	else if(indexPath.row==1)
	{
		//bundle=[[NSString alloc]initWithFormat:@"1"];
        //		UIViewController * webViewController = [self createWebViewController: @"http://google.com/"];
        //		[self.navigationController pushViewController: webViewController animated: TRUE];
        //		[webViewController release];
        //		
		EnquirViewMyWeb *c_EnquirViewMyWeb=[[EnquirViewMyWeb alloc]initWithNibName:@"EnquirViewMyWeb" bundle:nil];
		//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
		//c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"0"];
		//c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"3"];
		[self.navigationController pushViewController:c_EnquirViewMyWeb animated:YES];
		
		
		//EnquirViewMyWeb *c_EnquirViewMyWeb=[[EnquirViewMyWeb alloc]init];
		
	}
	else if(indexPath.row==2)
	{
		bundle=[[NSString alloc]initWithFormat:@"2"];
		UIViewController * webViewController = [self createWebViewController: @"http://google.com/"];
		[self.navigationController pushViewController: webViewController animated: TRUE];
		[webViewController release];
	}
    else if(indexPath.row == 3)
    {
        bundle =  [[NSString alloc]initWithFormat:@"9"];
        UIViewController * webViewController = [self createWebViewController: @"http://google.com/"];
		[self.navigationController pushViewController: webViewController animated: TRUE];
		[webViewController release];
    }
	else if(indexPath.row == 4)
    {
        Tips5 *c_Tips5=[[Tips5 alloc]initWithNibName:@"Tips5" bundle:nil];
        [c_Tips5 settype:1];
        [self.navigationController pushViewController:c_Tips5 animated:YES];
        //            NSBundle * c = [NSBundle bundleWithPath:
        //                            [b pathForResource:@"location" ofType:@"bundle"]];
        //            [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"map" ofType:@"html"]isDirectory:NO]]];
        tittle.text=@"分行地址";
        tittle3.text=@"分行地址";
    }
    
}
-(NSInteger)tableView:(UITableView *)c_tableview numberOfRowsInSection:(NSInteger)section
{
	return [titles count];
}
#pragma mark -
#pragma mark webView delegate



-(UIViewController *) createWebViewController: (NSString *) urlString
{
	UIViewController * webViewController = [[UIViewController alloc] init];
	//[webViewController.view setMultipleTouchEnabled:YES];
	//[webViewController.view setUserInteractionEnabled:YES];
	
	
	UIWebView * webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 45, 320, 368)];
    
	webView.delegate=self;
	[webView setScalesPageToFit:YES];
    //gaurav webView.
    //    for( UIView *view in [webView subviews] ) {
    //        
    //        if( [view isKindOfClass:[UIScrollView class]] ) {
    //            
    //            for( UIView *innerView in [view subviews] ) {
    //                
    //                if( [innerView isKindOfClass:[UIImageView class]] ) {
    //                    
    //                    innerView.hidden = YES;
    //                    
    //                }
    //                
    //            }
    //            
    //        }
    //        
    //    }
    
    
	
	
	NSURL *url = [NSURL URLWithString: urlString];
    NSString *body = nil;
	
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL: url];
    [request setHTTPMethod: @"POST"];
    [request setHTTPBody: [body dataUsingEncoding: NSUTF8StringEncoding]];
	
    [webView loadRequest: request];
    NSBundle * b = [NSBundle mainBundle];
    NSBundle * c = [NSBundle bundleWithPath:
                    [b pathForResource:@"visa" ofType:@"bundle"]];
	
	
	
	
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
	[btnback addTarget:self action:@selector(back2:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[webViewController.view addSubview:btnback];
	
	
	tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
    tittle3= [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	
	
	if ([bundle isEqualToString:@"0"]) {
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"aboutus/description" ofType:@"html"]isDirectory:NO]]];
		tittle.text=@"公司資料";
		tittle3.text=@"公司資料";
        
        NSArray *sv = [NSArray arrayWithArray:[webView subviews]];
        UIScrollView *scrollView = (UIScrollView *)[sv objectAtIndex:0];
        
        scrollView.delegate=self;
        [scrollView addSubview:_button];
        scrollView.bounces=NO;
	
    }else if ([bundle isEqualToString:@"1"]){
		[webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"aboutus/website" ofType:@"html"]isDirectory:NO]]];
		tittle.text=@"公司網頁";
		tittle3.text=@"公司網頁";
	}else{  
        
        if([bundle isEqualToString:@"9"]){
            NSBundle * c = [NSBundle bundleWithPath:
                            [b pathForResource:@"visa" ofType:@"bundle"]];
            
            [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"hotline" ofType:@"html"]isDirectory:NO]]];
            tittle.text=@"熱線電話指南";
            tittle3.text=@"熱線電話指南";
            //            webView.frame=CGRectMake(0, 0, 320, 368+45);
            //
            //            tittle.text=@"熱線電話指南";
            //            tittle3.text=@"";
        }
        else if([bundle isEqualToString:@"10"])
        {
            
            
        }
        else
        {
            [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"aboutus/disclaimer" ofType:@"html"]isDirectory:NO]]];
            tittle.text=@"免責聲明";
            tittle3.text=@"免責聲明及條款細則";
        }
	}
	
	
    [webViewController.view addSubview: webView];
	
	
	tittle3.textColor = [UIColor blackColor];
	tittle3.backgroundColor = [UIColor clearColor];
	tittle3.textAlignment = UITextAlignmentCenter;
	tittle3.font = [UIFont boldSystemFontOfSize:20];
	//[webViewController.view addSubview:tittle3];
	//[tittle release];
	
	
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font = [UIFont boldSystemFontOfSize:20];
	[webViewController.view addSubview:tittle];
	//[tittle release];
	
	
	
	
	for(int i=0;i<5;i++)
	{
		if(i==[c_tabbtn intValue])
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


-(void)se1:(id)sender;
{
	NSLog(@"1");
	if (c_number==0) {
		c_number=1;
	}
	else {
		c_number=0;
	}
	
}
-(void)se2:(id)sender;
{
	if (c_number==1) {
		c_number=2;
	}
	else {
		c_number=0;
	}
    NSLog(@"2");	
}
-(void)se3:(id)sender;
{
	if (c_number==2) {
		c_number=3;
		//verison.textColor=[UIColor blackColor];
		verison.hidden=NO;
		//if (all==0) {
        //			all=1;
        //		}
        //		else {
        //			all=0;
        //		}
        
	}
	else {
		c_number=0;
	}
	NSLog(@"3");
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

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView { 
	NSString* str1 = [[NSString alloc] initWithFormat:@"%@",webView.request.URL];
	NSLog(@"enquiryviewmy: webViewDidFinishLoad: %@",str1);
    if(m_pSaveURL)
    {
        [m_pSaveURL release];
        m_pSaveURL = nil;
    }
    
    if([str1 rangeOfString:@"hotline"].length > 0)
    {
        
        m_pSaveURL = [str1 copy];
    }
//    else {
//        webView.hidden = YES;
//        //[self.navigationController popViewControllerAnimated:NO];
//        Tips5 *c_Tips5=[[Tips5 alloc]initWithNibName:@"Tips5" bundle:nil];
//        [c_Tips5 settype:1];
//        [self.navigationController pushViewController:c_Tips5 animated:YES];
//        
////        NSBundle * c = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"location" ofType:@"bundle"]];
////        [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"map" ofType:@"html"]isDirectory:NO]]];
////        tittle.text=@"分行地址";
////        tittle3.text=@"分行地址";
//    }
                        
                        
    //    if([str1 rangeOfString:@"disclaimer.html"].length)
    //    {
    //        webView.hidden = YES;
    //        [self.navigationController popViewControllerAnimated:NO];
    //        Tips5 *c_Tips5=[[Tips5 alloc]initWithNibName:@"Tips5" bundle:nil];
    //        [self.navigationController pushViewController:c_Tips5 animated:NO];
    //        //            NSBundle * c = [NSBundle bundleWithPath:
    //        //                            [b pathForResource:@"location" ofType:@"bundle"]];
    //        //            [webView loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:[c pathForResource:@"map" ofType:@"html"]isDirectory:NO]]];
    //        tittle.text=@"分行地址";
    //        tittle3.text=@"分行地址";
    //    }
	[myMainView loadingStop];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
	NSString* str = [NSString stringWithFormat:@"%@",webView.request.URL];
	NSLog(@"enquiryviewmy: webViewDidStartLoad: %@",str);
	[myMainView startLoad];
} 


- (void)dealloc {
    [_button removeFromSuperview];
    [_button release];
    _button = nil;
	[btnfoot release];
	[c_Secret1 release];
	[c_Secret2 release];
	[c_Secret3 release];
    [super dealloc];
}


@end
