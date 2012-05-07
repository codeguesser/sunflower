//
//  facebook.h
//  New_Projects
//
//  Created by MGIE on 11-2-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "fbconfig.h"
#import "FBConnect.h"
#import "New_ProjectsAppDelegate.h"

 
@interface facebook : NSObject<FBDialogDelegate,FBSessionDelegate,FBRequestDelegate>{
	
	
}


-(void)initFacebook;
//+(UIImage*)roundViewphoto;
-(void)facebookimage;
+(void)facebookerror;
+(void)facebooklogout;
+(void)facebooklogin;
-(void)sharetofacebook;
+(void)sharetofacebook;
-(void)askPermission:(id)target;

@end
