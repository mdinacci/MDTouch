//
//  NSArray+Functional.m
//  Marco Dinacci
//
//  Created by Marco Dinacci on 01/04/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import "NSArray+Functional.h"

@implementation NSArray (Functional)

- (NSArray *)filter:(BOOL(^)(id item))filterBlock
{
    NSMutableArray *filteredArray = [NSMutableArray array];
    for (id item in self) {
        if (filterBlock(item)) {
            [filteredArray addObject:item];
        }
    }
    
    return filteredArray;
}

@end
