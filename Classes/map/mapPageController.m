//
//  mapPageController.m
//  LearnLoadMap
//
//  Created by Brian on 2009/4/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "mapPageController.h"


@implementation mapPageController


@synthesize map1;
@synthesize c_name;

int pointstate = 0;
mapPageController *mymapPageControllerView;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	b_finish = YES;
	mymapPageControllerView = self;
	locationManager = [[CLLocationManager alloc]init];
	[locationManager setDelegate:self];
	[locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
	[locationManager startUpdatingLocation];
	[self.view setFrame:CGRectMake(0, 0, 320, 460)];
	// Override point for customization after app launch 
	
	
	UIImageView *banner=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 43)];
	[banner setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"header_bar" ofType:@"png"]]];
	[self.view addSubview:banner];
	[banner release];
	
	UILabel *strTitle=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 43)];
	[strTitle setBackgroundColor:[UIColor clearColor]];
	[strTitle setTextColor:[UIColor whiteColor]];
	[strTitle setFont:[UIFont systemFontOfSize:18]];
	[strTitle setTextAlignment:UITextAlignmentCenter];
	[strTitle setText:@"店鋪地點"];
	//[strTitle setText:c_name];
	[self.view addSubview:strTitle];
	[strTitle release];
	
	UIButton *backBtn=[[UIButton buttonWithType:UIButtonTypeCustom]retain];
	[backBtn setFrame:CGRectMake(265,4,44,32)];
	[backBtn setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"fanhui" ofType:@"png"]] forState:UIControlStateNormal];
	[backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:backBtn];
	[backBtn release];
	
	UIButton *btn[6];
	for(int i=0;i<6;i++)
	{
		btn[i]=[[UIButton buttonWithType:UIButtonTypeCustom]retain];
		[btn[i] setFrame:CGRectMake(i*54-2,412,54,48)];//圖width size唔岩
		[btn[i] setTag:i];
		[btn[i] setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"nav%d",i] ofType:@"png"]] forState:UIControlStateNormal];
		[btn[i] addTarget:self action:@selector(btn_events:) forControlEvents:UIControlEventTouchUpInside];
		[self.view addSubview:btn[i]];
		[btn[i] release];
	}
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
	
	//NSLog(@"%f",newLocation.coordinate.latitude);
	
	
	if(b_finish == YES)
	{
		b_finish = NO;
		CGRect rect = CGRectMake(0, 43, 320, 369);
		map1 = [[MKMapView alloc] initWithFrame:rect];
		
		[map1 setDelegate: self];
		//[map setCenter:CGPointMake(160, 240)] ;
		[map1 setMapType: MKMapTypeStandard];
		
		
		MKCoordinateRegion theRegion;
		
		//set region center
		CLLocationCoordinate2D theCenter;
		theCenter.latitude = newLocation.coordinate.latitude;//25.032054;
		theCenter.longitude = newLocation.coordinate.longitude;//121.529266;
		
		theRegion.center=theCenter;
		
		//set region error distance
		MKCoordinateSpan theSpan;
		theSpan.latitudeDelta = 0.003;
		theSpan.longitudeDelta = 0.003;
		theRegion.span = theSpan;
		
		
		map1.scrollEnabled = YES; 
		map1.zoomEnabled = YES; 
		
		//set map Region
		[map1 setRegion:theRegion];
		[map1 regionThatFits:theRegion];
		
		
		[self.view addSubview:map1];
		
		[self createMapPoint:map1 coordinateX:theCenter.latitude coordinateY:theCenter.longitude Title:@"self" Subtitle:@"myLocation" Tag:0];
		
//		if(myXMLUtil3!=nil)
//		{
//			[myXMLUtil3 release];
//			myXMLUtil3 = nil;
//		}
//		myXMLUtil3 = [[XMLUtil3 alloc] init];
//		[myXMLUtil3 xmlParserByUrl:[NSString stringWithFormat:@"http://219.76.237.44/optical88/shop.do?method=getNextShop&longitude=%f&latitude=%f",theCenter.longitude,theCenter.latitude]];
//		int errorCode = [myXMLUtil3 getErrorCode];
//		if(errorCode==5)
//		{
//			UIAlertView *netWorkError = 
//			[[UIAlertView alloc] 
//			 initWithTitle:@"連接伺服器時發生錯誤" 
//			 message:@"請檢查互聯網連接後再登入" 
//			 delegate:self 
//			 cancelButtonTitle:nil 
//			 otherButtonTitles:@"OK",nil];
//			[netWorkError show];
//			[netWorkError release];
//		}
	}
	//[self.view addSubview:mapControllerView.view];
	
}


//-(void)GetMyPoint
//{
//	CLLocationCoordinate2D theCenter;
//	theCenter.latitude = newLocation.coordinate.latitude;//25.032054;
//	theCenter.longitude = newLocation.coordinate.longitude;//121.529266;
//	
//	NSLog(@"%@",theCenter.latitude);
//}


-(void) createMapPoint:(MKMapView *)mapView coordinateX:(double)coorX coordinateY:(double)coorY
				  Title:(NSString*)title Subtitle:(NSString*)subtitle Tag:(int)tag{
	if(mapView!=nil){
		
		//set POI lat and lng
		CLLocationCoordinate2D p1;
		POI *poi;
		
		if(coorX && coorY){
			
			p1.latitude=coorX;
			p1.longitude = coorY;
			poi = [[POI alloc] initWithCoords:p1]; 
			poi.tag = tag;
			
			if(title!=NULL)
				poi.title=title;
			
			if(subtitle!=NULL)
				poi.subtitle=subtitle;
					
			[mapView addAnnotation:poi];
			[poi release];
			
		}
		
	}
}	

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
	
	
	MKPinAnnotationView *newAnnotation = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation1"]autorelease];
	newAnnotation.pinColor = MKPinAnnotationColorRed;
	newAnnotation.animatesDrop = YES; 
	//canShowCallout: to display the callout view by touch the pin
	newAnnotation.canShowCallout=YES;
	
	return newAnnotation;
	
	
}



- (void)checkButtonTapped:(id)sender event:(id)event{

	UIAlertView *tmp= [[UIAlertView alloc] initWithTitle:@"訊息！" message:@"Callout測試" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
	[tmp show];
	[tmp release];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[locationManager release];
//	[myXMLUtil3 release];
    [super dealloc];
}
#pragma mark -
#pragma mark button methods
-(void)back:(UIButton*)sender
{
	[self.view removeFromSuperview];
}
-(void)btn_events:(UIButton*)sender
{
	//int nTemp=sender.tag;
	
	
}



@end
