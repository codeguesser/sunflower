//
//  facebook.mm
//  New_Projects
//
//  Created by MGIE on 11-2-22.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "facebook.h"



bool b_login;
BOOL clickedFacebook;
FBSession* _session;
NSString *_user_name;
UILabel *_label;
NSString *str_fbid;
NSString* fql;
UIImage *drawImage;
NSString *imagepath;
New_ProjectsAppDelegate *m_pAppDelegate;

@implementation facebook



-(void)initFacebook
{
	if (kGetSessionProxy) {
		_session = [[FBSession sessionForApplication:kApiKey getSessionProxy:kGetSessionProxy
											delegate:self] retain];
	} else {
		_session = [[FBSession sessionForApplication:kApiKey secret:kApiSecret delegate:self] retain];
	}
	[_session resume];
}


-(void)facebookimage
{
	UIImage* drawImage = [[UIImage alloc]init];
	NSData *myData; 
	myData = UIImagePNGRepresentation(drawImage); 
	NSString *postLength = [NSString stringWithFormat:@"%d", [myData length]];  
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];  
	[request setURL:[NSURL URLWithString:@"http://tequilahk.youdomain.com/semipermanent_nodes/setImage.php"]];  
	[request setHTTPMethod:@"POST"]; 
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];  
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];  
	[request setHTTPBody:myData]; 
	NSURLConnection *conn=[[NSURLConnection alloc] initWithRequest:request delegate:self];  
	NSLog(@"facebookimage");
	if(conn)
	{
		
	}
	else
	{
		UIAlertView *viewa= [[[UIAlertView  alloc] initWithTitle:nil 
														 message:@"網絡連結失敗"
														delegate:self 
											   cancelButtonTitle:@"確定"  
											   otherButtonTitles:nil,nil] autorelease];
		viewa.tag = 5;
		[viewa show];
	}
}
- (void)connectionDidFinishLoading:(NSURLConnection *)aConn
{
	
}
-(void)connection:(NSURLConnection *)aConn didReceiveData:(NSData *)data
{
	NSLog(@"CONNECTION AUTO CALLED!...");
	NSString *hello=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
	NSLog(@"receivedbData %@", hello);
}

+(void)facebookerror
{
	UIAlertView *alertview = [[[UIAlertView  alloc] initWithTitle:@"Error" 
														  message:@"No login facebook account!"
														 delegate:nil 
												cancelButtonTitle:@"OK"  
												otherButtonTitles:nil] autorelease];
	alertview.tag = 20;
	[alertview show];
}

+(void)facebooklogout
{
	UIAlertView *alertview = [[[UIAlertView  alloc] initWithTitle:@"Warning" 
														  message:@"Facebook Logout?"
														 delegate:nil 
												cancelButtonTitle:@"YES"  
												otherButtonTitles:@"NO",nil] autorelease];
	alertview.tag = 10;
	[alertview show];
}

