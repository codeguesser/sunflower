//
//  MainView.h
//  New_Projects
//
//  Created by Ghost on 08/05/2009.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "stateConfig.h"



@class EAGLView;

@interface MainView : UIViewController {
	UIActivityIndicatorView *loading;
	UIActivityIndicatorView *loading2,*loading3;
	UIImageView *black,*c_black,*black3,*c_black3;
	UIView *black2;
	UILabel *lab,*lab2,*lab3;
	IBOutlet EAGLView *glView;
	UINavigationController *nav;
	int app_state;
	int app_old_state;
	UIImageView *loadtab,*loadtab3;
	int XX;
	int c_item;
    int c_itemOld;
    
	NSTimer *m_pTimer;
	NSTimer	*m_pXXTimer;
	UIButton *btnfoot;
	UIView *c_view;
	UIButton *Tab2hiddenBtn;
	
	
	UILabel *c_maintittle1,*c_maintittle;
	
	
	UIImageView *topbar,*c_I,*c_hidden;
	UIButton *BTN;
	
	
}
@property (nonatomic,retain)UIButton *Tab2hiddenBtn;
@property (nonatomic,retain)UILabel *c_maintittle1,*c_maintittle;
@property (nonatomic, retain)IBOutlet EAGLView *glView;
@property int app_state;
@property int app_old_state;
-(void)ResignActive;
-(void)BecomeActive;
-(void)accelerometerWithX:(float)x Y:(float)y Z:(float)z;

-(void)loadingAnimation:(id)arg;
-(void)loadingStop;
-(void)startLoad;


-(void)loadingAnimation2:(id)arg;
-(void)loadingStop2;
-(void)startLoad2;


-(void)loadingAnimation3:(id)arg;
-(void)loadingStop3;
-(void)startLoad3;

-(void)AnimetionUpdate;
-(void)DestroyTimer;
-(void)StartTimer;

-(void)mainviewinitstate:(int)state;
-(void)mainviewdelete;


-(void)initPosterCard;
-(void)deletePosterCard;

-(void)initProduct;
-(void)deleteProduct;

-(void)initTips;
-(void)deleteTips;

-(void)initEnquiryView;
-(void)deleteEnquiryView;

-(void)initFavorite;
-(void)deleteFavorite;


@end
