//
//  Product4.mm
//  New_Projects
//
//  Created by chen cool on 11-10-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Product4.h"
#import "OpenPDF.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
extern int all;
extern BOOL c_ccxml;
extern MainView *myMainView;
int cc_mun,cc_mun2,cc_mun3;
@implementation Product4
@synthesize c_xml,c_name,c_type;
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
	
	[myMainView startLoad];
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil alloc] init];
	//[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"http://sunflower.ibrandplatform.com/api/get_package_category.php?lang=2&type=tour"] :[[NSArray alloc]initWithObjects:@"next_level_api",@"category_icon",@"name",nil]];
	[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"%@",c_xml] :[[NSMutableArray alloc]initWithObjects:@"package_area",@"package_type",@"package_code",@"package_name",@"package_short_desc",@"package_startup_price",@"package_note",@"package_pdf_path",@"page_title",nil]];
	
	[XMLUtilView getErrorCode];
	[myMainView loadingStop];
	
    
	NSLog(@"啊庞被改造%@",(c_ccxml ? @"成功":@"失败"));
	NSString *c_cg=[[NSString alloc]initWithFormat:@"%@",(c_ccxml ? @"哈哈":@"操，这么垃圾")];
	NSLog(@"%@",c_cg);
	
	
	if ([(c_ccxml ? @"成功":@"失败")isEqualToString:@"成功"])
	{
		if (all==0) {
			[self dosomething1];
		}
		else {
			[self dosomething2];
		}
	}
	else {
		UIAlertView *netWorkError5 = 
		[[UIAlertView alloc] 
		 initWithTitle:@"無法連接到伺服器，請檢查你的網絡設定或可瀏覽離線內容\"旅遊錦囊\"。" 
		 message:@"" 
		 delegate:self 
		 cancelButtonTitle:@"確定" 
		 otherButtonTitles:nil,nil];
		[netWorkError5 show];
		[netWorkError5 release];
	}
	
	
}



