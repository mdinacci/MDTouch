//
//  UIView+Animations.m
//  CheckYourPet
//
//  Created by Marco Dinacci on 01/03/2013.
//  Copyright (c) 2013 Oxbridge Animal Services. All rights reserved.
//

#import "UIView+Animations.h"
#import <objc/runtime.h>

@implementation UIView (Animations)

static const char * completionBlockAction = "completionBlockAction";

- (void)shiftBy:(CGPoint)point
{
	[UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         CGPoint adjust = point;
                         CGPoint newCenter = CGPointMake(self.center.x+adjust.x,
														 self.center.y+adjust.y);
                         [self setCenter:newCenter];
                     }
                     completion:nil];
}

- (void)shiftDownBy:(CGPoint)point
{
	
}

- (void)slideUp
{
    // Compute the start frame
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGSize viewSize = [self sizeThatFits:CGSizeZero];
    CGRect startRect = CGRectMake(0.0,
                                  screenRect.origin.y + screenRect.size.height,
                                  viewSize.width, viewSize.height);
    self.frame = startRect;
    
    // Compute the end frame
    CGRect viewRect = CGRectMake(0.0,
                                   screenRect.origin.y + screenRect.size.height - viewSize.height,
                                   viewSize.width,
                                   viewSize.height);
    
    // Start the slide up animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    
    self.frame = viewRect;
    
    [UIView commitAnimations];
    
}

- (void)slideDownWithCompletionBlock:(CompletionBlock)block
{
    objc_setAssociatedObject(self, completionBlockAction, block, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGRect endFrame = self.frame;
    endFrame.origin.y = screenRect.origin.y + screenRect.size.height;
    
    // Start the slide down animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(viewSlideDownDidStop)];
    
    self.frame = endFrame;
    [UIView commitAnimations];
}

- (void)viewSlideDownDidStop
{
    CompletionBlock block = (CompletionBlock)objc_getAssociatedObject(self, completionBlockAction);
    block();
}

@end
