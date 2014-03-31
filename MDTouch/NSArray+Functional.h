//
//  NSArray+Functional.h
//  Marco Dinacci
//
//  Created by Marco Dinacci on 01/04/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Functional)

- (NSArray *)filter:(BOOL(^)(id item))filterBlock;

@end
