//
//  Product.h
//  New_Projects
//
//  Created by chen cool on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLUtil.h"
#import "ASINetworkQueue.h"

@interface Product : UIViewController <UITableViewDelegate, UITableViewDataSource>{

	XMLUtil *XMLUtilView,*XMLUtilView1;
	UITableView *c_tableview;
	UIButton *btnfoot,*c_switch1,*c_switch2,*c_switch3;
	NSString *c_type;
	
	UINavigationController *navigationController;
	NSMutableArray *c_narray,*c_narray1,*c_narray2;
	UIImage *Img,*Img1,*Img2,*Img3;
	UIButton *gameimage,*gameimage1,*gameimage2,*gameimage3;
	UIImageView *topbar,*c_I,*c_hidden;
	UIButton *BTN;
	NSMutableArray *c_narrayname1,*c_narrayname2,*c_narrayprice1,*c_narrayprice2,*c_narraypack1,*c_narraypack2,
	*c_narraypdf1,*c_narraypdf2;
	NSMutableArray *c_down;
	
	NSMutableArray *DataArray,*DataArray2,*DataArray3,*DataArray4,*DataArray5,*DataArray6;
	UIActivityIndicatorView *c_loading,*c_loading2;

	ASINetworkQueue *m_pNetWorkQueue;
	NSString *MainMenuImgPath,*MainMenuPdfPath;
	NSString *DownLpath;
	UIImageView *black,*c_black;
	NSString *c_yesorno;
	NSString *c_NSST;
	NSArray *titles,*titles21,*titles2,*titles3,*titles4,*titles22,*titles23,*titles24;
	
}
@property(retain,nonatomic)UITableView *c_tableview;
-(void)banner1:(id)sender;
-(void)banner2:(id)sender;
-(void)banner3:(id)sender;
-(void)banner4:(id)sender;
-(void)next:(id)sender;
-(void)c_switch1:(id)sender;
-(void)c_switch2:(id)sender;
-(void)c_switch3:(id)sender;
-(void)dxc:(NSString *)downloadfile;
-(void)dosomething1;
-(void)dosomething2;
-(void)initbtnimg;
-(void)initbtn1;
-(void)c_loadingAnimation:(id)arg;
-(void)c_loadingStop;
-(void)c_startLoad;
-(void)c_loadingAnimation2:(id)arg;
-(void)c_loadingStop2;
-(void)c_startLoad2;
-(void)jxanddl;
-(void)ddjx;
-(void)loaddate;
-(void)savedate;
@end
