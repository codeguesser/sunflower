//
//  News.h
//  New_Projects
//
//  Created by chen cool on 11-10-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface News : UIViewController <UIWebViewDelegate>{

	NSString *c_xml,*c_ol,*c_offline;
	UIButton *btnfoot;
	UIImageView *topbar,*c_I;
	UIButton *BTN;
	
}
@property(retain,nonatomic)NSString *c_xml,*c_ol,*c_offline;

-(void)back:(id)sender;
-(void)next:(id)sender;
-(void)dosomething1;
-(void)dosomething2;
@end
