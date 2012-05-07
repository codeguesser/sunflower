//
//  New_ProjectsAppDelegate.m
//  New_Projects
//
//  Created by Ping.w on 09-4-24.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "New_ProjectsAppDelegate.h"


@implementation New_ProjectsAppDelegate

@synthesize window;
@synthesize theView;
@synthesize m_pShareText,m_pSharepdf;


BOOL g_isHaveNetwork=NO;

#define kAccelerometerFrequency     40
#pragma mark  ==============mainview IS A CONTROLLER=====================
- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
    
    isFirstOpenApp=YES;
	
	application.applicationIconBadgeNumber = 0;
	[[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge |UIRemoteNotificationTypeSound)];
	
	
	theView=[[MainView alloc]initWithNibName:@"mainView" bundle:nil];
	
	
	[window setBackgroundColor:[UIColor whiteColor]];
	[window addSubview:theView.view];
	
	
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / kAccelerometerFrequency)];
    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
	//AudioSessionInitialize(NULL, NULL, NULL, self);
	
	//NSLog(@"resualt = %f",sqrt(480*480 + 320*320) );
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(eraseView) name:@"shake" object:nil];
	
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name: kReachabilityChangedNotification
                                               object: nil];
    hostReach = [[Reachability reachabilityWithHostName:@"www.google.com"] retain];//可以以多种形式初始化
    [hostReach startNotifier];  //开始监听,会启动一个run loop
    [self updateInterfaceWithReachability: hostReach];
	
}


- (void)applicationWillResignActive:(UIApplication *)application {
	[theView ResignActive];
}
-(void)startLoad{
	NSLog(@"11");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[theView BecomeActive];
}
-(void) eraseView
{
	//[theView shake];
}

- (void)dealloc {
	[window release];
	[theView release];
	[super dealloc];
}
#pragma mark    ===============chon 01.26 ok!======================
- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
	//[theView accelerometerWithX:acceleration.x Y:acceleration.y Z:acceleration.z];
	
	/*if(acceleration.x>1.5 || acceleration.y>1.5 || acceleration.z>1.5 || acceleration.x<-1.5 || acceleration.y<-1.5 || acceleration.z<-1.5 )
	{
		NSString *str = [[NSString alloc] initWithFormat:@"x= %g, y=%g, z=%g",acceleration.x ,acceleration.y ,acceleration.z];
		UIAlertView *myAlert = [[UIAlertView alloc] initWithTitle:@"tap touched" message:str 
													 delegate:nil cancelButtonTitle:@"yes! you are right!!!" otherButtonTitles:nil];
		[myAlert show];
		[myAlert release];
	}*/
}




/////////////复制添加以下所有方法到delegate/////////////////

#pragma mark    ===============     push     ======================
/////---iPhone 从APNs服务器获取deviceToken后激活该方法
- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken{
	NSLog(@"deviceToken %@",deviceToken);
	//NSString *dtS = [[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
	
	//NSString* dtS = [deviceToken description];
	
	
	NSMutableString *string = [NSMutableString stringWithCapacity:[deviceToken length] * 2];  
	const uint8_t *bytes = [deviceToken bytes];  
	
	for (int i = 0; i < [deviceToken length]; i++)  
		[string appendFormat:@"%02x", (uint32_t)bytes[i]];  
	[self submitDT:[string copy]];
	//viewController.dt.text = dtS;
}

-(void)submitDT:(NSString*)dt
{
    NSString *strUDID=[[UIDevice currentDevice] uniqueIdentifier];
	NSString *post = [[NSString alloc] initWithFormat:@"udid=%@&token=%@",strUDID,dt];
	NSLog(@"the dt is %@",post);
	//[viewController setDT:post];
	NSData *postData = [post dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];   
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];
	NSString *url = [NSString stringWithFormat:@"http://sunflower.ibrand.hk/api/register_token.php?"];
    
    
    
	// http://sunflower.ibrand.hk/api/register_token.php?udid=xx&token=xx  
	
    
    
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];   
	[request setURL:[NSURL URLWithString:url]]; //
	[request setHTTPMethod:@"POST"];   
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"]; 
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];   
	[request setHTTPBody:postData];   
	NSURLConnection *conn=[[NSURLConnection alloc] initWithRequest:request delegate:self];  
}

////--注册push功能失败 后 返回错误信息，执行相应的处理
- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
	NSLog(@"push error:%@",err);
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"didReceiveRemoteNotification");
	NSDictionary *obj = [userInfo objectForKey:@"aps"];
	NSString *mess = [obj objectForKey:@"alert"];
	// NSString *mess = [NSString stringWithFormat:@"Notification received:\n%@",[userInfo description]];
	//[viewController setDT:[mess description]];
	UIAlertView *viewa= [[[UIAlertView  alloc] initWithTitle:nil 
													 message:[mess description]
													delegate:self 
										   cancelButtonTitle:@"確定"  
										   otherButtonTitles:nil,nil] autorelease];
	[viewa show];
}
#pragma mark -
// 连接改变
- (void) reachabilityChanged: (NSNotification* )note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    [self updateInterfaceWithReachability: curReach];
    
    
}

//处理连接改变后的情况
- (void) updateInterfaceWithReachability: (Reachability*) curReach
{
    //对连接改变做出响应的处理动作。
    NetworkStatus status = [curReach currentReachabilityStatus];
    
    if (status == NotReachable) {  //没有连接到网络就弹出提实况
        g_isHaveNetwork=NO;
        if(!isFirstOpenApp)
        {
            UIAlertView *netWorkError5 = 
            [[UIAlertView alloc] 
             initWithTitle:@"無法連接到伺服器，請檢查你的網絡設定或可瀏覽離線內容\"旅遊錦囊\""
             message:@"" 
             delegate:self 
             cancelButtonTitle:nil 
             otherButtonTitles:@"確定",nil];
            [netWorkError5 show];
            [netWorkError5 release];
        }
        
    }
    else
    {
        g_isHaveNetwork=YES;
    }
    isFirstOpenApp=NO;
}



@end
