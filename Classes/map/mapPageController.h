//
//  mapPageController.h
//  LearnLoadMap
//
//  Created by Brian on 2009/4/30.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "POI.h"
#import "mapController.h"
//#import "XMLUtil3.h"


@interface mapPageController : UIViewController <MKMapViewDelegate,CLLocationManagerDelegate> {
	MKMapView *map1;
	CLLocationManager *locationManager;
	//XMLUtil3 *myXMLUtil3;
	bool b_finish;
	NSString *c_name;
	mapController *mapControllerView;
	NSString* titlestr;

}

@property (nonatomic,retain) IBOutlet MKMapView *map1;
@property (nonatomic,retain)NSString *c_name;
-(void) createMapPoint:(MKMapView *)mapView coordinateX:(double)coorX coordinateY:(double)coorY
				  Title:(NSString*)title Subtitle:(NSString*)subtitle Tag:(int)tag;



//-(void)GetMyPoint;



@end
