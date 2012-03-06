//
//  NSString+Utils.m
//  Marco Dinacci
//
//  Created by Marco Dinacci on 04/10/2011.
//  Copyright 2011 Marco Dinacci Ltd. All rights reserved.
//

#import "NSString+Utils.h"
#import "MDTouch.h"

@implementation NSString (NSString_Utils)

+ (NSString *) UUID
{
    NSString *uuidString = nil;
    CFUUIDRef uuid = CFUUIDCreate(kCFAllocatorDefault);
    if (uuid) {
        uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuid);
        CFRelease(uuid);
    }
    
    return uuidString;
}

@end
