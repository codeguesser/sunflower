//
//  aboutus.h
//  New_Projects
//
//  Created by chen cool on 11-10-13.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface aboutus : UIViewController {

	UIButton *btnfoot;
	UIButton *back;
	UIScrollView *scrollview;
	UITableView *c_tableview;
	NSArray * titles;
	UILabel *tittle;
	UILabel *verison;
	int c_number;
}
-(void)back:(id)sender;
-(void)se1:(id)sender;
-(void)se2:(id)sender;
-(void)se3:(id)sender;
@end
