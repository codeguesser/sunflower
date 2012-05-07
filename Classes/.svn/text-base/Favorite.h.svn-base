//
//  Favorite.h
//  New_Projects
//
//  Created by chen cool on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XMLUtil.h"

@interface Favorite : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UIButton *btnfoot;
	XMLUtil *XMLUtilView;
	UITableView *c_tableview;
	UIBarButtonItem * editButton, * doneButton;
	NSMutableArray *DataArray,*DataArray2,*DataArray3,*DataArray4,*DataArray5,*DataArray6,*DataArray7,*DataArray8;
	UIImageView *backgroundView;
	UIImageView *topbar,*c_I;
	UIButton *BTN;
	UITextView *c_textview,*c_textview1;
	NSString *FirstBlood;
	int XX;
	int indexrow;
	NSTimer *m_pTimer;
	NSTimer	*m_pXXTimer;
	UILabel *c_mylabe;
	UIButton *c_BTN;
	NSString *c_delete;
	NSString *c_NSST;
    
    IBOutlet UILabel *m_pLabel1;
    IBOutlet UILabel *m_pLabel2;
	
}
@property(nonatomic, retain)UITableView *c_tableview;
@property(nonatomic, retain)NSMutableArray *DataArray,*DataArray2,*DataArray3,*DataArray4,*DataArray5,*DataArray6,*DataArray7,*DataArray8;
//-(IBAction) editButtonPressed: (id) sender;
-(IBAction) no:(id)sender;
-(void)deleteBookMark:(id)sender;

//-(void)setBackgroundImage:(UIImage*)image; 
//- (void)insertSubview:(UIView *)view atIndex:(NSInteger)index; 
//- (void)viewWillAppear:(BOOL)animated;  
-(void)AnimetionUpdate;
-(void)DestroyTimer;
-(void)StartTimer;

-(void)ReUpdateImage;

-(void)dosomething1;
-(void)dosomething2;

@end
