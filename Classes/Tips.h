//
//  Tips.h
//  New_Projects
//
//  Created by chen cool on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "XMLUtil1.h"

@interface Tips : UIViewController <UITableViewDelegate, UITableViewDataSource,UIWebViewDelegate>{
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
	UIImageView *topbar,*c_I,*topbar1;
	UIButton *BTN;
	//XMLUtil1 *XMLUtilView;
    
    NSString *m_pSaveURL;
    
    
    BOOL bFirstLoadWebView;
}

@property (nonatomic, retain) NSArray * titles;
@property (nonatomic,retain) UILabel *tittle,*tittle1;
-(void)next:(id)sender;
-(void)back:(id)sender;
-(void)back1:(id)sender;
-(void)c_btn:(id)sender;
-(UIViewController *) createWebViewController: (NSString *) urlString;

-(void)dosomething1;
-(void)dosomething2;

@end
