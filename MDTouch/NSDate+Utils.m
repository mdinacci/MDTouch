//
//  NSDate+Utils.m
//  MDTouch
//
//  Created by Marco Dinacci on 19/02/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import "NSDate+Utils.h"

@implementation NSDate (Utils)

- (int)daysBetween:(NSDate *)date
{
    NSUInteger unitFlags = NSDayCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:unitFlags fromDate:self toDate:date options:0];
    return [components day] + 1;
}

- (NSString *)simpleDescription
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    
    return [formatter stringFromDate:self];
}

@end