-(void)dosomething1
{
	cc_mun=0;
	cc_mun2=0;
	
	myMainView.Tab2hiddenBtn.hidden=NO;
	
	//c_narraycode=[[NSMutableArray alloc]init];
	//c_narraypdf=[[NSMutableArray alloc]init];
	c_namenarray=[[NSMutableArray alloc]init];
	c_mumnarray=[[NSMutableArray alloc]init];
	
	
	c_pdf1=[[NSMutableArray alloc]init];
	c_pdf2=[[NSMutableArray alloc]init];
	c_name1=[[NSMutableArray alloc]init];
	c_name2=[[NSMutableArray alloc]init];
	c_price1=[[NSMutableArray alloc]init];
	c_price2=[[NSMutableArray alloc]init];
	c_code1=[[NSMutableArray alloc]init];
	c_code2=[[NSMutableArray alloc]init];
	
	
	
	
	
	
	
	
	
	for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"package_type"]count]; i++) 
	{
		
		
		NSString *code = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_code"]objectAtIndex:i]];
		NSString *na = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:i]];
		NSString *pri = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:i]];
		NSString *pdf = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_pdf_path"]objectAtIndex:i]];
		
		[c_pdf1 addObject:pdf];
		[c_name1 addObject:na];
		[c_price1 addObject:pri];
		[c_code1 addObject:code];
		
		
	}
	
	
	
	
	
	
	
	for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"package_area"]count]; i++) 
	{
		if (i==0) 
		{
			cc_mun=1;
			[c_namenarray addObject:[[XMLUtilView.tmpdic objectForKey:@"package_area"]objectAtIndex:0]];
		}
		else 
		{
			if ([[[XMLUtilView.tmpdic objectForKey:@"package_area"]objectAtIndex:i-1] isEqualToString:[[XMLUtilView.tmpdic objectForKey:@"package_area"]objectAtIndex:i]]) 
			{
				cc_mun=cc_mun;
			}
			else 
			{
				cc_mun++;
				[c_namenarray addObject:[[XMLUtilView.tmpdic objectForKey:@"package_area"]objectAtIndex:i]];
				
			}
			
		}
		
	}
	
	
	
	for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"package_area"]count]; i++) 
	{
		if (i==0) 
		{
			cc_mun2=1;
		}
		else 
		{
			if ([[[XMLUtilView.tmpdic objectForKey:@"package_area"]objectAtIndex:i-1] isEqualToString:[[XMLUtilView.tmpdic objectForKey:@"package_area"]objectAtIndex:i]]) 
	        {
				cc_mun2++;
			}
			else 
			{
				NSString *c_mum=[[NSString alloc]initWithFormat:@"%d",cc_mun2];
				[c_mumnarray addObject:c_mum];
				cc_mun2=1;
				
			}
			
		}
		if (i==[[XMLUtilView.tmpdic objectForKey:@"package_area"]count]-1) {
			NSString *c_mum=[[NSString alloc]initWithFormat:@"%d",cc_mun2];
			[c_mumnarray addObject:c_mum];
		}
		
	}
	
	
	
	
	
	self.view.backgroundColor=[UIColor grayColor];
	
	
	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	[self.view addSubview:topbar];
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar addSubview:c_I];
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	[self.view addSubview:BTN];
	
	
	
	
	
	tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=c_name;
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font=[UIFont boldSystemFontOfSize:20];
	[self.view addSubview:tittle];
	[tittle release];
	
	
	
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(aa:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	
	
	c_hidden=[[UIImageView alloc]initWithFrame:CGRectMake(0, 45,320 , 480-48)];
	c_hidden.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	//[c_hidden setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
	
	//c_hidden.hidden=YES;
	[self.view addSubview:c_hidden];
	
	c_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,45, 320, 412-45)];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	[self.view addSubview:c_tableview];
	
	
	
}
-(void)dosomething2
{
	
	
	self.navigationItem.title = c_name;
	
	
	c_pdf1=[[NSMutableArray alloc]init];
	c_pdf2=[[NSMutableArray alloc]init];
	c_name1=[[NSMutableArray alloc]init];
	c_name2=[[NSMutableArray alloc]init];
	c_price1=[[NSMutableArray alloc]init];
	c_price2=[[NSMutableArray alloc]init];
	c_code1=[[NSMutableArray alloc]init];
	c_code2=[[NSMutableArray alloc]init];
	
	[myMainView startLoad];
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil alloc] init];
	//[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"http://sunflower.ibrandplatform.com/api/get_package_category.php?lang=2&type=tour"] :[[NSArray alloc]initWithObjects:@"next_level_api",@"category_icon",@"name",nil]];
	[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"%@",c_xml] :[[NSMutableArray alloc]initWithObjects:@"package_type",@"package_code",@"package_name",@"package_short_desc",@"package_startup_price",@"package_note",@"package_pdf_path",@"page_title",nil]];
	
	[XMLUtilView getErrorCode];
	[myMainView loadingStop];
	
	
	
	
	for (int i=0; i<[[XMLUtilView.tmpdic objectForKey:@"package_type"]count]; i++) 
	{
	
		
		
		NSString *code = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_code"]objectAtIndex:i]];
		NSString *na = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:i]];
		NSString *pri = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:i]];
		NSString *pdf = [[NSString alloc]initWithFormat:@"%@",[[XMLUtilView.tmpdic objectForKey:@"package_pdf_path"]objectAtIndex:i]];
		
		[c_pdf1 addObject:pdf];
		[c_name1 addObject:na];
		[c_price1 addObject:pri];
		[c_code1 addObject:code];
		
	}
	
	
	
	self.view.backgroundColor=[UIColor grayColor];
	
	
	
	
	c_hidden=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,320 , 480-48)];
	c_hidden.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	//[c_hidden setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
	
	//c_hidden.hidden=YES;
	[self.view addSubview:c_hidden];
	
	c_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,0, 320, 412-45)];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	c_tableview.backgroundColor=[UIColor clearColor];
	[self.view addSubview:c_tableview];
	
	
	
}

