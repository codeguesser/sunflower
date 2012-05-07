//
//  FavoriteBook.h
//  New_Projects
//
//  Created by chen cool on 11-9-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "New_ProjectsAppDelegate.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "facebook.h"
#import <QuartzCore/QuartzCore.h>

#import "New_ProjectsAppDelegate.h"
#import "MainView.h"

@interface FavoriteBook : UIViewController <UIWebViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,
MFMailComposeViewControllerDelegate>{

	UIButton *btnfoot;
	NSString *c_xml,*c_pack,*c_name;
	UIButton *btnback;
	MFMailComposeViewController *pickers;
	facebook *c_facebook;
	New_ProjectsAppDelegate	*m_pAppDelegate;
	NSString *c_telt;
	NSArray* telAray;
	NSString *str;
	NSString *tmpstr;
	UIView *twoboyview;
	NSTimer *m_pTimer;
    
    FavoriteBook *_FavoriteBook;
}
@property(retain,nonatomic)NSString *c_xml,*c_pack,*c_name;
-(void)back:(id)sender;
-(void)displayComposerSheet; 
-(UIImage*)emailphoto;
-(void)showPicker;
-(void)dosomething1;
-(void)dosomething2;

-(void)AnimetionUpdate;
-(void)DestroyTimer;
-(void)StartTimer;

-(void)AnimetionUpdate2;
-(void)DestroyTimer2;
-(void)StartTimer2;
@end
