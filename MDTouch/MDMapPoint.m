//
//  MDMapPoint.m
//  MDTouch
//
//  Created by Marco Dinacci on 22/08/2011.
//  Copyright 2011 Marco Dinacci. All rights reserved.
//

#import "MDMapPoint.h"


@implementation MDMapPoint

- (id)initWithCoordinate:(CLLocationCoordinate2D)aCoordinate title:(NSString *)aTitle
{
    self = [super init];
    if (self) {
        self.coordinate = aCoordinate;
        self.title = aTitle;
    }
    return self;
}

- (BOOL)isEqual:(id)object
{
    return [[self title] isEqualToString: [object title]] &&
    [self coordinate].latitude == [object coordinate].latitude &&
    [self coordinate].longitude == [object coordinate].longitude;
}

- (NSUInteger)hash
{
    // FIXME
    return [self.title hash] & 17;
}

@end
