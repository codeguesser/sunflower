//
//  EnquiryViewMy.h
//  New_Projects
//
//  Created by chen cool on 11-9-26.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface EnquiryViewMy : UIViewController <UITableViewDelegate, UITableViewDataSource,UIWebViewDelegate,UIScrollViewDelegate>{

	UIButton *btnfoot;
	UIButton *back;
	UIScrollView *scrollview;
	NSString *backkind;
	UITableView *c_tableview;
	NSArray * titles;
	UILabel *tittle,*tittle3;
	NSString *bundle;
	UILabel *verison;
	int c_number;
	//int c_tabbtn;
	NSString *c_tabbtn;
	UIButton *c_Secret1,*c_Secret2,*c_Secret3;
    UIButton *_button;
    
    NSString *m_pSaveURL;
    int type;
}
@property (retain,nonatomic)NSString *backkind;
@property (retain,nonatomic)NSString *c_tabbtn;
-(IBAction)back:(UIButton *)sender;
-(IBAction)back2:(UIButton *)sender;
-(UIViewController *) createWebViewController: (NSString *) urlString;
-(void)se1:(id)sender;
-(void)se2:(id)sender;
-(void)se3:(id)sender;
-(void)dosomething1;
-(void)dosomething2;
@end
