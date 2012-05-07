//
//  Tips2_1.mm
//  New_Projects
//
//  Created by chen cool on 11-10-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tips2_1.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
#import "Tips2_2.h"
extern MainView *myMainView;
extern BOOL c_xmlread;
extern int all;

extern BOOL g_isHaveNetwork;

@implementation Tips2_1
@synthesize c_xml;

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
	c_mun3=0;
	c_narray=[[NSMutableArray alloc]init];
	c_namenarray=[[NSMutableArray alloc]init];
	c_mumnarray=[[NSMutableArray alloc]init];
	
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil1 alloc] init];
	
	[XMLUtilView initialMyPraseror:[NSString stringWithFormat:@"%@",c_xml] 
								  :[[NSMutableArray alloc]initWithObjects:@"name",@"image",@"visa",@"detail",@"name1",nil]];
	
	
	
	if (c_xmlread ==YES) {
		NSLog(@"解析成功");
	}
	else {
		NSLog(@"解析失敗");
	}
	
	
	
	
	for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"name"]count]; i++) 
	{
		if (i==0) {
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:i]];
			[c_namenarray  addObject:xmlurl];
			c_mun=1;
		}
		else {
			
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:i]];
			if ([xmlurl isEqualToString:[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:i-1]]) 
			{
				c_mun+=1;
				if (i==[[XMLUtilView.tmpdic objectForKey:@"name"]count]-1) {
					[c_mumnarray addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				}
			}
			else {
				[c_namenarray  addObject:xmlurl];
				[c_mumnarray addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				c_mun=1;
				if (i==[[XMLUtilView.tmpdic objectForKey:@"name"]count]-1) {
					[c_mumnarray addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				}
			}
		}
	}
	
	
	
	
	
	
	UIImageView *topbar1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar.png"] ofType:@""]]];
	
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	[footbar release];
	
	
	[self.view addSubview:topbar1];
	
	
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar1 addSubview:c_I];
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
	BTN.frame = CGRectMake(270, 0, 55, 45);
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
	[topbar1 release];
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,45, 320, 412-45)];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	//c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    c_tableview.bounces=NO;
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
	c_mun3=0;
	c_narray=[[NSMutableArray alloc]init];
	c_namenarray=[[NSMutableArray alloc]init];
	c_mumnarray=[[NSMutableArray alloc]init];
	
	self.navigationItem.title = @"簽證";
	
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil1 alloc] init];
	
	[XMLUtilView initialMyPraseror:[NSString stringWithFormat:@"%@",c_xml] 
								  :[[NSMutableArray alloc]initWithObjects:@"name",@"image",@"visa",@"detail",@"name1",nil]];
	
	
	
	if (c_xmlread ==YES) {
		NSLog(@"解析成功");
	}
	else {
		NSLog(@"解析失敗");
	}
	
	
	
	
	for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"name"]count]; i++) 
	{
		if (i==0) {
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:i]];
			[c_namenarray  addObject:xmlurl];
			c_mun=1;
		}
		else {
			
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:i]];
			if ([xmlurl isEqualToString:[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:i-1]]) 
			{
				c_mun+=1;
				if (i==[[XMLUtilView.tmpdic objectForKey:@"name"]count]-1) {
					[c_mumnarray addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				}
			}
			else {
				[c_namenarray  addObject:xmlurl];
				[c_mumnarray addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				c_mun=1;
				if (i==[[XMLUtilView.tmpdic objectForKey:@"name"]count]-1) {
					[c_mumnarray addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				}
			}
		}
	}
	
	
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 412-45)];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	//c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
    c_tableview.bounces=NO;
	[self.view addSubview:c_tableview];
	
	
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)c_tableview;              // Default is 1 if not implemented
{
	return [c_mumnarray count];
}


- (CGFloat)tableView:(UITableView *)c_tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
	return 70;
}


-(NSInteger)tableView:(UITableView *)c_tv numberOfRowsInSection:(NSInteger)section
{
    int rows=0;
	for (int i=0; i<[c_mumnarray count]; i++) {
		if (section==i) {
			rows = [[c_mumnarray objectAtIndex:i] intValue];
            break;
		}
	}
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)c_tv
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
	NSString *SimpleTableIdentifier = [[NSString alloc] initWithFormat:@"SimpleTableIdentifier_%d_%d", indexPath.row, indexPath.section];
	
	UITableViewCell *cell = [c_tableview dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	//static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	
	//UITableViewCell *cell = [c_tableview dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	if (cell == nil) {
		CGRect cellFrame = CGRectMake(0,0,320,65);
		cell = [[[UITableViewCell alloc] initWithFrame:cellFrame
									   reuseIdentifier:SimpleTableIdentifier] autorelease];
		//cell.selectionStyle = UITableViewCellSelectionStyleGray;
		cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.bounds] autorelease];
		cell.selectedBackgroundView.backgroundColor =  [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
		
		
		//cell.textLabel.text=@"1";
		
		
		for (int i=0; i<[c_mumnarray count]; i++) 
		{
            //NSLog(@"%@",[c_mumnarray description]);
			if (indexPath.section==i) 
			{
				
				
			    if (i==0) 
			    {
					UIImageView *c_image=[[UIImageView alloc]init];
					[c_image setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"image"]objectAtIndex:indexPath.row]] ofType:@""]]];