-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}



- (CGFloat)tableView:(UITableView *)c_tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 120;
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
			c_image.alpha=0.9;
			[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
			[view addSubview:c_image];
			[c_image release];
			c_image=nil;
			
			
			UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 3,310,20)];
			lable1.text = [[NSString alloc] initWithFormat:@"%@",[c_namenarray objectAtIndex:i]];
			lable1.backgroundColor = [UIColor clearColor];
			lable1.font = [UIFont boldSystemFontOfSize:17];
			lable1.textColor=[UIColor grayColor];
			[view addSubview:lable1];
			
			
			UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, 1,310,20)];
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




//- (UIView *)tableView:(UITableView *)c_tableview viewForHeaderInSection:(NSInteger)section
//{
//	
//	UIView *view = nil;		
//	
//		if(section == 0)
//		{
//			view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
//			//view.backgroundColor = [UIColor blueColor];
//			UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,320,22)];
//			c_image.alpha=0.9;
//			[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
//			[view addSubview:c_image];
//			[c_image release];
//			c_image=nil;
//			
//			
//			UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
//			lable1.text=@"旅行團";
//			lable1.font = [UIFont boldSystemFontOfSize:17];
//			lable1.textColor=[UIColor grayColor];
//			lable1.backgroundColor = [UIColor clearColor];
//			[view addSubview:lable1];
//			[lable1 release];
//			
//			
//			UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
//			lable.text=@"旅行團";
//			lable.font = [UIFont boldSystemFontOfSize:17];
//			lable.textColor=[UIColor whiteColor];
//			lable.backgroundColor = [UIColor clearColor];
//			
//			[view addSubview:lable];
//			
//			[lable release];
//			lable = nil;
//		}
//		else 
//		{
//			view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
//			//view.backgroundColor = [UIColor blueColor];
//			UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0,320,22)];
//			c_image.alpha=0.9;
//			[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
//			[view addSubview:c_image];
//			[c_image release];
//			c_image=nil;
//			
//			
//			UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
//			lable1.text=@"自悠行";
//			lable1.font = [UIFont boldSystemFontOfSize:17];
//			lable1.textColor=[UIColor grayColor];
//			lable1.backgroundColor = [UIColor clearColor];
//			[view addSubview:lable1];
//			[lable1 release];
//			
//			
//			UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
//			lable.text=@"自悠行";
//			lable.font = [UIFont boldSystemFontOfSize:17];
//			lable.textColor=[UIColor whiteColor];
//			lable.backgroundColor = [UIColor clearColor];
//			[view addSubview:lable];
//			[lable release];
//			lable = nil;
//		}
//		
//	
//	
//	
//	
//	
//	return view;
//	
//}





//- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
//	[cell setSelected:NO];
//	
//	if (indexPath.section==0) {
//		OpenPDF *c_open=[[OpenPDF alloc]initWithNibName:@"OpenPDF" bundle:nil];
//		c_open.c_xml= [[NSString alloc]initWithFormat:@"%@",[c_pdf1 objectAtIndex:indexPath.row]];
//		c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[c_name1 objectAtIndex:indexPath.row]];
//		c_open.c_price=[[NSString alloc]initWithFormat:@"%@",[c_price1 objectAtIndex:indexPath.row]];
//		c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[c_code1 objectAtIndex:indexPath.row]];
//		
//		c_open.c_type=[[NSString alloc]initWithFormat:@"0"];
//		[self.navigationController pushViewController:c_open animated:YES];
//	}
//	else {
//		OpenPDF *c_open=[[OpenPDF alloc]initWithNibName:@"OpenPDF" bundle:nil];
//		c_open.c_xml= [[NSString alloc]initWithFormat:@"%@",[c_pdf2 objectAtIndex:indexPath.row]];
//		c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[c_name2 objectAtIndex:indexPath.row]];
//		c_open.c_price=[[NSString alloc]initWithFormat:@"%@",[c_price2 objectAtIndex:indexPath.row]];
//		c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[c_code2 objectAtIndex:indexPath.row]];
//		c_open.c_type=[[NSString alloc]initWithFormat:@"1"];
//		[self.navigationController pushViewController:c_open animated:YES];
//	}
//
//	
//}




- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	
	UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
	[cell setSelected:NO];
	
	
	for (int i=0; i<[c_mumnarray count]; i++) 
	{
		if (indexPath.section==i) 
		{
			
			
			if (i==0) 
			{
				
				OpenPDF *c_open=[[OpenPDF alloc]initWithNibName:@"OpenPDF" bundle:nil];
				c_open.c_xml= [[NSString alloc]initWithFormat:@"%@",[c_pdf1 objectAtIndex:indexPath.row]];
				c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[c_name1 objectAtIndex:indexPath.row]];
				c_open.c_price=[[NSString alloc]initWithFormat:@"%@",[c_price1 objectAtIndex:indexPath.row]];
				c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[c_code1 objectAtIndex:indexPath.row]];
				//c_open.c_type=[[NSString alloc]initWithFormat:@"%@",c_type];
				c_open.c_type=[[NSString alloc]initWithFormat:@"0"];
				[self.navigationController pushViewController:c_open animated:YES];
				
				
			}
			else 
			{
				for (int c_i=0; c_i<i; c_i++) {
					cc_mun3+= [[c_mumnarray objectAtIndex:c_i]intValue];
				}
				
				
				OpenPDF *c_open=[[OpenPDF alloc]initWithNibName:@"OpenPDF" bundle:nil];
				c_open.c_xml= [[NSString alloc]initWithFormat:@"%@",[c_pdf1 objectAtIndex:indexPath.row+cc_mun3]];
				c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[c_name1 objectAtIndex:indexPath.row+cc_mun3]];
				c_open.c_price=[[NSString alloc]initWithFormat:@"%@",[c_price1 objectAtIndex:indexPath.row+cc_mun3]];
				c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[c_code1 objectAtIndex:indexPath.row+cc_mun3]];
				//c_open.c_type=[[NSString alloc]initWithFormat:@"%@",c_type];
				c_open.c_type=[[NSString alloc]initWithFormat:@"1"];
				[self.navigationController pushViewController:c_open animated:YES];
			}
		}
		
		cc_mun3=0;
	}
	
	
}


//
//-(NSInteger)tableView:(UITableView *)c_tableview numberOfRowsInSection:(NSInteger)section 
//{
//	
//		
//	if (section==0) 
//	{
//		return [c_name1 count];
//	}
//	else
//	{
//		return [c_name2 count];
//	}
//	//c_name2
//    
//
//	
//}


-(NSInteger)tableView:(UITableView *)c_tv numberOfRowsInSection:(NSInteger)section
{
	int result=0;
	
	for (int i=0; i<[c_mumnarray count]; i++) {
		if (section==i) {
			result = [[c_mumnarray objectAtIndex:i] intValue];
            break;
		}
	}
    return result;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)c_tableview;              // Default is 1 if not implemented
{
	return [c_namenarray count];
}


