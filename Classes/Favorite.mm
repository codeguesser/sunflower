//
//  Favorite.mm
//  New_Projects
//
//  Created by chen cool on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Favorite.h"
#import "MainView.h"
#import "PDFScrollView.h"
#import "FavoriteBook.h"
//#import "FavoriteAbout.h"
#import "EnquiryViewMy.h"
extern MainView *myMainView;
extern BOOL c_ccxml;
extern int all;
int k=0;
@implementation Favorite
@synthesize c_tableview;
@synthesize DataArray,DataArray2,DataArray3,DataArray4,DataArray5,DataArray6,DataArray7,DataArray8;

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




-(void)viewDidAppear:(BOOL)animated
{
	
}





// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];

	
	
	
	
	if(XMLUtilView!=nil)
	{
		[XMLUtilView release];
		XMLUtilView = nil;
	}
	XMLUtilView = [[XMLUtil alloc] init];
	[XMLUtilView xmlParserByUrl:[NSString stringWithFormat:@"http://www.sunflower.com.hk/sf2010/iPhoneApps/info.xml"] :[[NSArray alloc]initWithObjects:@"sub_cat_name",@"next_level_api",@"info",@"package_pdf_path",nil]];
	//[XMLUtilView getErrorCode];
	
	
	
	
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
		
		NSLog(@"tab5还是没网络链接");
		NSLog(@"没网络链接玩你妹的iphone啊");
		
		UIAlertView *netWorkError5 = 
		[[UIAlertView alloc] 
		 initWithTitle:@"無法連接到伺服器，請檢查你的網絡設定或可瀏覽離線內容\"旅遊錦囊\""
		 message:@"" 
		 delegate:self 
		 cancelButtonTitle:@"確定" 
		 otherButtonTitles:nil,nil];
		[netWorkError5 show];
		[netWorkError5 release];
	}

    
    [self.view bringSubviewToFront:m_pLabel1];
    [self.view bringSubviewToFront:m_pLabel2];
	

	
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

