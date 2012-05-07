//
//  POI.m
//  mapkittest
//
//  Created by Brian on 2009/4/29.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "POI.h"
@implementation POI


@synthesize coordinate,subtitle,title,tag;

- (id) initWithCoords:(CLLocationCoordinate2D) coords{
	
	self = [super init];
	
	if (self != nil) {
		coordinate = coords; 
	}
	
	return self;
	
}

- (void) dealloc

{
	[title release];
	[subtitle release];
	[super dealloc];
}

@end