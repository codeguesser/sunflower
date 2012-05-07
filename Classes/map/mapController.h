//
//  mapPageController.h
//  LearnLoadMap
//
//  Created by Brian on 2009/4/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "POI.h"


@interface mapController : UIViewController <MKMapViewDelegate> {
	MKMapView *map1;
	NSString *c_name;
	
	
	
	UIButton *btnfoot;
	UITableView *c_tableview;
	NSArray * titles;
	UIButton *NextBtn;
	NSArray * indexIconNames;
	UILabel *tittle,*tittle1;
	UIWebView *m_pWebView;
	NSURL *temp_URL;
	NSURLRequest *temp_URLRequest;
	NSString *bundle;
	UIImageView *topbar,*c_I;
	UIButton *BTN;

	
	
}

@property (nonatomic,retain) IBOutlet MKMapView *map1;
@property (nonatomic,retain) NSString *c_name;

-(void) createMapPoint:(MKMapView *)mapView 
		   coordinateX:(double)coorX coordinateY:(double)coorY 
		   Title:(NSString*)title Subtitle:(NSString*)subtitle Tag:(int)tag;



-(void)setmapPoint:(double)coorX :(double)coorY:
				(NSString*)title :(NSString*)subtitle :(int)tag;

-(void)setmapPoint1:(double)coorX :(double)coorY
				   :(NSString*)title :(NSString*)subtitle :(int)tag;
-(void)next:(id)sender;
@end
