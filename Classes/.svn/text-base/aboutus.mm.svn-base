//
//  aboutus.mm
//  New_Projects
//
//  Created by chen cool on 11-10-13.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "aboutus.h"
#import "MainView.h"
extern MainView *myMainView;

@implementation aboutus

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
	
	c_number=0;
	
	UIImageView *topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:topbar];
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	
	
	
	
	UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"公司資料";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	//tittle.font = [UIFont systemFontOfSize:20];
	tittle.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle];
	[tittle release];
	
	scrollview = [[UIScrollView alloc] init];
	scrollview.frame=CGRectMake(0, 45, 320, 480-45-48);
	scrollview.contentSize = CGSizeMake(320,521);
	scrollview.pagingEnabled = YES;
	scrollview.delegate=self;
	scrollview.backgroundColor=[UIColor clearColor];
	
	//scrollview.delegate=self;
	[self.view addSubview:scrollview];
	
	
	
	
	
	UIButton *c_Secret1 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_Secret1 addTarget:self action:@selector(se1:)forControlEvents:UIControlEventTouchUpInside];
	c_Secret1.frame = CGRectMake(0,300,75,75);
	//c_Secret1.backgroundColor=[UIColor blueColor];
	[self.view addSubview:c_Secret1];
	
	
	
	
	UIButton *c_Secret2 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_Secret2 addTarget:self action:@selector(se2:)forControlEvents:UIControlEventTouchUpInside];
	c_Secret2.frame = CGRectMake(105,45,75,75);
	//c_Secret2.backgroundColor=[UIColor blackColor];
	[self.view addSubview:c_Secret2];
	
	
	
	UIButton *c_Secret3 = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_Secret3 addTarget:self action:@selector(se3:)forControlEvents:UIControlEventTouchUpInside];
	//c_Secret3.backgroundColor=[UIColor redColor];
	c_Secret3.frame = CGRectMake(220,300,75,75);
	[self.view addSubview:c_Secret3];
	
	
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 521)];
	[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"company_info"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[scrollview addSubview:IMG];
	
	
	verison=[[UILabel alloc]initWithFrame:CGRectMake(320-110, 480, 100, 20)];
	verison.backgroundColor=[UIColor clearColor];
	verison.textColor=[UIColor clearColor];
	verison.text=@"version:1.4";
	[scrollview addSubview:verison];
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	for(int i=0;i<5;i++)
	{
		if(i==3)
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

	
	
}
-(void)se1:(id)sender;
{
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

}
-(void)se3:(id)sender;
{
	if (c_number==2) {
		c_number=3;
		verison.textColor=[UIColor blackColor];
	}
	else {
		c_number=0;
	}

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
