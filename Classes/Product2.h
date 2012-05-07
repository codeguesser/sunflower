//
//  Product2.h
//  New_Projects
//
//  Created by chen cool on 11-9-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLUtil.h"

@interface Product2 : UIViewController <UITableViewDelegate, UITableViewDataSource>{

	XMLUtil *XMLUtilView;
	UIButton *btnfoot;
	NSString *c_xml,*c_name;
	UITableView *c_tableview;
	NSMutableArray *c_narray,*c_namenarray,*c_mumnarray;
	NSString *c_type;
	//int c_mum;
	UIImageView *topbar,*c_I;
	UIButton *BTN;
	UIImageView *c_hidden;
}
@property(retain,nonatomic)NSString *c_xml,*c_name;
@property(retain,nonatomic)NSString *c_type;
-(void)aa:(id)sender;
-(void)next:(id)sender;
-(void)dosomething1;
-(void)dosomething2;
@end
