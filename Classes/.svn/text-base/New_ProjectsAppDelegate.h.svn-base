//
//  New_ProjectsAppDelegate.h
//  New_Projects
//
//  Created by Ping.w on 09-4-24.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "MainView.h"
#import "PaintingWindow.h"


#import "Reachability.h"



@interface New_ProjectsAppDelegate : NSObject <UIApplicationDelegate,UIAccelerometerDelegate> {
    PaintingWindow *window;
    MainView *theView;
	NSString *m_pShareText,*m_pSharepdf;
    
    
    Reachability *hostReach;
    BOOL isFirstOpenApp;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainView *theView;
-(void)startLoad;
@property (nonatomic, retain) NSString *m_pShareText,*m_pSharepdf;
@end