//                    NSLog(@"%@",[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"image"]objectAtIndex:indexPath.row]] ofType:@""]);
					//UIImageView *c_image=[[UIImageView alloc]initWithImage:[[UIImage alloc]];
					//c_image.frame=CGRectMake(0, 0, 90*1.52517, 90);
					c_image.frame=CGRectMake(0, 0, 70*1.52517, 70);
					c_image.backgroundColor=[UIColor clearColor];    
					[cell.contentView addSubview:c_image];
					[c_image release];
					
					
					//212/139
					
				    //UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(70+30+50, 10, 260, 60)];
				   // (70+50, 00, 260, 60)
					UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(70+50, 00, 260, 60)];
					c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"name1"]objectAtIndex:indexPath.row];
				    [cell.contentView addSubview:c_textview];
				    c_textview.backgroundColor=[UIColor clearColor];
				    c_textview.userInteractionEnabled=NO;
				    c_textview.font = [UIFont boldSystemFontOfSize:16];
				    [c_textview release];
					
					//UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(70+30+50, 42, 260, 60)];
					UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(70+50, 32, 260, 60)];
					c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"visa"]objectAtIndex:indexPath.row];
					[cell.contentView addSubview:c_textview1];
					c_textview1.backgroundColor=[UIColor clearColor];
					c_textview1.textColor=[UIColor grayColor];
					c_textview1.userInteractionEnabled=NO;
					c_textview1.alpha=0.5;
					//c_textview.font = [UIFont systemFontOfSize:18];
					c_textview1.font=[UIFont boldSystemFontOfSize:14];
					[c_textview1 release];
					//visa
					
					
					UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(280, 20, 25*0.6, 38*0.6)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
					//topbar.backgroundColor = [UIColor lightGrayColor];
					[cell.contentView addSubview:C_IMG];
					
			    }
			    else 
			    {
				    for (int c_i=0; c_i<i; c_i++) {
					    c_mun3+= [[c_mumnarray objectAtIndex:c_i]intValue];
				    }
					
					
					
					UIImageView *c_image=[[UIImageView alloc]init];
                   //绝对路径
                    NSBundle * c = [NSBundle bundleWithPath:
                                    [[NSBundle mainBundle] pathForResource:@"visa.bundle/images/location" ofType:@""]];
                    
					[c_image setImage:[UIImage imageWithContentsOfFile:[c pathForResource:[NSString stringWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"image"]objectAtIndex:indexPath.row+c_mun3]] ofType:@""]]];
                    
//                    NSLog(@"%@",[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"image"]objectAtIndex:indexPath.row+c_mun3]] ofType:@""]);
//                   
//                    NSLog(@"%@",[[XMLUtilView.tmpdic objectForKey:@"image"]objectAtIndex:indexPath.row+c_mun3]);
//                    NSLog(@"indexPath.row+c_mun3 = %d",indexPath.row+c_mun3);
//                    NSLog(@"%@",[XMLUtilView.tmpdic objectForKey:@"image"]);
                    
					//UIImageView *c_image=[[UIImageView alloc]initWithImage:[[UIImage alloc]];
					//c_image.frame=CGRectMake(0, 0, 90, 90);
					//c_image.frame=CGRectMake(0, 0, 90*1.52517, 90);
					c_image.frame=CGRectMake(0, 0, 70*1.52517, 70);
					c_image.backgroundColor=[UIColor clearColor];    
					[cell.contentView addSubview:c_image];
					[c_image release];
					
					
					//cell.textLabel.text=[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:indexPath.row+c_mun3];
				    //UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(70+30+50, 10, 260, 60)];
					UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(70+50, 00, 260, 60)];
					c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"name1"]objectAtIndex:indexPath.row+c_mun3];
				    [cell.contentView addSubview:c_textview];
				    c_textview.backgroundColor=[UIColor clearColor];
				    c_textview.userInteractionEnabled=NO;
				    c_textview.font = [UIFont boldSystemFontOfSize:16];
				    [c_textview release];
					
					
					//UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(70+30+50, 42, 260, 60)];
					UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(70+50, 32, 260, 60)];
					c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"visa"]objectAtIndex:indexPath.row+c_mun3];
					[cell.contentView addSubview:c_textview1];
					c_textview1.backgroundColor=[UIColor clearColor];
					c_textview1.textColor=[UIColor grayColor];
					c_textview1.userInteractionEnabled=NO;
					c_textview1.alpha=0.5;
					//c_textview.font = [UIFont systemFontOfSize:18];
					c_textview1.font=[UIFont boldSystemFontOfSize:14];
					[c_textview1 release];
					
					UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(280, 20, 25*0.6, 38*0.6)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
					//topbar.backgroundColor = [UIColor lightGrayColor];
					[cell.contentView addSubview:C_IMG];
			    }
			}
			
			c_mun3=0;
		}
		
		
		
	}
	
	[SimpleTableIdentifier release];
	SimpleTableIdentifier = nil;
	
	return cell;
}


