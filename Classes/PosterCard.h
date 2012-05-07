//
//  PosterCard.h
//  New_Projects
//
//  Created by chen cool on 11-8-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "PosterCardSelect.h"



#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "XMLUtil.h"
#import "ASINetworkQueue.h"


///Users/chencool/Desktop/sunflower  new/sunflower20111015/Classes/PosterCard.mm:785:0 /Users/chencool/Desktop/sunflower  new/sunflower20111015/Classes/PosterCard.mm:785: warning: class 'PosterCard' does not implement the 'MFMailComposeViewControllerDelegate' protocol




@interface PosterCard : UIViewController <UIScrollViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,
MFMailComposeViewControllerDelegate
,UINavigationControllerDelegate>{
    //PosterCardSelect *PosterCardSelectView;
	UIScrollView *scrollview;
	UIButton *btnfoot;
	
	UIButton *btn1,*btn2;
	UIView *c_view;
	UIImageView *c_PosterCard,*c_PosterCard1,*cut_Photo;
	UIImageView * photoImageView;
	int n_ReImgX;
	int n_ReImgY;
	
	float n_ReImgXX;
	float n_ReImgYY;
	UIImage *m_pReImgData;
	UIScrollView *scr;
	UIButton *HomeBtn;
	UIButton *BackBtn,*BackBtn2,*BackBtn3;
	UIButton *NextBtn,*NextBtn2;
	UIButton *SendBtn;
	
	UIImage *catchImage;
	UIImageView *c_cutPt;
	MFMailComposeViewController *pickers;
	
	IBOutlet UITextView *TextView,*TextView1;
	UIImageView *topbar3;
	UILabel *tittle3;
	
	UIImageView *topbar,*c_I;
	UIButton *BTN;
	
	
	XMLUtil *XMLUtilView,*XMLUtilView1;
	
	
	ASINetworkQueue *m_pNetWorkQueue;
	NSString *MainMenuImgPath,*MainMenuPdfPath;
	NSString *DownLpath;
	
	
	UIButton *btn;
	
}
@property (nonatomic, retain) UIImage *m_pReImgData;
@property (nonatomic,retain)UIScrollView *scrollview;

@property (nonatomic,retain)UITextView *TextView,*TextView1;
-(void)btn:(id)sender;
-(void)btn2:(id)sender;
-(void)btncamare:(UIButton *)sender;
-(void)btnselect:(UIButton *)sender;
-(void)home:(id)sender;
-(void)next:(id)sender;
-(void)back:(id)sender;
-(void)cut:(id)sender;
-(void)send:(id)sender;
-(void)ToNews:(id)sender;
-(void)next1:(id)sender;

-(void)displayComposerSheet; 
-(UIImage*)emailphoto;
-(void)showPicker;
-(void)dxc:(NSString *)downloadfile;


-(void)VideoPlayFinish;
-(void)VideoPlayFinish1;
-(void)VideoPlayFinish2;


@end
