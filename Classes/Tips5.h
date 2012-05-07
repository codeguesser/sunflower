//
//  Tips5.h
//  New_Projects
//
//  Created by chen cool on 11-10-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLUtil1.h"
#import "mapController.h"

@interface Tips5 : UIViewController <UITableViewDelegate, UITableViewDataSource,CLLocationManagerDelegate>{

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
	NSMutableArray *c_narray,*c_narraymun;
	int c_mun,c_mun3;

	mapController *mapControllerView;
	NSString* longitude;
	NSString* latitude;
	NSString* titlestr;
	BOOL bNearMeOver;
	CLLocationManager *locationManager;
	mapController *mapNearMeView;
	
	NSString *c_jd,*c_wd,*c_mz;
    
    int type;
	
}

- (void)settype:(int)_type;
@property (nonatomic, retain) NSArray * titles;
-(void)next:(id)sender;
-(void)back:(id)sender;
//-(void)back1:(id)sender;
//-(UIViewController *) createWebViewController: (NSString *) urlString;
-(void)dosomething1;
-(void)dosomething2;

@end
