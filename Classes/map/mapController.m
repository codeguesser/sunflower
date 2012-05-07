//
//  mapPageController.m
//  LearnLoadMap
//
//  Created by Brian on 2009/4/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "mapController.h"
#import "MainView.h"
#import "EnquiryViewMy.h"
extern MainView *myMainView;

@implementation mapController


@synthesize map1;
@synthesize c_name;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setFrame:CGRectMake(0, 0, 320, 460)];//369
		
	// Override point for customization after app launch  
	
	
	UIImageView *topbar1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	[topbar1 setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"topbar"] ofType:@"png"]]];
	
	
	UIImageView *footbar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 412, 320, 48)];
	footbar.backgroundColor=[UIColor blackColor];
	[self.view addSubview:footbar];
	[footbar release];
	
	
	UIImageView *IMG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 480-48)];
	//[IMG setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"tips_background"] ofType:@"jpg"]]];
	//topbar.backgroundColor = [UIColor lightGrayColor];
	IMG.backgroundColor=[UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1.0];
	
	//IMG.backgroundColor=[UIColor whiteColor];
	[self.view addSubview:IMG];
	
	
	//[self.navigationController.navigationBar addSubview:topbar1];
	[self.view addSubview:topbar1];
	
	
	
	c_I=[[UIImageView alloc]initWithFrame:CGRectMake(280, 10, 23, 23)];
	[c_I setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:[NSString stringWithFormat:@"icon_i"] ofType:@"png"]]];
	[topbar1 addSubview:c_I];
	
	BTN = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[BTN addTarget:self action:@selector(next:)forControlEvents:UIControlEventTouchUpInside];
	//[BTN setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@""] ofType:@""]] forState:UIControlStateNormal];
	BTN.frame = CGRectMake(270, 0, 55, 45);
	//[self.navigationController.navigationBar addSubview:BTN];
	[self.view addSubview:BTN];
	
	
	
	tittle1 = [[UILabel alloc]initWithFrame:CGRectMake(1, 2, 320, 45)];
	tittle1.text=c_name;
	tittle1.textColor = [UIColor blackColor];
	tittle1.backgroundColor = [UIColor clearColor];
	tittle1.textAlignment = UITextAlignmentCenter;
	tittle1.font = [UIFont boldSystemFontOfSize:20];
	//[topbar1 addSubview:tittle1];
	
	
	
	tittle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 45)];
	tittle.text=c_name;
	tittle.textColor = [UIColor whiteColor];
	tittle.backgroundColor = [UIColor clearColor];
	tittle.textAlignment = UITextAlignmentCenter;
	tittle.font = [UIFont boldSystemFontOfSize:20];
	[topbar1 addSubview:tittle];
	[topbar1 release];
	
	UIButton *btnback = [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
	[btnback addTarget:self action:@selector(back:)forControlEvents:UIControlEventTouchUpInside];
	[btnback setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"icon_back"] ofType:@"png"]] forState:UIControlStateNormal];
	btnback.frame = CGRectMake(10,7,71,31);
	[self.view addSubview:btnback];
	
	for(int i=0;i<5;i++)
	{
		if(i==2)
		{
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon2_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412-44+45,64,48);
			
			[self.view addSubview:btnfoot];
			
		}
		else {
			btnfoot= [[[UIButton buttonWithType:UIButtonTypeCustom] retain]autorelease];
			[btnfoot addTarget:self action:@selector(btnfoot:)forControlEvents:UIControlEventTouchUpInside];
			[btnfoot setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"buttomicon_0%d",i+1] ofType:@"png"]] forState:UIControlStateNormal];
			btnfoot.tag = 20+i;
			btnfoot.frame = CGRectMake(i*64,412-44+45,64,48);
			
			[self.view addSubview:btnfoot];
		}
	}
		
		
	
}
-(void)setmapPoint:(double)coorX :(double)coorY
				  :(NSString*)title :(NSString*)subtitle :(int)tag;
{
	
	CGRect rect = CGRectMake(0, 43, 320, 369);
	map1 = [[MKMapView alloc] initWithFrame:rect];
	
	[map1 setDelegate: self];
	//[map setCenter:CGPointMake(160, 240)] ;
	[map1 setMapType: MKMapTypeStandard];
	
	
	MKCoordinateRegion theRegion;
	
	//set region center
	CLLocationCoordinate2D theCenter;
	theCenter.latitude = coorX;
	theCenter.longitude = coorY;
	
	theRegion.center=theCenter;
	
	//set region error distance
	MKCoordinateSpan theSpan;
	theSpan.latitudeDelta = 0.013;
	theSpan.longitudeDelta = 0.013;
	theRegion.span = theSpan;
	
	
	map1.scrollEnabled = YES; 
	map1.zoomEnabled = YES; 
	
	//set map Region
	[map1 setRegion:theRegion];
	[map1 regionThatFits:theRegion];
	
	
	[self.view addSubview:map1];
	[self createMapPoint:map1 coordinateX:coorX coordinateY:coorY Title:title Subtitle:subtitle Tag:tag ];
}


-(void)setmapPoint1:(double)coorX :(double)coorY
				  :(NSString*)title :(NSString*)subtitle :(int)tag;
{
	
	
	[self createMapPoint:map1 coordinateX:coorX coordinateY:coorY Title:title Subtitle:subtitle Tag:tag ];
	
}

-(IBAction)btnfoot:(UIButton*)sender
{
	if (sender.tag-18 != myMainView.app_state) {
		[myMainView mainviewinitstate:sender.tag-18];
		[myMainView mainviewdelete];
	}
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


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





- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
	

	POI *poi=(POI*)annotation;
	
	switch(poi.tag)
	{
		case 1:
		{
			MKPinAnnotationView *newAnnotation = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation1"]autorelease];
			newAnnotation.pinColor = MKPinAnnotationColorPurple;
			newAnnotation.animatesDrop = YES; 
			//canShowCallout: to display the callout view by touch the pin
			newAnnotation.canShowCallout=YES;
			
			return newAnnotation;
		}
			break;
		
			
		default:
		{
			MKPinAnnotationView *newAnnotation = [[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation1"]autorelease];
			newAnnotation.pinColor = MKPinAnnotationColorRed;
			newAnnotation.animatesDrop = YES; 
			//canShowCallout: to display the callout view by touch the pin
			newAnnotation.canShowCallout=YES;
			
			return newAnnotation;
		}
			break;
	}
	
	
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
	[map1 release];
    [super dealloc];
}

#pragma mark -
#pragma mark button methods
-(void)back:(UIButton*)sender
{

	[self.navigationController popViewControllerAnimated:YES];
}
-(void)btn_events:(UIButton*)sender
{
	//int nTemp=sender.tag;
	
	
}
-(void)next:(id)sender
{
	
	EnquiryViewMy *c_EnquiryViewMy=[[EnquiryViewMy alloc]initWithNibName:@"EnquiryViewMy" bundle:nil];
	//c_product2view.view.frame=CGRectMake(0, 45, 320, 480-90);
	c_EnquiryViewMy.c_tabbtn=[[NSString alloc]initWithFormat:@"1"];
	c_EnquiryViewMy.backkind=[[NSString alloc]initWithFormat:@"0"];
	[self.navigationController pushViewController:c_EnquiryViewMy animated:YES];
}


@end