-(void)dosomething1
{
	
	self.view.backgroundColor=[UIColor colorWithRed:255/255.0f
                                              green:255/255.0f
                                               blue:255/255.0f
                                              alpha:1.0f];
	
	FirstBlood=[[NSString alloc]initWithString:@"1"];
	
	backgroundView =[[UIImageView alloc] init ];
	XX=0;
	indexrow=-1;
	
	[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];
	//DataArray=[[NSMutableArray alloc] init];
	//[self.navigationController.navigationBar setAlpha:0.5];
	
	
	
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path=[paths    objectAtIndex:0];
	NSString *filename=[path stringByAppendingPathComponent:@"c_name.plist"];
	NSMutableArray *array=[[NSMutableArray alloc] initWithContentsOfFile:filename];
	self.DataArray=array;
	
	NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path1=[paths1    objectAtIndex:0];
	NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml.plist"];
	NSMutableArray *array1=[[NSMutableArray alloc] initWithContentsOfFile:filename1];
	self.DataArray2=array1;
	
	
	NSArray *paths4=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path4=[paths4    objectAtIndex:0];
	NSString *filename4=[path4 stringByAppendingPathComponent:@"c_price.plist"];
	NSMutableArray *array4=[[NSMutableArray alloc] initWithContentsOfFile:filename4];
	self.DataArray5=array4;
	
	NSArray *paths5=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path5=[paths5    objectAtIndex:0];
	NSString *filename5=[path5 stringByAppendingPathComponent:@"c_pack.plist"];
	NSMutableArray *array5=[[NSMutableArray alloc] initWithContentsOfFile:filename5];
	self.DataArray6=array5;
	
	
	NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path2=[paths2    objectAtIndex:0];
	NSString *filename2=[path2 stringByAppendingPathComponent:@"c_name1.plist"];
	NSMutableArray *array2=[[NSMutableArray alloc] initWithContentsOfFile:filename2];
	self.DataArray3=array2;
	
	NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path3=[paths3    objectAtIndex:0];
	NSString *filename3=[path3 stringByAppendingPathComponent:@"c_xml1.plist"];
	NSMutableArray *array3=[[NSMutableArray alloc] initWithContentsOfFile:filename3];
	self.DataArray4=array3;
	
	
	NSArray *paths6=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path6=[paths6    objectAtIndex:0];
	NSString *filename6=[path6 stringByAppendingPathComponent:@"c_price1.plist"];
	NSMutableArray *array6=[[NSMutableArray alloc] initWithContentsOfFile:filename6];
	self.DataArray7=array6;
	
	NSArray *paths7=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path7=[paths7    objectAtIndex:0];
	NSString *filename7=[path7 stringByAppendingPathComponent:@"c_pack1.plist"];
	NSMutableArray *array7=[[NSMutableArray alloc] initWithContentsOfFile:filename7];
	self.DataArray8=array7;
	
	
	
	UIImageView *SwitchBg=[[UIImageView alloc]init];
	//SwitchBg.frame=CGRectMake(0, 45, 320, 50);
	SwitchBg.frame=CGRectMake(0, 0, 320, 480);
	//[SwitchBg setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"BAR"] ofType:@"png"]]];
	SwitchBg.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:SwitchBg];
	[SwitchBg release];
	
	
	//self.navigationController.T.hidden=NO;
	
	topbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	[self.view addSubview:topbar];
	
	//[self.navigationController.navigationBar addSubview:topbar];
	
	
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
	//[self.navigationController.navigationBar addSubview:BTN];
	[self.view addSubview:BTN];
	
	
	
	
	UILabel *tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=@"我的最愛";
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font = [UIFont boldSystemFontOfSize:20];
	//[topbar addSubview:tittle1];
	[tittle1 release];
	
	
	
	UILabel *tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=@"我的最愛";
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font = [UIFont boldSystemFontOfSize:20];
	//[self.view addSubview:tittle];
	
	[topbar addSubview:tittle];
	[tittle release];
	
	
	
	c_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,45, 320, 412-45)];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	if ([DataArray count]==0&&[DataArray3 count]==0) {
        
        m_pLabel1.hidden =NO;
        m_pLabel2.hidden = NO;
        
		c_tableview.separatorColor=[UIColor clearColor];
	}
	else {
		c_tableview.separatorColor=[UIColor colorWithRed:145.0f/255.0 
                                                   green:145.0f/255.0 
                                                    blue:145.0f/255.0 
                                                   alpha:1.0];
		
	}
	
    c_tableview.backgroundColor=[UIColor colorWithRed:235.0f/255.0f
                                                green:235.0f/255.0f
                                                 blue:235.0f/255.0f alpha:1.0f];
	//if ([DataArray count]==0&&[DataArray3 count]==0) {
	//		c_tableview.hidden=YES;
	//	}
	//	else {
	//		c_tableview.hidden=NO;
	//	}
	
	[self.view addSubview:c_tableview];
	
	c_tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
	
	
	editButton = [[UIBarButtonItem alloc]initWithTitle:@"刪除" style:UIBarButtonItemStyleBordered
												target:self
												action:@selector(toggleEdit:)];
	
	
	
	//icon_del
	
	self.editing = YES;
	//self.navigationItem.leftBarButtonItem = editButton;
	
	
	
	
	
	c_BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[c_BTN addTarget:self action:@selector(toggleEdit:)forControlEvents:UIControlEventTouchUpInside];
	[c_BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_del_blank"] ofType:@"png"]] forState:UIControlStateNormal];
	c_BTN.frame = CGRectMake(15, 7, 55, 31);
	//[self.navigationController.navigationBar addSubview:c_BTN];
	[self.view addSubview:c_BTN];
	
	c_mylabe=[[UILabel alloc]initWithFrame:CGRectMake(29, 4, 55, 35)];
	c_mylabe.text=@"刪除";
	c_mylabe.textColor=[UIColor whiteColor];
	c_mylabe.backgroundColor=[UIColor clearColor];
	c_mylabe.font = [UIFont boldSystemFontOfSize:13];
	//[self.navigationController.navigationBar addSubview:c_mylabe];
	[self.view addSubview:c_mylabe];
	
	
	
	//self.navigationItem.hidesBackButton=YES;
	
	for(int i=0;i<5;i++)
	{
		if(i==4)
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
	
	
	
	[self ReUpdateImage];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ReUpdateImage) name:@"PDFFinish" object:nil];
	
}
-(void)dosomething2
{
	self.navigationItem.title = @"我的最愛";
	self.view.backgroundColor=[UIColor colorWithRed:75.0f/255.0f
                                              green:75.0f/255.0f
                                               blue:75.0f/255.0f
                                              alpha:1.0f];
	
	FirstBlood=[[NSString alloc]initWithString:@"1"];
	
	backgroundView =[[UIImageView alloc] init ];
	XX=0;
	indexrow=-1;
	
	[self.navigationController.navigationBar setTintColor: [UIColor colorWithRed:1.0 green:78.0/255.0 blue:0.0 alpha:1.0]];
	//DataArray=[[NSMutableArray alloc] init];
	//[self.navigationController.navigationBar setAlpha:0.5];
	
	
	
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path=[paths    objectAtIndex:0];
	NSString *filename=[path stringByAppendingPathComponent:@"c_name.plist"];
	NSMutableArray *array=[[NSMutableArray alloc] initWithContentsOfFile:filename];
	self.DataArray=array;
	
	NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path1=[paths1    objectAtIndex:0];
	NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml.plist"];
	NSMutableArray *array1=[[NSMutableArray alloc] initWithContentsOfFile:filename1];
	self.DataArray2=array1;
	
	
	NSArray *paths4=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path4=[paths4    objectAtIndex:0];
	NSString *filename4=[path4 stringByAppendingPathComponent:@"c_price.plist"];
	NSMutableArray *array4=[[NSMutableArray alloc] initWithContentsOfFile:filename4];
	self.DataArray5=array4;
	
	NSArray *paths5=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path5=[paths5    objectAtIndex:0];
	NSString *filename5=[path5 stringByAppendingPathComponent:@"c_pack.plist"];
	NSMutableArray *array5=[[NSMutableArray alloc] initWithContentsOfFile:filename5];
	self.DataArray6=array5;
	
	
	NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path2=[paths2    objectAtIndex:0];
	NSString *filename2=[path2 stringByAppendingPathComponent:@"c_name1.plist"];
	NSMutableArray *array2=[[NSMutableArray alloc] initWithContentsOfFile:filename2];
	self.DataArray3=array2;
	
	NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path3=[paths3    objectAtIndex:0];
	NSString *filename3=[path3 stringByAppendingPathComponent:@"c_xml1.plist"];
	NSMutableArray *array3=[[NSMutableArray alloc] initWithContentsOfFile:filename3];
	self.DataArray4=array3;
	
	
	NSArray *paths6=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path6=[paths6    objectAtIndex:0];
	NSString *filename6=[path6 stringByAppendingPathComponent:@"c_price1.plist"];
	NSMutableArray *array6=[[NSMutableArray alloc] initWithContentsOfFile:filename6];
	self.DataArray7=array6;
	
	NSArray *paths7=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	NSString *path7=[paths7    objectAtIndex:0];
	NSString *filename7=[path7 stringByAppendingPathComponent:@"c_pack1.plist"];
	NSMutableArray *array7=[[NSMutableArray alloc] initWithContentsOfFile:filename7];
	self.DataArray8=array7;
	
	
	
	UIImageView *SwitchBg=[[UIImageView alloc]init];
	//SwitchBg.frame=CGRectMake(0, 45, 320, 50);
	SwitchBg.frame=CGRectMake(0, 0, 320, 480);
	//[SwitchBg setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"BAR"] ofType:@"png"]]];
	SwitchBg.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:SwitchBg];
	[SwitchBg release];
	
	
	
	
	c_tableview=[[UITableView alloc]initWithFrame:CGRectMake(0,0, 320, 412-45)];
	c_tableview.delegate = self;
	c_tableview.dataSource = self;
	if ([DataArray count]==0&&[DataArray3 count]==0) {
        
        m_pLabel1.hidden =NO;
        m_pLabel2.hidden = NO;
		c_tableview.separatorColor=[UIColor clearColor];
	}
	else {
		c_tableview.separatorColor=[UIColor colorWithRed:145.0f/255.0 
                                                   green:145.0f/255.0 
                                                    blue:145.0f/255.0 alpha:1.0];
		
	}
	
    c_tableview.backgroundColor=[UIColor colorWithRed:235.0f/255.0f
                                                green:235.0f/255.0f
                                                 blue:235.0f/255.0f
                                                alpha:1.0f];
	
	
	[self.view addSubview:c_tableview];
	

	
	[self ReUpdateImage];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ReUpdateImage) name:@"PDFFinish" object:nil];
	
}






-(void)next:(id)sender
{
	
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"1"];
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"4"];
	[self.navigationController setNavigationBarHidden:YES animated:YES];
	
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
}




-(IBAction)toggleEdit:(id)sender
{
	[self.c_tableview setEditing:!self.c_tableview.editing animated:YES];
	
	if(self.c_tableview.editing)
	{
		
	
		[self.navigationItem.leftBarButtonItem setTitle:@"完成"];
	    
		c_mylabe.text=@"完成";

		indexrow=-1;
		FirstBlood=[[NSString alloc]initWithString:@"2"];
		[self StartTimer];
		
		NSLog(@"33");
	}	
	else
	{
		[self.navigationItem.leftBarButtonItem setTitle:@"刪除"];
		c_mylabe.text=@"刪除";
		
		
		NSLog(@"44");
		
		FirstBlood=[[NSString alloc]initWithString:@"1"];
		
		
		
	}
	
}


-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}


-(IBAction) no:(id)sender
{
	NSLog(@"111111");
}



#pragma mark tableView


- (CGFloat)tableView:(UITableView *)c_tableview heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	return 120;
	
}





