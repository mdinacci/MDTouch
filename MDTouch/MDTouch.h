//
//  MDTouch.h
//  MDTouch
//
//  Created by Marco Dinacci on 09/02/2012.
//  Copyright (c) 2012 Marco Dinacci. All rights reserved.
//

#import <Foundation/Foundation.h>

// Better logging
#ifdef DEBUG
#define ULOG(fmt, ...) NSLog((@"%s:%d| " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define ULOG(...)
#endif