//
//  EnquirViewMyWeb.mm
//  New_Projects
//
//  Created by chen cool on 11-11-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EnquirViewMyWeb.h"
#import "MainView.h"
#import "EnquirViewFinal.h"

extern MainView *myMainView;
extern int all;

@implementation EnquirViewMyWeb

@synthesize backkind;
@synthesize c_tabbtn;
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
	c_number=0;
	
	
	UIImageView *IMG1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-48)];
	//[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	IMG1.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	
	//IMG.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:IMG1];
	
	titles = [[NSArray alloc] initWithObjects:@"新華旅遊主頁", @"婚旅產品主頁", @"新華旅遊微博",@"新華Facebook", nil];
	titles2=[[NSArray alloc]initWithObjects:@"sunflower.png",@"wedding.png",@"icon_weibo.png",@"icon_facebook.png",nil];
	
	
	
	
	
	UIImageView *topbar1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:topbar1];
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	[footbar release];
	
	
	
	UILabel *c_lable2=[[UILabel alloc]initWithFrame:CGRectMake(20, 44, 200, 50)];
	c_lable2.text=@"常用網址";
	c_lable2.font = [UIFont boldSystemFontOfSize:17];
	c_lable2.textColor=[UIColor whiteColor];
	c_lable2.alpha=0.7;
	c_lable2.backgroundColor=[UIColor clearColor];
	[self.view addSubview:c_lable2];
	[c_lable2 release];
	
	
	UILabel *c_lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 43, 200, 50)];
	c_lable.text=@"常用網址";
	c_lable.font = [UIFont boldSystemFontOfSize:17];
	c_lable.textColor=[UIColor blackColor];
	c_lable.alpha=0.7;
	c_lable.backgroundColor=[UIColor clearColor];
	[self.view addSubview:c_lable];
	[c_lable release];
	
	
	
	
	
	UILabel *c_lable3=[[UILabel alloc]initWithFrame:CGRectMake(0, 300, 320, 50)];
	c_lable3.text=@"Powered By Sunflower Travel";
	c_lable3.font = [UIFont systemFontOfSize:11];
	c_lable3.textColor=[UIColor blackColor];
	c_lable3.alpha=0.7;
	c_lable3.textAlignment = UITextAlignmentCenter;
	c_lable3.backgroundColor=[UIColor clearColor];
	[self.view addSubview:c_lable3];
	[c_lable3 release];
	
	
	
	UIButton *btn3 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btn3 addTarget:self action:@selector(btn3)forControlEvents:UIControlEventTouchUpInside];
	//[btn3 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btn3.frame = CGRectMake(0, 300, 320, 50);
	[self.view addSubview:btn3];
	
	
	
	
	
	
	UILabel *tittle2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle2.text=@"公司網頁";
	tittle2.textColor = [UIColor whiteColor];
	tittle2.backgroundColor = [UIColor clearColor];
	tittle2.textAlignment = UITextAlignmentCenter;
	//tittle1.font = [UIFont systemFontOfSize:20];
	tittle2.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle2];
	[tittle2 release];
	
	
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(5,5+45+22, 310, 190) style:UITableViewStyleGrouped];
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
	[IMG release];
	
	
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	
}



-(IBAction)back:(UIButton *)sender
{
	if ([backkind isEqualToString:@"1"]) {
		//[self.navigationController setNavigationBarHidden:NO animated:NO];
		[self.navigationController popViewControllerAnimated:YES];
		
		[[NSNotificationCenter defaultCenter] postNotificationName:@"PDFFinish" object:nil];
	}
	else {
		[self.navigationController popViewControllerAnimated:YES];
		//[self.navigationController popViewControllerAnimated:YES];
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
		
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
		
		
		
		
		UIImageView *c_image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[titles2 objectAtIndex:indexPath.row]]];
		c_image.frame=CGRectMake(5, 5, 33, 33);
		c_image.backgroundColor=[UIColor clearColor];    
		[cell.contentView addSubview:c_image];
		[c_image release];
		
		
		
		UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(37, 2, 260, 44)];
		c_textview.text=[titles objectAtIndex: indexPath.row];
		[cell.contentView addSubview:c_textview];
		c_textview.backgroundColor=[UIColor clearColor];
		c_textview.userInteractionEnabled=NO;
		//c_textview.font = [UIFont systemFontOfSize:18];
		c_textview.font=[UIFont boldSystemFontOfSize:16];
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


- (CGFloat)tableView:(UITableView *)c_tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 44;
	
}


-(NSInteger)tableView:(UITableView *)c_tableview numberOfRowsInSection:(NSInteger)section
{
	return [titles count];
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/



- (void)tableView:(UITableView *)c_tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
	[cell setSelected:NO];
	
	if (indexPath.row==0) {
		
		EnquirViewFinal *c_EnquirViewFinal=[[EnquirViewFinal alloc]initWithNibName:@"EnquirViewFinal" bundle:nil];
		c_EnquirViewFinal.c_link=[[NSString alloc]initWithFormat:@"http://www.sunflower.com.hk"];
		c_EnquirViewFinal.c_name=[[NSString alloc]initWithFormat:@"%@",[titles objectAtIndex:0]];
		[self.navigationController pushViewController:c_EnquirViewFinal animated:YES];
		
		
	}
	else if(indexPath.row==1)
	{
		EnquirViewFinal *c_EnquirViewFinal=[[EnquirViewFinal alloc]initWithNibName:@"EnquirViewFinal" bundle:nil];
		c_EnquirViewFinal.c_link=[[NSString alloc]initWithFormat:@"http://www.sunflower.com.hk/theme/2010/wedding"];
		c_EnquirViewFinal.c_name=[[NSString alloc]initWithFormat:@"%@",[titles objectAtIndex:1]];
		[self.navigationController pushViewController:c_EnquirViewFinal animated:YES];
		
		
	}
	else if(indexPath.row==2)
	{
		EnquirViewFinal *c_EnquirViewFinal=[[EnquirViewFinal alloc]initWithNibName:@"EnquirViewFinal" bundle:nil];
		c_EnquirViewFinal.c_link=[[NSString alloc]initWithFormat:@"http://weibo.com/hksunflower"];
		c_EnquirViewFinal.c_name=[[NSString alloc]initWithFormat:@"%@",[titles objectAtIndex:2]];
		[self.navigationController pushViewController:c_EnquirViewFinal animated:YES];
		
	}
	else if(indexPath.row==3){
		EnquirViewFinal *c_EnquirViewFinal=[[EnquirViewFinal alloc]initWithNibName:@"EnquirViewFinal" bundle:nil];
		c_EnquirViewFinal.c_link=[[NSString alloc]initWithFormat:@"http://www.facebook.com/hksunflower"];
		c_EnquirViewFinal.c_name=[[NSString alloc]initWithFormat:@"%@",[titles objectAtIndex:3]];
		[self.navigationController pushViewController:c_EnquirViewFinal animated:YES];
		
	}

	
}



-(void)btn3
{
	EnquirViewFinal *c_EnquirViewFinal=[[EnquirViewFinal alloc]initWithNibName:@"EnquirViewFinal" bundle:nil];
	c_EnquirViewFinal.c_link=[[NSString alloc]initWithFormat:@"http://www.sunflower.com.hk"];
	c_EnquirViewFinal.c_name=[[NSString alloc]initWithFormat:@"%@",[titles objectAtIndex:0]];
	[self.navigationController pushViewController:c_EnquirViewFinal animated:YES];
	
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
}


@end