- (void)tableView:(UITableView *)tv didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	
	UITableViewCell *cell = [c_tableview cellForRowAtIndexPath:indexPath];
	[cell setSelected:NO];
	
	FavoriteBook *c_open=[[FavoriteBook alloc]initWithNibName:@"FavoriteBook" bundle:nil];
	
	if ([DataArray count]==0) {
		c_open.c_xml=[[NSString alloc]initWithFormat:@"%@",[DataArray4 objectAtIndex:indexPath.row]];
		//6
		c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[DataArray8 objectAtIndex:indexPath.row]];
		c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[DataArray3 objectAtIndex:indexPath.row]];
	}
	else if([DataArray3 count]==0){
		c_open.c_xml=[[NSString alloc]initWithFormat:@"%@",[DataArray2 objectAtIndex:indexPath.row]];
		c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[DataArray6 objectAtIndex:indexPath.row]];
		c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[DataArray objectAtIndex:indexPath.row]];
		//8
	}
	else {
		if (indexPath.section==0) {
			c_open.c_xml=[[NSString alloc]initWithFormat:@"%@",[DataArray2 objectAtIndex:indexPath.row]];
			c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[DataArray6 objectAtIndex:indexPath.row]];
			c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[DataArray objectAtIndex:indexPath.row]];
			
		}
		else {
			c_open.c_xml=[[NSString alloc]initWithFormat:@"%@",[DataArray4 objectAtIndex:indexPath.row]];
			c_open.c_pack=[[NSString alloc]initWithFormat:@"%@",[DataArray8 objectAtIndex:indexPath.row]];
			c_open.c_name=[[NSString alloc]initWithFormat:@"%@",[DataArray3 objectAtIndex:indexPath.row]];
			
		}
	}


	

	c_BTN.hidden=YES;
	
	[self.navigationController pushViewController:c_open animated:YES];
	
	
}





-(NSInteger)tableView:(UITableView *)c_tableview numberOfRowsInSection:(NSInteger)section
{
    if ([DataArray count]==0&&[DataArray3 count]==0) {
        
        m_pLabel1.hidden =NO;
        m_pLabel2.hidden = NO;
    }
	if ([DataArray count]==0) {
		return [DataArray3 count];
		
	}
	else if([DataArray3 count]==0)
	{
		return [DataArray count];
	}
	else {
		if (section==0) {
			return [DataArray count];
		}
		else {
			return [DataArray3 count];
		}
	}

	

}




