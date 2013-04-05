//
//  NSDate+Utils.h
//  MDTouch
//
//  Created by Marco Dinacci on 19/02/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

- (int)daysBetween:(NSDate *)date;
- (NSString *)simpleDescription;

@end
