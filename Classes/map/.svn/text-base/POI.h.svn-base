//
//  POI.h
//  mapkittest
//
//  Created by Brian on 2009/4/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface POI : NSObject <MKAnnotation> {

	CLLocationCoordinate2D coordinate;
	NSString *subtitle;
	NSString *title;
	int tag;
}

@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,retain) NSString *subtitle;
@property (nonatomic,retain) NSString *title;
@property int tag;

-(id) initWithCoords:(CLLocationCoordinate2D) coords;

@end