- (UITableViewCell *)tableView:(UITableView *)c_tv
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	
	
	static NSString *DeleteMeCellIdentifier = @"DeleteMeCellIdentifier";
	UITableViewCell *cell = [c_tableview dequeueReusableCellWithIdentifier:DeleteMeCellIdentifier];
	if (cell == nil) {
		
		
		
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
									   reuseIdentifier:DeleteMeCellIdentifier] autorelease];
		
		
		
		CGRect cellFrame = CGRectMake(0,0,320,65);
		cell.selectedBackgroundView = [[[UIView alloc] initWithFrame:cell.bounds] autorelease];
		cell.selectedBackgroundView.backgroundColor =  [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
		
		
		
		
		
		
		if (indexPath.row%2==1) {
			
			UIImageView *IMG=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
			IMG.backgroundColor=[UIColor whiteColor];
			//[cell.contentView addSubview:IMG];
			
		}
		else {
			UIImageView *IMG=[[UIImageView alloc]initWithFrame:CGRectMake(-40, 0, 360, 120)];
			//IMG.backgroundColor=[UIColor lightGrayColor];
			IMG.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			IMG.backgroundColor=[UIColor whiteColor];
			[cell.contentView addSubview:IMG];
			
			//[cell setBackgroundColor:[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0]];
		}	
		
			if([DataArray count]==0)
				{
					
					
				   
					if ([FirstBlood isEqualToString:@"1"])
					{
						c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
						
					}
					else {
						c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
						
					}
					
					
					NSString *c_ls=[[NSString alloc]init];
					c_ls = [[DataArray3 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,5)];
					NSLog(@"%@and this%@",c_ls,[DataArray3 objectAtIndex:indexPath.row]);
					if ([c_ls isEqualToString:@"<font"]) {
						if ([[DataArray3 objectAtIndex:indexPath.row] length]>50+23) {
							c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......",[[DataArray3 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(16,50)]];
							
						}
						else {
							c_NSST=[[NSString alloc]initWithFormat:@"%@",[DataArray3 objectAtIndex:indexPath.row]];
							
						}
					}
					else {
						if ([[DataArray3 objectAtIndex:indexPath.row] length]>50) {
							c_NSST=[[NSString alloc]initWithFormat:@"%@......",[[DataArray3 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,50)]];
							
						}
						else {
							c_NSST=[[NSString alloc]initWithFormat:@"%@",[DataArray3 objectAtIndex:indexPath.row]];
							
						}
						
					}
					
					
					c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
					//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:indexPath.row];
					
					//if ([[DataArray3 objectAtIndex:indexPath.row] length]+[[DataArray8 objectAtIndex:indexPath.row] length]>14*5) {
//						NSString *nowdate = [[DataArray3 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,14*4+5)];
//						c_textview.text=[[NSString alloc]initWithFormat:@"%@......",nowdate];
//						
//						
//					}
//					else {
//						c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[DataArray3 objectAtIndex:indexPath.row],[DataArray8 objectAtIndex:indexPath.row]];
//						
//					}
					//c_NSST
					c_textview.text=[[NSString alloc]initWithFormat:@"%@",c_NSST];
					
					//c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[DataArray3 objectAtIndex:indexPath.row],[DataArray8 objectAtIndex:indexPath.row]];
					[cell.contentView addSubview:c_textview];
					c_textview.backgroundColor=[UIColor clearColor];
					c_textview.userInteractionEnabled=NO;
					c_textview.textAlignment = UITextAlignmentLeft;
					c_textview.font = [UIFont boldSystemFontOfSize:15];
					
					
					
					UITextView *c_textview2=[[UITextView alloc]initWithFrame:CGRectMake(0, 10, 240, 120)];
					
					c_textview2.text=[[NSString alloc]initWithFormat:@"\n\n\n\n「%@」",[DataArray8 objectAtIndex:indexPath.row]];
					[cell.contentView addSubview:c_textview2];
					c_textview2.backgroundColor=[UIColor clearColor];
					c_textview2.userInteractionEnabled=NO;
					c_textview2.textAlignment = UITextAlignmentLeft;
					c_textview2.font = [UIFont boldSystemFontOfSize:15];
					[c_textview2 release];
					c_textview2=nil;
					
					
					
					if ([[DataArray7 objectAtIndex:indexPath.row]intValue]!=0) {
						c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
						//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
						c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[DataArray7 objectAtIndex:indexPath.row]intValue]];
						[cell.contentView addSubview:c_textview1];
						c_textview1.backgroundColor=[UIColor clearColor];
						c_textview1.userInteractionEnabled=NO;
						c_textview1.textAlignment = UITextAlignmentLeft;
						c_textview1.font = [UIFont boldSystemFontOfSize:15];
						
						
					}
						
						
					UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
					//topbar.backgroundColor = [UIColor lightGrayColor];
					[cell.contentView addSubview:C_IMG];
		
					
				}
			else if([DataArray3 count]==0)
				{
					//c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 80)];
					
					if ([FirstBlood isEqualToString:@"1"])
                    {
						c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
						
					}
					else {
						c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
						
					}

					
					
					NSString *c_ls=[[NSString alloc]init];
					c_ls = [[DataArray objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,5)];
					NSLog(@"%@and this%@",c_ls,[DataArray objectAtIndex:indexPath.row]);
					if ([c_ls isEqualToString:@"<font"]) {
						if ([[DataArray objectAtIndex:indexPath.row] length]>54+23) {
							c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......",[[DataArray objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(16,54)]];
							
						}
						else {
							c_NSST=[[NSString alloc]initWithFormat:@"%@",[DataArray objectAtIndex:indexPath.row]];
							
						}
					}
					else {
						if ([[DataArray objectAtIndex:indexPath.row] length]>54) {
							c_NSST=[[NSString alloc]initWithFormat:@"%@......",[[DataArray objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,54)]];
							
						}
						else {
							c_NSST=[[NSString alloc]initWithFormat:@"%@",[DataArray objectAtIndex:indexPath.row]];
							
						}
						
					}
					
					
					c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
					//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:indexPath.row];
					
					//if ([[DataArray objectAtIndex:indexPath.row] length]+[[DataArray6 objectAtIndex:indexPath.row] length]>14*5) {
//						NSString *nowdate = [[DataArray objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,14*4+5)];
//						c_textview.text=[[NSString alloc]initWithFormat:@"%@......",nowdate];
//						
//						
//					}
//					else {
//						c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[DataArray objectAtIndex:indexPath.row],[DataArray6 objectAtIndex:indexPath.row]];
//						
//					}
					c_textview.text=[[NSString alloc]initWithFormat:@"%@",c_NSST];
					
					//c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[DataArray objectAtIndex:indexPath.row],[DataArray6 objectAtIndex:indexPath.row]];
					[cell.contentView addSubview:c_textview];
					c_textview.backgroundColor=[UIColor clearColor];
					c_textview.userInteractionEnabled=NO;
					c_textview.textAlignment = UITextAlignmentLeft;
					c_textview.font = [UIFont boldSystemFontOfSize:15];
					
					
					
					
					UITextView *c_textview2=[[UITextView alloc]initWithFrame:CGRectMake(0, 10, 240, 120)];
					
					c_textview2.text=[[NSString alloc]initWithFormat:@"\n\n\n\n「%@」",[DataArray6 objectAtIndex:indexPath.row]];
					[cell.contentView addSubview:c_textview2];
					c_textview2.backgroundColor=[UIColor clearColor];
					c_textview2.userInteractionEnabled=NO;
					c_textview2.textAlignment = UITextAlignmentLeft;
					c_textview2.font = [UIFont boldSystemFontOfSize:15];
					[c_textview2 release];
					c_textview2=nil;
					
					
					if ([[DataArray5 objectAtIndex:indexPath.row]intValue]!=0) {
						c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
						//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
						c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[DataArray5 objectAtIndex:indexPath.row]intValue]];
						[cell.contentView addSubview:c_textview1];
						c_textview1.backgroundColor=[UIColor clearColor];
						c_textview1.userInteractionEnabled=NO;
						c_textview1.textAlignment = UITextAlignmentLeft;
						c_textview1.font = [UIFont boldSystemFontOfSize:15];
					
						
					}
					UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
					[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
					//topbar.backgroundColor = [UIColor lightGrayColor];
					[cell.contentView addSubview:C_IMG];
					
					
				}
			else {
					if (indexPath.section==0) 
					{
						
						if ([FirstBlood isEqualToString:@"1"])
						{
							c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
							
						}
						else {
							c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
							
						}
						
						
						
						
						c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
						//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:indexPath.row];
						NSString *c_ls=[[NSString alloc]init];
						c_ls = [[DataArray objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,5)];
						NSLog(@"%@and this%@",c_ls,[DataArray objectAtIndex:indexPath.row]);
						if ([c_ls isEqualToString:@"<font"]) {
							if ([[DataArray objectAtIndex:indexPath.row] length]>54+23) {
								c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......",[[DataArray objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(16,54)]];
								
							}
							else {
								c_NSST=[[NSString alloc]initWithFormat:@"%@",[DataArray objectAtIndex:indexPath.row]];
								
							}
						}
						else {
							if ([[DataArray objectAtIndex:indexPath.row] length]>54) {
								c_NSST=[[NSString alloc]initWithFormat:@"%@......",[[DataArray objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,54)]];
								
							}
							else {
								c_NSST=[[NSString alloc]initWithFormat:@"%@",[DataArray objectAtIndex:indexPath.row]];
								
							}
							
						}
						
						
						c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
						//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:indexPath.row];
						
						//if ([[DataArray objectAtIndex:indexPath.row] length]+[[DataArray6 objectAtIndex:indexPath.row] length]>14*5) {
						//						NSString *nowdate = [[DataArray objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,14*4+5)];
						//						c_textview.text=[[NSString alloc]initWithFormat:@"%@......",nowdate];
						//						
						//						
						//					}
						//					else {
						//						c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[DataArray objectAtIndex:indexPath.row],[DataArray6 objectAtIndex:indexPath.row]];
						//						
						//					}
						c_textview.text=[[NSString alloc]initWithFormat:@"%@",c_NSST];
						//c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[DataArray objectAtIndex:indexPath.row],[DataArray6 objectAtIndex:indexPath.row]];
						[cell.contentView addSubview:c_textview];
						c_textview.backgroundColor=[UIColor clearColor];
						c_textview.userInteractionEnabled=NO;
						c_textview.textAlignment = UITextAlignmentLeft;
						c_textview.font = [UIFont boldSystemFontOfSize:15];
						
						
						UITextView *c_textview2=[[UITextView alloc]initWithFrame:CGRectMake(0, 10, 240, 120)];
						
						c_textview2.text=[[NSString alloc]initWithFormat:@"\n\n\n\n「%@」",[DataArray6 objectAtIndex:indexPath.row]];
						[cell.contentView addSubview:c_textview2];
						c_textview2.backgroundColor=[UIColor clearColor];
						c_textview2.userInteractionEnabled=NO;
						c_textview2.textAlignment = UITextAlignmentLeft;
						c_textview2.font = [UIFont boldSystemFontOfSize:15];
						[c_textview2 release];
						c_textview2=nil;
						
						if ([[DataArray5 objectAtIndex:indexPath.row]intValue]!=0) {
						    c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
							//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
							c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[DataArray5 objectAtIndex:indexPath.row]intValue]];
							[cell.contentView addSubview:c_textview1];
							c_textview1.backgroundColor=[UIColor clearColor];
							c_textview1.userInteractionEnabled=NO;
							c_textview1.textAlignment = UITextAlignmentLeft;
							c_textview1.font = [UIFont boldSystemFontOfSize:15];
							
							
						}
						UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
						[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
						//topbar.backgroundColor = [UIColor lightGrayColor];
						[cell.contentView addSubview:C_IMG];
						
						
					}
					else {
						
						if ([FirstBlood isEqualToString:@"1"])
						{
							c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 320, 120)];
							
						}
						else {
							c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
							
						}

						
						
						
						c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
						//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:indexPath.row];
						NSString *c_ls=[[NSString alloc]init];
						c_ls = [[DataArray3 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,5)];
						NSLog(@"%@and this%@",c_ls,[DataArray3 objectAtIndex:indexPath.row]);
						if ([c_ls isEqualToString:@"<font"]) {
							if ([[DataArray3 objectAtIndex:indexPath.row] length]>54+23) {
								c_NSST=[[NSString alloc]initWithFormat:@"<font color=red>%@</font>......",[[DataArray3 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(16,54)]];
								
							}
							else {
								c_NSST=[[NSString alloc]initWithFormat:@"%@",[DataArray3 objectAtIndex:indexPath.row]];
								
							}
						}
						else {
							if ([[DataArray3 objectAtIndex:indexPath.row] length]>54) {
								c_NSST=[[NSString alloc]initWithFormat:@"%@......",[[DataArray3 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,54)]];
								
							}
							else {
								c_NSST=[[NSString alloc]initWithFormat:@"%@",[DataArray3 objectAtIndex:indexPath.row]];
								
							}
							
						}
						
						
						c_textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 240, 120)];
						//c_textview.text=[[XMLUtilView.tmpdic objectForKey:@"package_name"]objectAtIndex:indexPath.row];
						
						//if ([[DataArray3 objectAtIndex:indexPath.row] length]+[[DataArray8 objectAtIndex:indexPath.row] length]>14*5) {
						//						NSString *nowdate = [[DataArray3 objectAtIndex:indexPath.row] substringWithRange:NSMakeRange(0,14*4+5)];
						//						c_textview.text=[[NSString alloc]initWithFormat:@"%@......",nowdate];
						//						
						//						
						//					}
						//					else {
						//						c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[DataArray3 objectAtIndex:indexPath.row],[DataArray8 objectAtIndex:indexPath.row]];
						//						
						//					}
						//c_NSST
						c_textview.text=[[NSString alloc]initWithFormat:@"%@",c_NSST];
						//c_textview.text=[[NSString alloc]initWithFormat:@"%@「%@」",[DataArray3 objectAtIndex:indexPath.row],[DataArray8 objectAtIndex:indexPath.row]];
						[cell.contentView addSubview:c_textview];
						c_textview.backgroundColor=[UIColor clearColor];
						c_textview.userInteractionEnabled=NO;
						c_textview.textAlignment = UITextAlignmentLeft;
						c_textview.font = [UIFont boldSystemFontOfSize:15];
					
						UITextView *c_textview2=[[UITextView alloc]initWithFrame:CGRectMake(0, 10, 240, 120)];
						
						c_textview2.text=[[NSString alloc]initWithFormat:@"\n\n\n\n「%@」",[DataArray8 objectAtIndex:indexPath.row]];
						[cell.contentView addSubview:c_textview2];
						c_textview2.backgroundColor=[UIColor clearColor];
						c_textview2.userInteractionEnabled=NO;
						c_textview2.textAlignment = UITextAlignmentLeft;
						c_textview2.font = [UIFont boldSystemFontOfSize:15];
						[c_textview2 release];
						c_textview2=nil;
						
						if ([[DataArray7 objectAtIndex:indexPath.row]intValue]!=0) {
							c_textview1=[[UITextView alloc]initWithFrame:CGRectMake(235, 0, 320-245, 120)];
							//c_textview1.text=[[XMLUtilView.tmpdic objectForKey:@"package_startup_price"]objectAtIndex:indexPath.row];
							c_textview1.text=[[NSString alloc]initWithFormat:@"$%d\n      起",[[DataArray7 objectAtIndex:indexPath.row]intValue]];
							[cell.contentView addSubview:c_textview1];
							c_textview1.backgroundColor=[UIColor clearColor];
							c_textview1.userInteractionEnabled=NO;
							c_textview1.textAlignment = UITextAlignmentLeft;
							c_textview1.font = [UIFont boldSystemFontOfSize:15];
							
							
						}
						
						UIImageView *C_IMG = [[UIImageView alloc]initWithFrame:CGRectMake(295, 5, 25*0.6, 38*0.6)];
						[C_IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"1_03"] ofType:@"png"]]];
						//topbar.backgroundColor = [UIColor lightGrayColor];
						[cell.contentView addSubview:C_IMG];
						
						
					}
				}


		
				

		
		
	}
	
	[DeleteMeCellIdentifier release];
	DeleteMeCellIdentifier = nil;
	
	return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)c_tableview editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath 

