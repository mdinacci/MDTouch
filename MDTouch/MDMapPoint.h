//
//  MDMapPoint.h
//  MDTouch
//
//  Created by Marco Dinacci on 22/08/2011.
//  Copyright 2011 Marco Dinacci. All rights reserved.
//
//  An annotation used to show user location and nearby events.

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface MDMapPoint : NSObject <MKAnnotation>

- (id)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate title:(NSString *)aTitle;

// Required property from MKAnnotation
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

// Optional property from MKAnnotation
@property (nonatomic, strong) NSString *title;

@end
