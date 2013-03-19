//
//  UIView+Dim.m
//  MDTouch
//
//  Created by Marco Dinacci on 17/02/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import "UIView+Dim.h"
#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>

#define kDimView @"dimView"

@implementation UIView (Dim)

- (void)dim
{
    UIView *view = objc_getAssociatedObject(self, kDimView);
    if (!view)
    {
        view = [[UIView alloc] initWithFrame:self.frame];
        view.opaque = NO;
        view.backgroundColor = [UIColor blackColor];
        objc_setAssociatedObject(self, kDimView, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    [self addSubview:view];

    // FIXME this sends the view one step back in the hierarchy, to allow the menu
    // to be perfectly visible but still hiding the rest of the view.
    // It shouldn't be in a general purpose category though...
    int currentIndex = [self.subviews indexOfObject:view];
	[self exchangeSubviewAtIndex:currentIndex withSubviewAtIndex:currentIndex-1];
    
    view.alpha = 0.0;
    [UIView animateWithDuration:0.5 animations:^{
       view.alpha = 0.5;
    }];
}

- (void)brighten
{
    UIView *view = objc_getAssociatedObject(self, kDimView);
    
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha = 0.0;
    }];
    
    
    [view removeFromSuperview];
}

@end