{
    //NSLog(@"%@",UITableViewCellEditingStyleDelete);
	return UITableViewCellEditingStyleDelete;
	
    //UITableViewCellEditingStyleInsert
    //UITableViewCellEditingStyleDelete
	//不能是UITableViewCellEditingStyleNone
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}



- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	
	UIView *view = nil;		
	if ([DataArray count]==0&&[DataArray3 count]!=0) {
		view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
		//view.backgroundColor = [UIColor blueColor];
		
		UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(-10, 0,340,22)];
		c_image.alpha=0.9;
		[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
		
		
		
		
		UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
		lable.text = @"自悠行";
		lable.font = [UIFont boldSystemFontOfSize:17];
		lable.textColor=[UIColor whiteColor];
		lable.backgroundColor = [UIColor clearColor];
		
		[view addSubview:c_image];
		
		
		UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
		lable1.text = @"自悠行";
		lable1.font = [UIFont boldSystemFontOfSize:17];
		lable1.textColor=[UIColor grayColor];
		lable1.backgroundColor = [UIColor clearColor];
		[view addSubview:lable1];
		[view addSubview:lable];
		
		[c_image release];
		c_image=nil;
		[lable release];
		lable = nil;
		[lable1 release];
	}
	else if([DataArray3 count]==0&&[DataArray count]!=0){
		view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
		//view.backgroundColor = [UIColor blueColor];
		UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(-10, 0,340,22)];
		c_image.alpha=0.9;
		[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
		UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
		lable.text = @"旅行團";
		lable.textColor=[UIColor whiteColor];
		lable.font = [UIFont boldSystemFontOfSize:17];
		lable.backgroundColor = [UIColor clearColor];
		[view addSubview:c_image];
		
		
		UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
		lable1.text = @"旅行團";
		lable1.font = [UIFont boldSystemFontOfSize:17];
		lable1.textColor=[UIColor grayColor];
		lable1.backgroundColor = [UIColor clearColor];
		[view addSubview:lable1];
		
		
		[view addSubview:lable];
		[c_image release];
		c_image=nil;
		[lable release];
		lable = nil;
		[lable1 release];
	}
	else if([DataArray3 count]==0&&[DataArray count]==0){
		view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
		//view.backgroundColor = [UIColor blueColor];
		UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(-10, 0,340,22)];
		c_image.alpha=0.9;
		[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
		UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
		lable.text = @"旅行團";
		lable.textColor=[UIColor whiteColor];
		lable.font = [UIFont boldSystemFontOfSize:17];
		lable.backgroundColor = [UIColor clearColor];
		[view addSubview:c_image];
		
		
		UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
		lable1.text = @"旅行團";
		lable1.font = [UIFont boldSystemFontOfSize:17];
		lable1.textColor=[UIColor grayColor];
		lable1.backgroundColor = [UIColor clearColor];
		[view addSubview:lable1];
		
		
		
		[view addSubview:lable];
		[c_image release];
		c_image=nil;
		[lable release];
		lable = nil;
		[lable1 release];
	}
	else {
		if(section == 0)
		{
			view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
			//view.backgroundColor = [UIColor blueColor];
			UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(-10, 0,340,22)];
			c_image.alpha=0.9;
			[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
			UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
			lable.text = @"旅行團";
			lable.textColor=[UIColor whiteColor];
			lable.font = [UIFont boldSystemFontOfSize:17];
			lable.backgroundColor = [UIColor clearColor];
			[view addSubview:c_image];
			
			
			UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
			lable1.text = @"旅行團";
			lable1.font = [UIFont boldSystemFontOfSize:17];
			lable1.textColor=[UIColor grayColor];
			lable1.backgroundColor = [UIColor clearColor];
			[view addSubview:lable1];
			
			
			
			[view addSubview:lable];
			[c_image release];
			c_image=nil;
			[lable release];
			lable = nil;	
		}
		else if(section == 1)
		{
			view = [[[UIView alloc] initWithFrame:CGRectMake(10, 10, 100, 30)] autorelease];
			//view.backgroundColor = [UIColor blueColor];
			UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(5, 1,100,20)];
			
			UIImageView *c_image=[[UIImageView alloc]initWithFrame:CGRectMake(-10, 0,340,22)];
			c_image.alpha=0.9;
			[c_image setImage:[UIImage imageNamed:@"bar3.png"]];
			lable.text = @"自悠行";
			lable.font = [UIFont boldSystemFontOfSize:17];
			lable.textColor=[UIColor whiteColor];
			lable.backgroundColor = [UIColor clearColor];
			[view addSubview:c_image];
			
			
			UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(5, 3,100,20)];
			lable1.text = @"自悠行";
			lable1.font = [UIFont boldSystemFontOfSize:17];
			lable1.textColor=[UIColor grayColor];
			lable1.backgroundColor = [UIColor clearColor];
			[view addSubview:lable1];
			
			
			[view addSubview:lable];
			[c_image release];
			c_image=nil;
			[lable release];
			lable = nil;
		}
	}


	
	
	
	
	
	return view;
	
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;              // Default is 1 if not implemented
{
    if ([DataArray count]==0&&[DataArray3 count]==0) {
        
        m_pLabel1.hidden =NO;
        m_pLabel2.hidden = NO;
    }
    
	if ([DataArray count]==0&&[DataArray3 count]!=0) {
		
		return 1;
	}
	else if([DataArray3 count]==0&&[DataArray count]!=0){
		return 1;
	}
	else if([DataArray count]==0&&[DataArray3 count]==0){
		return 0;
	}
    else {
		return 2;
	}

	
}


