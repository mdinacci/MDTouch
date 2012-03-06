//
//  CALayer+Utils.m
//  Marco Dinacci
//
//  Created by Marco Dinacci on 01/12/2011.
//  Copyright (c) 2011 Marco Dinacci. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CALayer+Utils.h"

@implementation CALayer (Utils)

- (void)roundWithRadius:(float)radius borderWidth:(float)borderWidth borderColor:(CGColorRef)borderColor maskToBounds:(BOOL)maskToBounds 
{
    self.cornerRadius = radius;
    self.borderWidth = borderWidth;
    self.borderColor = borderColor;
    self.masksToBounds = maskToBounds;
}

@end
