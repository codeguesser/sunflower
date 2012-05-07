//
//  Product3.h
//  New_Projects
//
//  Created by chen cool on 11-9-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLUtil.h"

@interface Product3 : UIViewController <UITableViewDelegate,UITableViewDataSource>{

	XMLUtil *XMLUtilView;
	UIButton *btnfoot;
	UILabel *tittle;
	NSString *c_xml,*c_name;
	UITableView *c_tableview;
	NSMutableArray *c_narray;
	NSString *c_type;
	
	UIImageView *topbar,*c_I;
	UIButton *BTN;
	UIImageView *c_hidden;
	NSString *c_NSST;
}
@property(retain,nonatomic)NSString *c_type;
@property(retain,nonatomic)NSString *c_xml,*c_name;
-(void)aa:(id)sender;
-(void)next:(id)sender;
-(void)dosomething1;
-(void)dosomething2;
@end
