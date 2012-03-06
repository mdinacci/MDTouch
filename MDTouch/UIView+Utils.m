//
//  UIView+Utils.m
//  MDTouch
//
//  Created by Marco Dinacci on 21/09/2011.
//  Copyright 2011 Marco Dinacci. All rights reserved.
//

#import "UIView+Utils.h"

@implementation UIView (UIView_Utils)

+ (void) dumpViews:(UIView *)view withText:(NSString *)text andIndent:(NSString *)indent;
{
    Class cl = [self class];
    NSString *classDescription = [cl description];
    while ([cl superclass]) {
        cl = [cl superclass];
        classDescription = [classDescription stringByAppendingFormat:@":%@", [cl description]];
    }
    
    if ([text compare:@""] == NSOrderedSame)
        NSLog(@"%@ %@", classDescription, NSStringFromCGRect(view.frame));
    else
        NSLog(@"%@ %@ %@", text, classDescription, NSStringFromCGRect(view.frame));
    
    for (NSUInteger i = 0; i < [view.subviews count]; i++) {
        UIView *subView = [view.subviews objectAtIndex:i];
        NSString *newIndent = [[NSString alloc] initWithFormat:@"  %@", indent];
        NSString *msg = [[NSString alloc] initWithFormat:@"%@%d:", newIndent, i];
        [UIView dumpViews:subView withText:msg andIndent:newIndent];
    }
}

- (void)slideFromParent:(UIView *)parentView up:(BOOL)up
{
    int yOffset = self.center.y;
    const int movementDistance = yOffset;
    const float movementDuration = 0.3f;
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    parentView.frame = CGRectOffset(parentView.frame, 0, movement);
    [UIView commitAnimations];
}

- (void)slideInFromBottom
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
    
    // We need to perform some post operations after the animation is complete
    [UIView setAnimationDelegate:self];
    
    self.frame = viewRect;
    
    [UIView commitAnimations];
}

- (void)slideOutToBottom
{
    CGRect screenRect = [[UIScreen mainScreen] applicationFrame];
    CGRect endFrame = self.frame;
    endFrame.origin.y = screenRect.origin.y + screenRect.size.height;
    
    // start the slide down animation
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    
    // we need to perform some post operations after the animation is complete
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(slideOutDidStop)];
    
    self.frame = endFrame;
    [UIView commitAnimations];
}

- (void)slideOutDidStop
{
    [self removeFromSuperview];
}

@end
