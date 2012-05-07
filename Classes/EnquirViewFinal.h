//
//  EnquirViewFinal.h
//  New_Projects
//
//  Created by chen cool on 11-11-21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "XMLUtil.h"
@interface EnquirViewFinal : UIViewController <UIWebViewDelegate>{

	XMLUtil *XMLUtilView;
	UIButton *btnfoot;
	UIButton *back;
	UIScrollView *scrollview;
	NSString *backkind;
	UITableView *c_tableview;
	NSArray * titles,*titles2;
	UILabel *tittle,*tittle3;
	NSString *bundle;
	UILabel *verison;
	int c_number;
	
	
	NSString *c_link,*c_name;
}
@property(retain,nonatomic)NSString *c_link,*c_name;

-(void)back:(UIButton *)sender;

@end
