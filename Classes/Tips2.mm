//
//  Tips2.mm
//  New_Projects
//
//  Created by chen cool on 11-10-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tips2.h"

#import "Tips2_1.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
#import <QuartzCore/QuartzCore.h>

extern MainView *myMainView;
extern int all;

@implementation Tips2

static float ROW_HEIGHT=45;
static int NO_OF_ROWS = 3;

extern BOOL g_isHaveNetwork;

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
    NSLog(@"gaurav: something1");
	
	self.view.backgroundColor=[UIColor orangeColor];
    
	indexIconNames = [[NSArray alloc] initWithObjects:@"hksar.png", @"hkbno.png", @"mcsar.png", nil];
	
	titles = [[NSArray alloc] initWithObjects:@"香港特區護照", @"HKBNO", @"澳門特區護照", nil];
	
	UIImageView *topbar1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
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
	
	
	
	UILabel *c_lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 45, 200, 50)];
	c_lable.text=@"請選擇護照種類";
	c_lable.font = [UIFont boldSystemFontOfSize:18];
	c_lable.textColor=[UIColor blackColor];
	c_lable.alpha=0.7;
	c_lable.backgroundColor=[UIColor clearColor];
	[self.view addSubview:c_lable];
	
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
	tittle1.text=@"簽證";
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font = [UIFont boldSystemFontOfSize:20];
	//[topbar1 addSubview:tittle1];
	
	
	
	tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"簽證";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font = [UIFont boldSystemFontOfSize:20];
	[topbar1 addSubview:tittle];
	//[topbar1 release];
	
	
	
	//self.navigationItem.title = @"簽證";
	//[self.navigationController.navigationBar insertSubview:topbar1 atIndex:0];
	
	//self.navigationItem.hidesBackButton=YES;
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	//[self.navigationController.navigationBar addSubview:btnback];
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(20,45+35+10, 320-2*20, NO_OF_ROWS*ROW_HEIGHT) style:UITableViewStylePlain];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	[c_tableview setScrollEnabled:NO];
   //c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    c_tableview.layer.cornerRadius=10;	
    [self.view addSubview:c_tableview];
	
	
	
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

-(void)dosomething2
{
    NSLog(@"gaurav: something2");
    
	indexIconNames = [[NSArray alloc] initWithObjects:@"hksar.png", @"hkbno.png", @"mcsar.png", nil];
	
	titles = [[NSArray alloc] initWithObjects:@"香港特區護照", @"HKBNO", @"澳門特區護照", nil];
	
	
	self.navigationItem.title = @"簽證";
	
	
	
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-48)];
	//[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	IMG.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	
	//IMG.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:IMG];
	
	
	
	
	UILabel *c_lable=[[UILabel alloc]initWithFrame:CGRectMake(20, 0, 200, 50)];
	c_lable.text=@"請選擇護照種類";
	c_lable.font = [UIFont boldSystemFontOfSize:18];
	c_lable.textColor=[UIColor blackColor];
	c_lable.alpha=0.7;
	c_lable.backgroundColor=[UIColor clearColor];
	[self.view addSubview:c_lable];
	
	
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,35, 320, 412-45) style:UITableViewStyleGrouped];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	[c_tableview setScrollEnabled:NO];
	//c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    c_tableview.layer.cornerRadius=10;
    [self.view addSubview:c_tableview];
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
	
	
		UIImageView *c_image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:[indexIconNames objectAtIndex:indexPath.row]]];
		c_image.frame=CGRectMake(5, 4, 37, 37);
		c_image.backgroundColor=[UIColor clearColor];    
		[cell.contentView addSubview:c_image];
		[c_image release];
		
		
		UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(45, 2, 260, 45)];
		c_textview.text=[titles objectAtIndex: indexPath.row];
		c_textview.backgroundColor=[UIColor clearColor];
		c_textview.userInteractionEnabled=NO;
		c_textview.font=[UIFont boldSystemFontOfSize:18];
        [cell.contentView addSubview:c_textview];
		[c_textview release];
		
		
        UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(250, 8, 25*0.6, 38*0.6)];
		[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
		[cell.contentView addSubview:C_IMG];
		
	}
	
	[SimpleTableIdentifier release];
	SimpleTableIdentifier = nil;
	
	return cell;
}

- (void)tableView:(UITableView *)c_tableview willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
	cell.backgroundColor = [UIColor whiteColor];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)c_tableview;              // Default is 1 if not implemented
{
	return 1;
}


-(NSInteger)tableView:(UITableView *)c_tableview numberOfRowsInSection:(NSInteger)section
{
	
	return NO_OF_ROWS;
}


- (CGFloat)tableView:(UITableView *)c_tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return ROW_HEIGHT;
	
}

- (void)tableView:(UITableView *)c_tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(g_isHaveNetwork)
    {
        UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
        [cell setSelected:NO];
        
        Tips2_1 *c_Tips2=[[Tips2_1 alloc]initWithNibName:@"Tips2_1" bundle:nil];
        if (indexPath.row==0) {
            c_Tips2.c_xml=[[NSString alloc]initWithFormat:@"hksar"];
        }
        else if(indexPath.row==1)
        {
            c_Tips2.c_xml=[[NSString alloc]initWithFormat:@"hkbno"];
        }
        else {
            c_Tips2.c_xml=[[NSString alloc]initWithFormat:@"mcsar"];
        }
        
        [self.navigationController pushViewController:c_Tips2 animated:YES];
    }
	
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