- (UITableViewCell *)tableView:(UITableView *)c_tv
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
	
	//static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
	NSString *SimpleTableIdentifier = [[NSString alloc] initWithFormat:@"SimpleTableIdentifier_%d_%d", indexPath.row, indexPath.section];
	
	UITableViewCell *cell = [c_tableview dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
	
	
	
	if (cell == nil) {
		CGRect cellFrame = CGRectMake(0,0,320,65);
		cell = [[[UITableViewCell alloc] initWithFrame:cellFrame
									   reuseIdentifier:SimpleTableIdentifier] autorelease];
		//cell.selectionStyle = UITableViewCellSelectionStyleGray;
		cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.bounds] autorelease];
		cell.selectedBackgroundView.backgroundColor =  [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
		if (indexPath.row%2==1) 
		{
			UIImageView *IMG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
			//	[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
			IMG.backgroundColor=[UIColor whiteColor];
			IMG.alpha=0.5;
			[cell.contentView addSubview:IMG];
			[IMG release];
			IMG=nil;
		}
		else 
		{
			
			
			UIImageView *IMG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
	        IMG.backgroundColor=[UIColor whiteColor];
			IMG.alpha=0.5;
			[cell.contentView addSubview:IMG];
			[IMG release];
			IMG=nil;
		}		
		
		
		for (int i=0; i<[c_mumnarray count]; i++) 
		{
			if (indexPath.section==i) 
			{
				
				
			    if (i==0) 
			    {
					
					NSString *c_ls=[[NSString alloc]init];
					c_ls = [[c_name1 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,5)];
					NSLog(@"%@and this%@",c_ls,[c_name1 objectAtIndex:indexPath.row]);
					if ([c_ls isEqualToString:@"<font"]) {
						if ([[c_name1 objectAtIndex:indexPath.row] length]>54+23) {
							c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......",[[c_name1 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(16,54)]];
							
						}
						else {
							
							c_NSST=[[NSString alloc]initWithFormat:@"%@",[c_name1 objectAtIndex:indexPath.row]];
							
						}
					}
					else {
						if ([[c_name1 objectAtIndex:indexPath.row] length]>54) {
							c_NSST=[[NSString alloc]initWithFormat:@"%@......",[[c_name1 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,54)]];
							
						}
						else {
							c_NSST=[[NSString alloc]initWithFormat:@"%@",[c_name1 objectAtIndex:indexPath.row]];
							
						}
						
					}
					
					
					UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 240, 120)];
					[m_pWebView setDelegate:self];
					m_pWebView.backgroundColor = [UIColor clearColor];
					m_pWebView.opaque = NO;
					m_pWebView.userInteractionEnabled=NO;
					//NSString *c_nsstring=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name1 objectAtIndex:indexPath.row],[c_code1 objectAtIndex:indexPath.row]];
					//NSURL *temp_URL = [[NSURL alloc]initWithString:c_NSST];
					//NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
					[m_pWebView loadHTMLString:c_NSST baseURL:nil];
					//[cell.contentView addSubview:m_pWebView];
					
					
					UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, -4, 240, 120)];
					
                    c_textview.text=c_NSST;
					[cell.contentView addSubview:c_textview];
					c_textview.backgroundColor=[UIColor clearColor];
					c_textview.userInteractionEnabled=NO;
					c_textview.textAlignment = UITextAlignmentLeft;
					c_textview.font = [UIFont boldSystemFontOfSize:15];
					[c_textview release];
					c_textview=nil;
					
					
					UITextView *c_textview2=[[UITextView alloc]initWithFrame:CGRectMake(0, 10, 240, 120)];
					
                    c_textview2.text=[[NSString alloc]initWithFormat:@"\n\n\n\n「%@」",[c_code1 objectAtIndex:indexPath.row]];
					[cell.contentView addSubview:c_textview2];
					c_textview2.backgroundColor=[UIColor clearColor];
					c_textview2.userInteractionEnabled=NO;
					c_textview2.textAlignment = UITextAlignmentLeft;
					c_textview2.font = [UIFont boldSystemFontOfSize:15];
					[c_textview2 release];
					c_textview2=nil;
					
					
					
					if ([[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row]intValue]!=0) {
						UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
						//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
						c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row]intValue]];
						[cell.contentView addSubview:c_textview1];
						c_textview1.backgroundColor=[UIColor clearColor];
						c_textview1.userInteractionEnabled=NO;
						c_textview1.textAlignment = UITextAlignmentLeft;
						c_textview1.font = [UIFont boldSystemFontOfSize:15];
						[c_textview1 release];
						c_textview=nil;
					}
					
					
					UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
					//topbar.backgroundColor = [UIColor lightGrayColor];
					[cell.contentView addSubview:C_IMG];
					[C_IMG release];
					C_IMG=nil;
					
			    }
			    else 
			    {
				    for (int c_i=0; c_i<i; c_i++) {
					    cc_mun3+= [[c_mumnarray objectAtIndex:c_i]intValue];
				    }
										
					
					
					
					NSString *c_ls=[[NSString alloc]init];
					//c_ls=
					c_ls = [[c_name1 objectAtIndex:indexPath.row+cc_mun3] substringWithRange:NSMakeRange(0,5)];
					NSLog(@"%@and this%@",c_ls,[c_name1 objectAtIndex:indexPath.row+cc_mun3]);
					if ([c_ls isEqualToString:@"<font"]) {
						if ([[c_name1 objectAtIndex:indexPath.row+cc_mun3] length]>54+23) {
							c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......",[[c_name1 objectAtIndex:indexPath.row+cc_mun3] substringWithRange:NSMakeRange(16,54)]];
							
						}
						else {
							c_NSST=[[NSString alloc]initWithFormat:@"%@",[c_name1 objectAtIndex:indexPath.row+cc_mun3]];
							
						}
					}
					else {
						if ([[c_name1 objectAtIndex:indexPath.row+cc_mun3] length]>54) {
							c_NSST=[[NSString alloc]initWithFormat:@"%@......",[[c_name1 objectAtIndex:indexPath.row+cc_mun3] substringWithRange:NSMakeRange(0,54)]];
							
						}
						else {
							c_NSST=[[NSString alloc]initWithFormat:@"%@",[c_name1 objectAtIndex:indexPath.row+cc_mun3]];
							
						}
						
					}
					
					
					
					UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 240, 120)];
					[m_pWebView setDelegate:self];
					m_pWebView.backgroundColor = [UIColor clearColor];
					m_pWebView.opaque = NO;
					m_pWebView.userInteractionEnabled=NO;
					//NSString *c_nsstring=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name1 objectAtIndex:indexPath.row],[c_code1 objectAtIndex:indexPath.row]];
					//NSURL *temp_URL = [[NSURL alloc]initWithString:c_NSST];
					//NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
					[m_pWebView loadHTMLString:c_NSST baseURL:nil];
					//[cell.contentView addSubview:m_pWebView];
					
					
					
					UITextView *c_textview2=[[UITextView alloc]initWithFrame:CGRectMake(0, 10, 240, 120)];
					
                    c_textview2.text=[[NSString alloc]initWithFormat:@"\n\n\n\n「%@」",[c_code1 objectAtIndex:indexPath.row+cc_mun3]];
					[cell.contentView addSubview:c_textview2];
					c_textview2.backgroundColor=[UIColor clearColor];
					c_textview2.userInteractionEnabled=NO;
					c_textview2.textAlignment = UITextAlignmentLeft;
					c_textview2.font = [UIFont boldSystemFontOfSize:15];
					[c_textview2 release];
					c_textview2=nil;
					
					
					
					UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, -4, 240, 120)];
					
                    c_textview.text=c_NSST;
					[cell.contentView addSubview:c_textview];
					c_textview.backgroundColor=[UIColor clearColor];
					c_textview.userInteractionEnabled=NO;
					c_textview.textAlignment = UITextAlignmentLeft;
					c_textview.font = [UIFont boldSystemFontOfSize:15];
					[c_textview release];
					c_textview=nil;
					

					
					
					if ([[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row]intValue]!=0) {
						UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
						//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
						c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row]intValue]];
						[cell.contentView addSubview:c_textview1];
						c_textview1.backgroundColor=[UIColor clearColor];
						c_textview1.userInteractionEnabled=NO;
						c_textview1.textAlignment = UITextAlignmentLeft;
						c_textview1.font = [UIFont boldSystemFontOfSize:15];
						[c_textview1 release];
						c_textview=nil;
					}
					
					
					UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
					//topbar.backgroundColor = [UIColor lightGrayColor];
					[cell.contentView addSubview:C_IMG];
					[C_IMG release];
					C_IMG=nil;
			    }
			}
			cc_mun3=0;
		}
	}
	
	[SimpleTableIdentifier release];
	SimpleTableIdentifier = nil;
	
	return cell;
}



