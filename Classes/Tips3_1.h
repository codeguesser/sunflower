//
//  Tips3_1.h
//  New_Projects
//
//  Created by chen cool on 11-11-3.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLUtil1.h"

@interface Tips3_1 : UIViewController <UIWebViewDelegate>{

	XMLUtil1 *XMLUtilView;
	UIButton *btnfoot,*c_switch1,*c_switch2,*c_switch3;
	UITableView *c_tableview;
	NSArray * titles;
	UIButton *NextBtn;
	NSArray * indexIconNames;
	UILabel *tittle,*tittle1;
	UIWebView *m_pWebView;
	NSURL *temp_URL;
	int c_mun,c_mun3;
	int c_MM,c_MM2;
	UIScrollView *c_scrollview;
	
	NSURLRequest *temp_URLRequest;
	NSString *bundle;
	UIImageView *topbar,*c_I,*c_barimage;
	UIButton *BTN;
	NSMutableArray *c_narray,*c_narrayxml;
	NSString *c_tittle;
	UITextView *black;
	NSString *c_xml;
	UIView *twoboyview;
    
    int type;
    NSString *m_pSaveURL;
	//NSString *bundle;
}
@property (retain,nonatomic)NSString *c_xml;
@property (retain,nonatomic)NSString *c_tittle;
-(void)next:(id)sender;
-(void)back:(id)sender;
-(void)drawfootbtn:(id)sender;
-(UIViewController *) createWebViewController: (NSString *) urlString;
-(void)dosomething1;
-(void)dosomething2;
@end