+(void)facebooklogin
{
	if(b_login == false)
	{
		FBLoginDialog* dialog = [[[FBLoginDialog alloc] initWithSession:_session] autorelease];
		[dialog show];
		clickedFacebook = YES;
	}
	else {
		[self sharetofacebook];
	}

	
}
-(void)sharetofacebook
{
	//if(_session.isConnected)
	{
		FBStreamDialog* dialog = [[[FBStreamDialog alloc] init] autorelease];
		dialog.delegate = self;
		//NSString * str_img = @"http://p2java.mggame.net/iphonecms/facebook/theone_thumbnail_R.jpg";
		NSString *str_img=@"http://tp1.sinaimg.cn/2248289860/180/5607567858/1";
		NSString *jg=@"如有查詢，請聯絡熱線中心 2722-9260。";
		NSLog(@"str_url2:%@",str_img);
		NSString * str_url2 = @"http://www.facebook.com/TBWAHK";
		NSLog(@"str_url2:%@",str_url2);
		m_pAppDelegate = [[UIApplication sharedApplication] delegate];
		//NSString * str_1 = [NSString stringWithFormat:@"\"name\":\"%@ %@\",\"href\":\"%@\"", _user_name,m_pAppDelegate.m_pShareText,m_pAppDelegate.m_pSharepdf];
		
		NSString * str_1 = [NSString stringWithFormat:@"\"name\":\"%@ %@\",\"href\":\"%@\"", @"",m_pAppDelegate.m_pShareText,m_pAppDelegate.m_pSharepdf];
		NSString * str_2 = [NSString stringWithFormat:@"\"caption\":\"%@\",\"description\":\"%@ %@\",\"description\":\"%@ \"",m_pAppDelegate.m_pSharepdf,@"",@"",jg];
		
		NSString * str_3 = [NSString stringWithFormat:@"\"media\":[{\"type\":\"image\",\"src\":\"%@\",\"href\":\"%@\"}]",str_img,m_pAppDelegate.m_pSharepdf];
		NSString * str_attachment = [NSString stringWithFormat:@"{%@,%@,%@}",str_1, str_2,str_3];
		dialog.attachment = str_attachment;
		[dialog show];
	}
	
}
+(void)sharetofacebook
{
	//if(_session.isConnected)
	{
		FBStreamDialog* dialog = [[[FBStreamDialog alloc] init] autorelease];
		dialog.delegate = self;
		//NSString * str_img = @"http://p2java.mggame.net/iphonecms/facebook/theone_thumbnail_R.jpg";
		NSString *jg=@"如有查詢，請聯絡熱線中心 2722-9260。";
		NSString * str_img=@"http://tp1.sinaimg.cn/2248289860/180/5607567858/1";
		NSLog(@"str_url2:%@",str_img);
		NSString * str_url2 = @"http://www.facebook.com/TBWAHK";
		NSLog(@"str_url2:%@",str_url2);
		
		m_pAppDelegate = [[UIApplication sharedApplication] delegate];
		
		
		NSString * str_1 = [NSString stringWithFormat:@"\"name\":\"%@ %@\",\"href\":\"%@\"", @"",m_pAppDelegate.m_pShareText,m_pAppDelegate.m_pSharepdf];
		NSString * str_2 = [NSString stringWithFormat:@"\"caption\":\"%@\",\"description\":\"%@ %@\",\"description\":\"%@ \"",m_pAppDelegate.m_pSharepdf,@"",@"",jg];
		
		NSString * str_3 = [NSString stringWithFormat:@"\"media\":[{\"type\":\"image\",\"src\":\"%@\",\"href\":\"%@\"}]",str_img,m_pAppDelegate.m_pSharepdf];
		NSString * str_attachment = [NSString stringWithFormat:@"{%@,%@,%@}",str_1, str_2,str_3];
		dialog.attachment = str_attachment;
		[dialog show];
	}
	
}


///////////////////////////////////////////////////////////////////////////////////////////////////
// FBSessionDelegate

- (void)session:(FBSession*)session didLogin:(FBUID)uid {
	b_login = true;
	_label.text = @"";
	
    fql = [NSString stringWithFormat:
		   @"select uid,name from user where uid == %lld", session.uid];
	NSLog(@"%@",fql);
	NSDictionary* params = [NSDictionary dictionaryWithObject:fql forKey:@"query"];
	[[FBRequest requestWithDelegate:self] call:@"facebook.fql.query" params:params];
}

- (void)sessionDidNotLogin:(FBSession*)session {
	_label.text = @"Canceled login";
}

- (void)sessionDidLogout:(FBSession*)session {
	_label.text = @"Disconnected";
	b_login = false;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
// FBRequestDelegate

- (void)request:(FBRequest*)request didLoad:(id)result {
	if ([request.method isEqualToString:@"facebook.fql.query"]) {
		NSArray* users = result;
		NSDictionary* user = [users objectAtIndex:0];
		NSString* name = [user objectForKey:@"name"];
		_user_name=[[NSString alloc] initWithString: name];
		
		_label.text = [NSString stringWithFormat:@"Logged in as %@", name];
		if (clickedFacebook)
		{
			[self sharetofacebook];
			clickedFacebook = NO;
		}
	} else if ([request.method isEqualToString:@"facebook.users.setStatus"]) {
		NSString* success = result;
		if ([success isEqualToString:@"1"]) {
			_label.text = [NSString stringWithFormat:@"Status successfully set"]; 
		} else {
			_label.text = [NSString stringWithFormat:@"Problem setting status"]; 
		}
	} else if ([request.method isEqualToString:@"facebook.photos.upload"]) {
		NSDictionary* photoInfo = result;
		NSString* pid = [photoInfo objectForKey:@"pid"];
		_label.text = [NSString stringWithFormat:@"Uploaded with pid %@", pid];
	}
}

- (void)request:(FBRequest*)request didFailWithError:(NSError*)error {
	_label.text = [NSString stringWithFormat:@"Error(%d) %@", error.code,
				   error.localizedDescription];
}

///////////////////////////////////////////////////////////////////////////////////////////////////

- (void)askPermission:(id)target {
	FBPermissionDialog* dialog = [[[FBPermissionDialog alloc] init] autorelease];
	dialog.delegate = self;
	dialog.permission = @"status_update";
	[dialog show];
}

@end