/*


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
		
		
		//NSUInteger row = [indexPath row];
		
		if (indexPath.row%2==1) {
			
			
			UIImageView *IMG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
			//[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
			IMG.backgroundColor=[UIColor whiteColor];
			IMG.alpha=0.5;
			[cell.contentView addSubview:IMG];
			
			
			
			
		}
		else {
			
			
			
			UIImageView *IMG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
	        //IMG.backgroundColor=[UIColor lightGrayColor];
			//IMG.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			//[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tableviewcell"] ofType:@"png"]]];
			IMG.backgroundColor=[UIColor whiteColor];
			IMG.alpha=0.5;
			[cell.contentView addSubview:IMG];
		}		
		
		
			if (indexPath.section==0) {
				
				
				
				
				UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
				//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:indexPath.row];
				c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name1 objectAtIndex:indexPath.row],[c_code1 objectAtIndex:indexPath.row]];
				//[cell.contentView addSubview:c_textview];
				c_textview.backgroundColor=[UIColor clearColor];
				//c_textview.textColor=[UIColor redColor];
				c_textview.userInteractionEnabled=NO;
				c_textview.textAlignment = UITextAlignmentLeft;
				c_textview.font = [UIFont boldSystemFontOfSize:15];
				[c_textview release];
				
				//45
				
				NSString *c_ls=[[NSString alloc]init];
				//c_ls=
				c_ls = [[c_name1 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,5)];
				NSLog(@"%@and this%@",c_ls,[c_name1 objectAtIndex:indexPath.row]);
				if ([c_ls isEqualToString:@"<font"]) {
					if ([[c_name1 objectAtIndex:indexPath.row] length]>39+23) {
						c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......「%@」",[[c_name1 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(16,39)],[c_code1 objectAtIndex:indexPath.row]];
						
					}
					else {
						c_NSST=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name1 objectAtIndex:indexPath.row],[c_code1 objectAtIndex:indexPath.row]];
						
					}
				}
				else {
					if ([[c_name1 objectAtIndex:indexPath.row] length]>39) {
						c_NSST=[[NSString alloc]initWithFormat:@"%@......「%@」",[[c_name1 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,39)],[c_code1 objectAtIndex:indexPath.row]];
						
					}
					else {
						c_NSST=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name1 objectAtIndex:indexPath.row],[c_code1 objectAtIndex:indexPath.row]];
						
					}

				}

				

				UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 240, 120)];
				[m_pWebView setDelegate:self];
				m_pWebView.backgroundColor = [UIColor clearColor];
				m_pWebView.opaque = NO;
				m_pWebView.userInteractionEnabled=NO;
				//NSString *c_nsstring=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name1 objectAtIndex:indexPath.row],[c_code1 objectAtIndex:indexPath.row]];
				NSURL *temp_URL = [[NSURL alloc]initWithString:c_NSST];
				NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
				[m_pWebView loadHTMLString:c_NSST baseURL:nil];
				[cell.contentView addSubview:m_pWebView];
				
				
				if ([[c_price1 objectAtIndex:indexPath.row]intValue]!=0) {
					UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
					//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
					c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[c_price1 objectAtIndex:indexPath.row]intValue]];
					[cell.contentView addSubview:c_textview1];
					c_textview1.backgroundColor=[UIColor clearColor];
					c_textview1.userInteractionEnabled=NO;
					c_textview1.textAlignment = UITextAlignmentLeft;
					c_textview1.font = [UIFont boldSystemFontOfSize:15];
					[c_textview1 release];
				}
				
				
				
				
				UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
				[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
				//topbar.backgroundColor = [UIColor lightGrayColor];
				[cell.contentView addSubview:C_IMG];
				
				
				
			}
		
		else if (indexPath.section==1){
			 
				
			
			
			
			UITextView *c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
			//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:indexPath.row];
			c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name2 objectAtIndex:indexPath.row],[c_code2 objectAtIndex:indexPath.row]];
			//[cell.contentView addSubview:c_textview];
			c_textview.backgroundColor=[UIColor clearColor];
			c_textview.userInteractionEnabled=NO;
			c_textview.textAlignment = UITextAlignmentLeft;
			c_textview.font = [UIFont boldSystemFontOfSize:15];
			[c_textview release];
			
			
			
			
			
			
			
			
			
			
			NSString *c_ls=[[NSString alloc]init];
			c_ls = [[c_name2 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,5)];
			
			if ([c_ls isEqualToString:@"<font"]) {
				if ([[c_name1 objectAtIndex:indexPath.row] length]>39+23) {
					c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......「%@」",[[c_name2 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(16,39)],[c_code2 objectAtIndex:indexPath.row]];
				}
				else {
					c_NSST=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name2 objectAtIndex:indexPath.row],[c_code2 objectAtIndex:indexPath.row]];
				}
			}
			else {
				if ([[c_name2 objectAtIndex:indexPath.row] length]>39) {
					c_NSST=[[NSString alloc]initWithFormat:@"%@......「%@」",[[c_name2 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,39)],[c_code2 objectAtIndex:indexPath.row]];
				}
				else {
					c_NSST=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name2 objectAtIndex:indexPath.row],[c_code2 objectAtIndex:indexPath.row]];
				}
			}

			
			
			
			
			UIWebView *m_pWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 240, 120)];
			[m_pWebView setDelegate:self];
			m_pWebView.backgroundColor = [UIColor clearColor];
			m_pWebView.opaque = NO;
			m_pWebView.userInteractionEnabled=NO;
			//NSString *c_nsstring=[[NSString alloc]initWithFormat:@"%@「%@」",[c_name2 objectAtIndex:indexPath.row],[c_code2 objectAtIndex:indexPath.row]];
			NSURL *temp_URL = [[NSURL alloc]initWithString:c_NSST];
			NSURLRequest *temp_URLRequest = [[NSURLRequest alloc] initWithURL:temp_URL];
			[m_pWebView loadHTMLString:c_NSST baseURL:nil];
			[cell.contentView addSubview:m_pWebView];
			
			
			
			
			if ([[c_price2 objectAtIndex:indexPath.row]intValue]!=0) {
				UITextView *c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
				//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
				c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[c_price2 objectAtIndex:indexPath.row]intValue]];
				[cell.contentView addSubview:c_textview1];
				c_textview1.backgroundColor=[UIColor clearColor];
				c_textview1.userInteractionEnabled=NO;
				c_textview1.textAlignment = UITextAlignmentLeft;
				c_textview1.font = [UIFont boldSystemFontOfSize:15];
				[c_textview1 release];
			}
			
			
			
			
			UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
			[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
			
			[cell.contentView addSubview:C_IMG];
			
		}
	}
	
	[SimpleTableIdentifier release];
	SimpleTableIdentifier = nil;
	
	return cell;
}

*/
-(void)aa:(id)sender
{
	[self.navigationController popViewControllerAnimated:YES];
}


-(void)next:(id)sender
{
	
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"1"];
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"0"];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
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

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	switch(buttonIndex)
	{

		case 0:
			[myMainView mainviewinitstate:4];
			[myMainView mainviewdelete];
			
			break;
	}
}


- (void)dealloc {
    [super dealloc];
	[XMLUtilView release];
	[btnfoot release];
	[c_xml release];
	[c_name release];
	//[c_narray release];
	[c_tableview release];
	[c_pdf1 release];
	[c_pdf2 release];
	[c_name1 release];
	[c_name2 release];
	[c_price1 release];
	[c_price2 release];
	[c_code1 release];
	[c_code2 release];
	[topbar release];
		
}


@end
