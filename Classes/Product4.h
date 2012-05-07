//
//  Product4.h
//  New_Projects
//
//  Created by chen cool on 11-10-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLUtil.h"

@interface Product4 : UIViewController <UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>{

	XMLUtil *XMLUtilView;
	UIButton *btnfoot;
	UILabel *tittle;
	NSString *c_xml,*c_name;
	UITableView *c_tableview;
	NSMutableArray *c_pdf1,*c_pdf2,*c_name1,*c_name2,*c_price1,*c_price2,*c_code1,*c_code2;
	NSString *c_type;
	UIImageView *c_hidden;
	NSString *c_NSST;
	UIImageView *topbar,*c_I;
	UIButton *BTN;
	NSMutableArray *c_narraypdf;
    NSMutableArray *c_narraycode;
    NSMutableArray *c_namenarray;
    NSMutableArray *c_mumnarray;
}
@property(retain,nonatomic)NSString *c_type;
@property(retain,nonatomic)NSString *c_xml,*c_name;
-(void)aa:(id)sender;
-(void)next:(id)sender;
-(void)dosomething1;
-(void)dosomething2;
@end
