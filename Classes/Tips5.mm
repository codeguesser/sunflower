//
//  Tips5.mm
//  New_Projects
//
//  Created by chen cool on 11-10-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Tips5.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
#import "Tips.h"
extern MainView *myMainView;
extern int all;

@implementation Tips5
@synthesize titles;




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

- (void)settype:(int)_type
{
    type = _type;
}


-(void)dosomething1
{
	bNearMeOver=NO;
	c_mun=0;
	
	c_narray=[[NSMutableArray alloc]init];
	c_narraymun=[[NSMutableArray alloc]init];
	
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil1 alloc] init];
	
	[XMLUtilView initialMyPraseror:[NSString stringWithFormat:@"map"] 
								  :[[NSMutableArray alloc]initWithObjects:@"paretname",@"longitude",@"latitude",@"titlename",@"description",nil]];
	
	
	for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"titlename"]count]; i++) 
	{
		
		if (i==0) {
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"paretname"]objectAtIndex:i]];
			[c_narray  addObject:xmlurl];
			c_mun=1;
		}
		else {
			
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"paretname"]objectAtIndex:i]];
			if ([xmlurl isEqualToString:[[XMLUtilView.tmpdic objectForKey:@"paretname"]objectAtIndex:i-1]]) 
			{
				NSLog(@"yes");
				c_mun+=1;
				if (i==[[XMLUtilView.tmpdic objectForKey:@"paretname"]count]-1) {
					[c_narraymun addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				}
			}
			else {
				[c_narray  addObject:xmlurl];
				//[c_narraymun addObject:c_mun];
				[c_narraymun addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				c_mun=1;
			}
			
			
		}
		
	}
	
	
	
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
	tittle1.text=@"分行地址";
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font = [UIFont boldSystemFontOfSize:20];
	//[topbar1 addSubview:tittle1];
	
	
	
	tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"分行地址";
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
	bNearMeOver=NO;
	c_mun=0;
	
	self.navigationItem.title = @"分行地址";
	
	c_narray=[[NSMutableArray alloc]init];
	c_narraymun=[[NSMutableArray alloc]init];
	
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil1 alloc] init];
	
	[XMLUtilView initialMyPraseror:[NSString stringWithFormat:@"map"] 
								  :[[NSMutableArray alloc]initWithObjects:@"paretname",@"longitude",@"latitude",@"titlename",@"description",nil]];
	
	
	for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"titlename"]count]; i++) 
	{
		
		//[c_Img release];
		
		
		if (i==0) {
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"paretname"]objectAtIndex:i]];
			[c_narray  addObject:xmlurl];
			c_mun=1;
		}
		else {
			
			NSString *xmlurl = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"paretname"]objectAtIndex:i]];
			if ([xmlurl isEqualToString:[[XMLUtilView.tmpdic objectForKey:@"paretname"]objectAtIndex:i-1]]) 
			{
				NSLog(@"yes");
				c_mun+=1;
				if (i==[[XMLUtilView.tmpdic objectForKey:@"paretname"]count]-1) {
					[c_narraymun addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				}
			}
			else {
				[c_narray  addObject:xmlurl];
				//[c_narraymun addObject:c_mun];
				[c_narraymun addObject:[[NSString alloc]initWithFormat:@"%d",c_mun]];
				c_mun=1;
			}
			
			
		}
		
	}
	
	
	
	
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-48)];
	//[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	IMG.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	
	//IMG.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:IMG];
	
	
	
	
	
	c_tableview= [[UITableView alloc] initWithFrame:CGRectMake(0,0, 320, 412-45)];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	//c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	c_tableview.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
	[self.view addSubview:c_tableview];
	
	
	
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
		cell.selectionStyle = UITableViewCellSelectionStyleGray;
		
		
		for (int i=0; i<[c_narray count]; i++) {
			if (indexPath.section==i) {
			    if (i==0) {
					UITextView *c_TEXT=[[UITextView alloc]initWithFrame:CGRectMake(20, 3, 320, 50)];
					c_TEXT.textColor=[UIColor blackColor];
					c_TEXT.text=[[XMLUtilView.tmpdic objectForKey:@"titlename"]objectAtIndex:indexPath.row];
					c_TEXT.font = [UIFont boldSystemFontOfSize:18];
					c_TEXT.backgroundColor=[UIColor clearColor];
					c_TEXT.userInteractionEnabled=NO;
					[cell.contentView addSubview:c_TEXT];
					
					NSString *a;
					a = [[[XMLUtilView.tmpdic objectForKey:@"description"]objectAtIndex:indexPath.row] stringByReplacingOccurrencesOfString:@"/"withString:@"\n"];
					
				    UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(20, 3+40, 320, 120)];
					
				    c_textview.text=a;
					[cell.contentView addSubview:c_textview];
				    c_textview.backgroundColor=[UIColor clearColor];
					c_textview.textColor=[UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1.0];
				    c_textview.userInteractionEnabled=NO;
				    //c_textview.font = [UIFont boldSystemFontOfSize:18];
				    [c_textview release];
					
					
					
					UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(280, 8, 25*0.6, 38*0.6)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
					//topbar.backgroundColor = [UIColor lightGrayColor];
					[cell.contentView addSubview:C_IMG];
			    }
			    else {
						for (int c_i=0; c_i<i; c_i++) {
							c_mun3+= [[c_narraymun objectAtIndex:c_i]intValue];
						}
						
						
						UITextView *c_TEXT=[[UITextView alloc]initWithFrame:CGRectMake(20, 3, 320, 50)];
						c_TEXT.textColor=[UIColor blackColor];
						c_TEXT.text=[[XMLUtilView.tmpdic objectForKey:@"titlename"]objectAtIndex:indexPath.row+c_mun3];
						c_TEXT.font = [UIFont boldSystemFontOfSize:18];
						c_TEXT.userInteractionEnabled=NO;
						c_TEXT.backgroundColor=[UIColor clearColor];
						[cell.contentView addSubview:c_TEXT];
						
						
						NSString *a;
						a = [[[XMLUtilView.tmpdic objectForKey:@"description"]objectAtIndex:indexPath.row+c_mun3] stringByReplacingOccurrencesOfString:@"/"withString:@"\n"];
						
						
						//cell.textLabel.text=[[XMLUtilView.tmpdic objectForKey:@"name"]objectAtIndex:indexPath.row+c_mun3];
						UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(20, 3+40, 320, 120)];
						//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"description"]objectAtIndex:indexPath.row+c_mun3];
						c_textview.text=a;
						[cell.contentView addSubview:c_textview];
					    c_textview.textColor=[UIColor colorWithRed:80.0/255.0 green:80.0/255.0 blue:80.0/255.0 alpha:1.0];
				        c_textview.backgroundColor=[UIColor clearColor];
						c_textview.userInteractionEnabled=NO;
						// c_textview.font = [UIFont boldSystemFontOfSize:18];
						[c_textview release];
						
						
						UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(280, 8, 25*0.6, 38*0.6)];
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
- (CGFloat)tableView:(UITableView *)c_tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 170;
}
- (void)tableView:(UITableView *)c_tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	
	UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
	[cell setSelected:NO];
	
	
	for (int i=0; i<[c_narray count]; i++) {
		if (indexPath.section==i) {
			if (i==0) {
				
				
				c_jd=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"longitude"]objectAtIndex:indexPath.row]];
				c_wd=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"latitude"]objectAtIndex:indexPath.row]];
				c_mz=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"titlename"]objectAtIndex:indexPath.row]];
				[self nearMe];
			}
			else {
				for (int c_i=0; c_i<i; c_i++) {
					c_mun3+= [[c_narraymun objectAtIndex:c_i]intValue];
				}
				c_jd=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"longitude"]objectAtIndex:indexPath.row+c_mun3]];
				c_wd=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"latitude"]objectAtIndex:indexPath.row+c_mun3]];
				c_mz=[[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"titlename"]objectAtIndex:indexPath.row+c_mun3]];
				[self nearMe];
			}
		}
		c_mun3=0;
	}
}