- (void)tableView:(UITableView *)c_tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
forRowAtIndexPath:(NSIndexPath *)indexPath
{
	//NSInteger row = indexPath.row;
	
	
	if ([DataArray count]==0) {
		NSLog(@"22");
		c_delete=[[NSString alloc]initWithFormat:@"1"];
		indexrow=indexPath.row;
		
		
		NSMutableArray *array1 = [[NSMutableArray alloc] init];
		[array1 addObjectsFromArray:DataArray3];
		[array1 removeObjectAtIndex:indexrow];
		self.DataArray3 = array1;
		NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path=[paths    objectAtIndex:0];
		NSString *filename=[path stringByAppendingPathComponent:@"c_name1.plist"];    
		
		[DataArray3 writeToFile:filename  atomically:YES];
		
		
		
		
		
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[array addObjectsFromArray:DataArray4];
		[array removeObjectAtIndex:indexrow];
		self.DataArray4 = array;
		NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path1=[paths1    objectAtIndex:0];
		NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml1.plist"];    
		
		[DataArray4 writeToFile:filename1  atomically:YES];
		
		
		NSMutableArray *array2 = [[NSMutableArray alloc] init];
		[array2 addObjectsFromArray:DataArray7];
		[array2 removeObjectAtIndex:indexrow];
		self.DataArray7 = array2;
		NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path2=[paths2    objectAtIndex:0];
		NSString *filename2=[path2 stringByAppendingPathComponent:@"c_price1.plist"];    
		
		[DataArray7 writeToFile:filename2  atomically:YES];
		
		
		NSMutableArray *array3 = [[NSMutableArray alloc] init];
		[array3 addObjectsFromArray:DataArray8];
		[array3 removeObjectAtIndex:indexrow];
		self.DataArray8 = array3;
		NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path3=[paths3    objectAtIndex:0];
		NSString *filename3=[path3 stringByAppendingPathComponent:@"c_pack1.plist"];    
		
		[DataArray8 writeToFile:filename3  atomically:YES];
		
		if ([DataArray count]==0&&[DataArray3 count]==0) {
			c_tableview.separatorColor=[UIColor clearColor];
		}
		else {
			c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			
		}
		[c_tableview reloadData];
		c_mylabe.text=@"刪除";
		
	}
	else if([DataArray3 count]==0)
	{
		c_delete=[[NSString alloc]initWithFormat:@"2"];
		indexrow=indexPath.row;
		
		NSMutableArray *array1 = [[NSMutableArray alloc] init];
		[array1 addObjectsFromArray:DataArray];
		[array1 removeObjectAtIndex:indexrow];
		self.DataArray = array1;
		NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path=[paths    objectAtIndex:0];
		NSString *filename=[path stringByAppendingPathComponent:@"c_name.plist"];    
		
		[DataArray writeToFile:filename  atomically:YES];
		
		
		
		
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[array addObjectsFromArray:DataArray2];
		[array removeObjectAtIndex:indexrow];
		self.DataArray2 = array;
		NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path1=[paths1    objectAtIndex:0];
		NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml.plist"];    
		
		[DataArray2 writeToFile:filename1  atomically:YES];
		
		
		
		NSMutableArray *array2 = [[NSMutableArray alloc] init];
		[array2 addObjectsFromArray:DataArray5];
		[array2 removeObjectAtIndex:indexrow];
		self.DataArray5 = array2;
		NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path2=[paths2    objectAtIndex:0];
		NSString *filename2=[path2 stringByAppendingPathComponent:@"c_price.plist"];    
		
		[DataArray5 writeToFile:filename2  atomically:YES];
		
		
		NSMutableArray *array3 = [[NSMutableArray alloc] init];
		[array3 addObjectsFromArray:DataArray6];
		[array3 removeObjectAtIndex:indexrow];
		self.DataArray6 = array3;
		NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path3=[paths3    objectAtIndex:0];
		NSString *filename3=[path3 stringByAppendingPathComponent:@"c_pack.plist"];    
		
		[DataArray6 writeToFile:filename3  atomically:YES];
		
		if ([DataArray count]==0&&[DataArray3 count]==0) {
			c_tableview.separatorColor=[UIColor clearColor];
		}
		else {
			c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
			
		}
		
		
		[c_tableview reloadData];
		c_mylabe.text=@"刪除";
	}
	else {
		
		if(indexPath.section == 0)
		{
			NSLog(@"11");  
			
			c_delete=[[NSString alloc]initWithFormat:@"3"];
			
			indexrow=indexPath.row;
			
			NSMutableArray *array1 = [[NSMutableArray alloc] init];
			[array1 addObjectsFromArray:DataArray];
			[array1 removeObjectAtIndex:indexrow];
			self.DataArray = array1;
			NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			NSString *path=[paths    objectAtIndex:0];
			NSString *filename=[path stringByAppendingPathComponent:@"c_name.plist"];    
			
			[DataArray writeToFile:filename  atomically:YES];
			
			
			
			
			NSMutableArray *array = [[NSMutableArray alloc] init];
			[array addObjectsFromArray:DataArray2];
			[array removeObjectAtIndex:indexrow];
			self.DataArray2 = array;
			NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			NSString *path1=[paths1    objectAtIndex:0];
			NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml.plist"];    
			
			[DataArray2 writeToFile:filename1  atomically:YES];
			
			
			
			NSMutableArray *array2 = [[NSMutableArray alloc] init];
			[array2 addObjectsFromArray:DataArray5];
			[array2 removeObjectAtIndex:indexrow];
			self.DataArray5 = array2;
			NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			NSString *path2=[paths2    objectAtIndex:0];
			NSString *filename2=[path2 stringByAppendingPathComponent:@"c_price.plist"];    
			
			[DataArray5 writeToFile:filename2  atomically:YES];
			
			
			NSMutableArray *array3 = [[NSMutableArray alloc] init];
			[array3 addObjectsFromArray:DataArray6];
			[array3 removeObjectAtIndex:indexrow];
			self.DataArray6 = array3;
			NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			NSString *path3=[paths3    objectAtIndex:0];
			NSString *filename3=[path3 stringByAppendingPathComponent:@"c_pack.plist"];    
			
			[DataArray6 writeToFile:filename3  atomically:YES];
			if ([DataArray count]==0&&[DataArray3 count]==0) {
				c_tableview.separatorColor=[UIColor clearColor];
			}
			else {
				c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
				
			}
			
			
			[c_tableview reloadData];
			c_mylabe.text=@"刪除";
			
		}
		if(indexPath.section == 1)
		{
			NSLog(@"22");
			c_delete=[[NSString alloc]initWithFormat:@"4"];
			indexrow=indexPath.row;
			
			NSMutableArray *array1 = [[NSMutableArray alloc] init];
			[array1 addObjectsFromArray:DataArray3];
			[array1 removeObjectAtIndex:indexrow];
			self.DataArray3 = array1;
			NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			NSString *path=[paths    objectAtIndex:0];
			NSString *filename=[path stringByAppendingPathComponent:@"c_name1.plist"];    
			
			[DataArray3 writeToFile:filename  atomically:YES];
			
			
			
			
			
			NSMutableArray *array = [[NSMutableArray alloc] init];
			[array addObjectsFromArray:DataArray4];
			[array removeObjectAtIndex:indexrow];
			self.DataArray4 = array;
			NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			NSString *path1=[paths1    objectAtIndex:0];
			NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml1.plist"];    
			
			[DataArray4 writeToFile:filename1  atomically:YES];
			
			
			
			NSMutableArray *array2 = [[NSMutableArray alloc] init];
			[array2 addObjectsFromArray:DataArray7];
			[array2 removeObjectAtIndex:indexrow];
			self.DataArray7 = array2;
			NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			NSString *path2=[paths2    objectAtIndex:0];
			NSString *filename2=[path2 stringByAppendingPathComponent:@"c_price1.plist"];    
			
			[DataArray7 writeToFile:filename2  atomically:YES];
			
			
			NSMutableArray *array3 = [[NSMutableArray alloc] init];
			[array3 addObjectsFromArray:DataArray8];
			[array3 removeObjectAtIndex:indexrow];
			self.DataArray8 = array3;
			NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
			NSString *path3=[paths3    objectAtIndex:0];
			NSString *filename3=[path3 stringByAppendingPathComponent:@"c_pack1.plist"];    
			
			[DataArray8 writeToFile:filename3  atomically:YES];
			
			if ([DataArray count]==0&&[DataArray3 count]==0) {
				c_tableview.separatorColor=[UIColor clearColor];
			}
			else {
				c_tableview.separatorColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
				
			}
			
			
			[c_tableview reloadData];
			c_mylabe.text=@"刪除";
		}
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





-(void)AnimetionUpdate
{
	//m_pImgView=nil;
	
	XX++;
	
	
	if (XX==17) {
		[c_tableview reloadData];
		//FirstBlood=[[NSString alloc]initWithString:@"1"];
	}
	
	
	
	//m_pImgView.backgroundColor = [UIColor colorWithRed:XX green:0.0 blue:0.0 alpha:1.0];
}


-(void)DestroyTimer
{
	if(m_pTimer)
	{
		if([m_pTimer isValid])
		{
			[m_pTimer invalidate];
		}
		XX=0;
		m_pTimer = nil;
	}
}

-(void)StartTimer
{
	[self DestroyTimer];
	
	m_pTimer = [NSTimer scheduledTimerWithTimeInterval:0.016 target:self selector:@selector(AnimetionUpdate) userInfo:nil repeats:YES];
}




-(void)ReUpdateImage
{
	
	
	editButton = [[UIBarButtonItem alloc]initWithTitle:@"刪除" style:UIBarButtonItemStyleBordered
																 target:self 
																 action:@selector(toggleEdit:)];
	
	
	
	c_BTN.hidden=NO;
	
	self.editing = NO;
	//self.navigationItem.leftBarButtonItem = editButton;
}


-(void)deleteBookMark:(id)sender
{
	
	if ([c_delete isEqualToString:@"1"])
	{
		NSMutableArray *array1 = [[NSMutableArray alloc] init];
		[array1 addObjectsFromArray:DataArray3];
		[array1 removeObjectAtIndex:indexrow];
		self.DataArray3 = array1;
		NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path=[paths    objectAtIndex:0];
		NSString *filename=[path stringByAppendingPathComponent:@"c_name1.plist"];    
		
		[DataArray3 writeToFile:filename  atomically:YES];
		
		
		
		
		
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[array addObjectsFromArray:DataArray4];
		[array removeObjectAtIndex:indexrow];
		self.DataArray4 = array;
		NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path1=[paths1    objectAtIndex:0];
		NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml1.plist"];    
		
		[DataArray4 writeToFile:filename1  atomically:YES];
		
		
		NSMutableArray *array2 = [[NSMutableArray alloc] init];
		[array2 addObjectsFromArray:DataArray7];
		[array2 removeObjectAtIndex:indexrow];
		self.DataArray7 = array2;
		NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path2=[paths2    objectAtIndex:0];
		NSString *filename2=[path2 stringByAppendingPathComponent:@"c_price1.plist"];    
		
		[DataArray7 writeToFile:filename2  atomically:YES];
		
		
		NSMutableArray *array3 = [[NSMutableArray alloc] init];
		[array3 addObjectsFromArray:DataArray8];
		[array3 removeObjectAtIndex:indexrow];
		self.DataArray8 = array3;
		NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path3=[paths3    objectAtIndex:0];
		NSString *filename3=[path3 stringByAppendingPathComponent:@"c_pack1.plist"];    
		
		[DataArray8 writeToFile:filename3  atomically:YES];
	}
	else if([c_delete isEqualToString:@"2"])
	{
	
		NSMutableArray *array1 = [[NSMutableArray alloc] init];
		[array1 addObjectsFromArray:DataArray];
		[array1 removeObjectAtIndex:indexrow];
		self.DataArray = array1;
		NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path=[paths    objectAtIndex:0];
		NSString *filename=[path stringByAppendingPathComponent:@"c_name.plist"];    
		
		[DataArray writeToFile:filename  atomically:YES];
		
		
		
		
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[array addObjectsFromArray:DataArray2];
		[array removeObjectAtIndex:indexrow];
		self.DataArray2 = array;
		NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path1=[paths1    objectAtIndex:0];
		NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml.plist"];    
		
		[DataArray2 writeToFile:filename1  atomically:YES];
		
		
		
		NSMutableArray *array2 = [[NSMutableArray alloc] init];
		[array2 addObjectsFromArray:DataArray5];
		[array2 removeObjectAtIndex:indexrow];
		self.DataArray5 = array2;
		NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path2=[paths2    objectAtIndex:0];
		NSString *filename2=[path2 stringByAppendingPathComponent:@"c_price.plist"];    
		
		[DataArray5 writeToFile:filename2  atomically:YES];
		
		
		NSMutableArray *array3 = [[NSMutableArray alloc] init];
		[array3 addObjectsFromArray:DataArray6];
		[array3 removeObjectAtIndex:indexrow];
		self.DataArray6 = array3;
		NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path3=[paths3    objectAtIndex:0];
		NSString *filename3=[path3 stringByAppendingPathComponent:@"c_pack.plist"];    
		
		[DataArray6 writeToFile:filename3  atomically:YES];
	}
	else if([c_delete isEqualToString:@"3"])
	{
	
		NSMutableArray *array1 = [[NSMutableArray alloc] init];
		[array1 addObjectsFromArray:DataArray];
		[array1 removeObjectAtIndex:indexrow];
		self.DataArray = array1;
		NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path=[paths    objectAtIndex:0];
		NSString *filename=[path stringByAppendingPathComponent:@"c_name.plist"];    
		
		[DataArray writeToFile:filename  atomically:YES];
		
		
		
		
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[array addObjectsFromArray:DataArray2];
		[array removeObjectAtIndex:indexrow];
		self.DataArray2 = array;
		NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path1=[paths1    objectAtIndex:0];
		NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml.plist"];    
		
		[DataArray2 writeToFile:filename1  atomically:YES];
		
		
		
		NSMutableArray *array2 = [[NSMutableArray alloc] init];
		[array2 addObjectsFromArray:DataArray5];
		[array2 removeObjectAtIndex:indexrow];
		self.DataArray5 = array2;
		NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path2=[paths2    objectAtIndex:0];
		NSString *filename2=[path2 stringByAppendingPathComponent:@"c_price.plist"];    
		
		[DataArray5 writeToFile:filename2  atomically:YES];
		
		
		NSMutableArray *array3 = [[NSMutableArray alloc] init];
		[array3 addObjectsFromArray:DataArray6];
		[array3 removeObjectAtIndex:indexrow];
		self.DataArray6 = array3;
		NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path3=[paths3    objectAtIndex:0];
		NSString *filename3=[path3 stringByAppendingPathComponent:@"c_pack.plist"];    
		
		[DataArray6 writeToFile:filename3  atomically:YES];
	}
	else if([c_delete isEqualToString:@"4"])
	{
	 
		NSMutableArray *array1 = [[NSMutableArray alloc] init];
		[array1 addObjectsFromArray:DataArray3];
		[array1 removeObjectAtIndex:indexrow];
		self.DataArray3 = array1;
		NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path=[paths    objectAtIndex:0];
		NSString *filename=[path stringByAppendingPathComponent:@"c_name1.plist"];    
		
		[DataArray3 writeToFile:filename  atomically:YES];
		
		
		
		
		
		NSMutableArray *array = [[NSMutableArray alloc] init];
		[array addObjectsFromArray:DataArray4];
		[array removeObjectAtIndex:indexrow];
		self.DataArray4 = array;
		NSArray *paths1=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path1=[paths1    objectAtIndex:0];
		NSString *filename1=[path1 stringByAppendingPathComponent:@"c_xml1.plist"];    
		
		[DataArray4 writeToFile:filename1  atomically:YES];
		
		
		
		NSMutableArray *array2 = [[NSMutableArray alloc] init];
		[array2 addObjectsFromArray:DataArray7];
		[array2 removeObjectAtIndex:indexrow];
		self.DataArray7 = array2;
		NSArray *paths2=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path2=[paths2    objectAtIndex:0];
		NSString *filename2=[path2 stringByAppendingPathComponent:@"c_price1.plist"];    
		
		[DataArray7 writeToFile:filename2  atomically:YES];
		
		
		NSMutableArray *array3 = [[NSMutableArray alloc] init];
		[array3 addObjectsFromArray:DataArray8];
		[array3 removeObjectAtIndex:indexrow];
		self.DataArray8 = array3;
		NSArray *paths3=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
		NSString *path3=[paths3    objectAtIndex:0];
		NSString *filename3=[path3 stringByAppendingPathComponent:@"c_pack1.plist"];    
		
		[DataArray8 writeToFile:filename3  atomically:YES];
	}
}



- (void)dealloc 
{
	
	[[NSNotificationCenter defaultCenter] removeObserver:self];
	[m_pTimer release];
	[c_textview release];
	[c_textview1 release];
	[c_tableview release];
	[DataArray release];
	[DataArray2 release];
	[DataArray3 release];
	[DataArray4 release];
	[DataArray5 release];
	[DataArray6 release];
	[DataArray7 release];
	[DataArray8 release];
	[topbar release];
	[c_I release];
    [m_pLabel1 release];
    [m_pLabel2 release];
    [super dealloc];
}








@end
