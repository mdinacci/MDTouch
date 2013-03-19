//
//  MDLink.m
//  MDTouch
//
//  Created by Marco Dinacci on 09/03/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import "MDLink.h"

@implementation MDLink

- (void) drawRect:(CGRect)rect
{
    CGRect textRect = self.titleLabel.frame;
    CGFloat descender = self.titleLabel.font.descender;
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGFloat shadowHeight = self.titleLabel.shadowOffset.height;
    descender += shadowHeight;
    
    // set to same colour as text
    CGContextSetStrokeColorWithColor(contextRef, self.titleLabel.textColor.CGColor);
    CGContextMoveToPoint(contextRef, textRect.origin.x, textRect.origin.y + textRect.size.height + descender);
    CGContextAddLineToPoint(contextRef, textRect.origin.x + textRect.size.width, textRect.origin.y + textRect.size.height + descender);
    CGContextClosePath(contextRef);
    CGContextDrawPath(contextRef, kCGPathStroke);
}

@end