- (UIView *)tableView:(UITableView *)c_tableview viewForHeaderInSection:(NSInteger)section
{
	
	UIView *view = nil;		
	for (int i=0; i<[c_namenarray count]; i++) {
		if(section == i)
		{
			view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
			//view.backgroundColor = [UIColor blueColor];
			UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,320,22)];
			//c_image.backgroundColor=[UIColor whiteColor];
			c_image.alpha=0.9;
			[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
			[view addSubview:c_image];
			[c_image release];
			c_image=nil;
			
			
			UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 3,100,20)];
			lable1.text = [[NSString alloc] initWithFormat:@"%@",[c_namenarray objectAtIndex:i]];
			lable1.backgroundColor = [UIColor clearColor];
			lable1.font = [UIFont boldSystemFontOfSize:17];
			lable1.textColor=[UIColor grayColor];
			[view addSubview:lable1];
			
			
			UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 1,100,20)];
			lable.text = [[NSString alloc] initWithFormat:@"%@",[c_namenarray objectAtIndex:i]];
			lable.backgroundColor = [UIColor clearColor];
			lable.font = [UIFont boldSystemFontOfSize:17];
			lable.textColor=[UIColor whiteColor];
			[view addSubview:lable];
			
			
			[lable release];
			lable = nil;
		}
	}
	
	return view;
	
}



- (void)tableView:(UITableView *)c_tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if(g_isHaveNetwork)
    {
        UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
        [cell setSelected:NO];
        
        for (int i=0; i<[c_mumnarray count]; i++) 
        {
            if (indexPath.section==i) 
            {
                
                
                if (i==0) 
                {
                    NSString *nowdate = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,[[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:indexPath.row] length]-5)];
                    NSLog(@"[[%@]]]",nowdate);
                    Tips2_2 *c_Tips2=[[Tips2_2 alloc]initWithNibName:@"Tips2_2" bundle:nil];
                    c_Tips2.c_tittle=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"name1"]objectAtIndex:indexPath.row]];
                    //c_Tips2.c_xml=[[NSString alloc]initWithFormat:[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:indexPath.row]];
                    c_Tips2.c_xml=nowdate;
                    [self.navigationController pushViewController:c_Tips2 animated:YES];
                    
                    
                    
                    
                    
                }
                else 
                {
                    for (int c_i=0; c_i<i; c_i++) {
                        c_mun3+= [[c_mumnarray objectAtIndex:c_i]intValue];
                    }
                    
                    
                    //c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"name1"]objectAtIndex:indexPath.row+c_mun3];
                    
                    
                    
                    NSString *nowdate = [[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:indexPath.row+c_mun3] substringWithRange:NSMakeRange(0,[[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:indexPath.row+c_mun3] length]-5)];
                    Tips2_2 *c_Tips2=[[Tips2_2 alloc]initWithNibName:@"Tips2_2" bundle:nil];
                    c_Tips2.c_tittle=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"name1"]objectAtIndex:indexPath.row+c_mun3]];
                    //c_Tips2.c_xml=[[NSString alloc]initWithFormat:[[XMLUtilView.tmpdic objectForKey:@"detail"]objectAtIndex:indexPath.row+c_mun3]];
                    c_Tips2.c_xml=nowdate;
                    [self.navigationController pushViewController:c_Tips2 animated:YES];
                    
                    
                    
                    
                }
                
                c_mun3=0;
            }
            
            
            
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


-(void)next:(id)sender
{
	
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"1"];
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"2"];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
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
