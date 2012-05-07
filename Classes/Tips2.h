//
//  Tips2.h
//  New_Projects
//
//  Created by chen cool on 11-10-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLUtil1.h"

@interface Tips2 : UIViewController <UITableViewDelegate,UITableViewDataSource>{


	XMLUtil1 *XMLUtilView;
	UIButton *btnfoot;
	UITableView *c_tableview;
	NSArray * titles;
	UIButton *NextBtn;
	NSArray * indexIconNames;
	UILabel *tittle,*tittle1;
	UIWebView *m_pWebView;
	NSURL *temp_URL;
	NSURLRequest *temp_URLRequest;
	NSString *bundle;
	UIImageView *topbar,*c_I;
	UIButton *BTN;
    
    
    NSString *m_pSaveURL;
}

-(void)next:(id)sender;
-(void)back:(id)sender;

-(void)dosomething1;
-(void)dosomething2;

@end