-(void)nearMe{
	bNearMeOver=NO;
	locationManager = [[CLLocationManager alloc]init];
	[locationManager setDelegate:self];
	[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
	[locationManager startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
	
	NSString *latitude1=[[NSString alloc]initWithFormat:@"%f",newLocation.coordinate.latitude];
	NSString *longitude1=[[NSString alloc]initWithFormat:@"%f",newLocation.coordinate.longitude];
	
	if(bNearMeOver==NO)
	{
		bNearMeOver=YES;
		mapNearMeView = [[mapController alloc]init];
		mapNearMeView.c_name = [[NSString alloc]initWithFormat:@"%@",c_mz];
		//[self.view addSubview:mapNearMeView.view];
		[self.navigationController setNavigationBarHidden:YES animated:YES];
		[self.navigationController pushViewController:mapNearMeView animated:YES];
		[mapNearMeView setmapPoint:[c_jd doubleValue]:[c_wd doubleValue] :c_mz :titlestr :1];
		[mapNearMeView setmapPoint1:[latitude1 doubleValue]:[longitude1 doubleValue] :@"你的位置" :titlestr :2];
	}
}






- (UIView *)tableView:(UITableView *)c_tableview viewForHeaderInSection:(NSInteger)section{
	UIView *view = nil;		
	for (int i=0; i<[c_narray count]; i++) {
		if(section == i){
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
			lable1.text = [[NSString alloc] initWithFormat:@"%@",[c_narray objectAtIndex:i]];
			lable1.backgroundColor = [UIColor clearColor];
			lable1.font = [UIFont boldSystemFontOfSize:17];
			lable1.textColor=[UIColor grayColor];
			[view addSubview:lable1];
			
			
			UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 1,100,20)];
			lable.text = [[NSString alloc] initWithFormat:@"%@",[c_narray objectAtIndex:i]];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)c_tableview;              // Default is 1 if not implemented
{
	return [c_narray count];
}


-(NSInteger)tableView:(UITableView *)c_tableview numberOfRowsInSection:(NSInteger)section{	
	for (int i=0; i<[c_narray count]; i++) {
		if (section==i) {
			return [[c_narraymun objectAtIndex:i] intValue];
		}
	}
}


-(IBAction)btnfoot:(UIButton*)sender{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}


-(void)next:(id)sender{
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"1"];
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"2"];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
}

-(void)back:(id)sender{
    if(type)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self.navigationController popViewControllerAnimated:NO];
    }
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
