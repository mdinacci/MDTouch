//
//  MDScrollingMenu.m
//  MDTouch
//
//  Created by Marco Dinacci on 14/02/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import "MDScrollingMenu.h"
#import <QuartzCore/QuartzCore.h>

#define INSET 10
#define kUserViewTag 1

typedef enum {
    LEFT = 0,
    RIGHT
} ShiftDirection;

@implementation MDScrollingMenu

- (id)initWithFrame:(CGRect)frame
{
    CGPoint origin = frame.origin;
    CGSize size = frame.size;
    CGRect newFrame = CGRectMake(origin.x, - size.height, size.width, size.height);
    self = [super initWithFrame:newFrame];
    if (self) {
        // Internal properties
        _visible = NO;
        
        // Scrollview properties
        [self setBounces:YES];
        [self setScrollEnabled:YES];
        [self setShowsHorizontalScrollIndicator:NO];
        [self setShowsVerticalScrollIndicator:NO];
        
        // Resize the view when the layout change
        [self setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
        
        // Background image
        [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"menu_bg.png"]]];
    }
    return self;
}

#pragma mark - View management

- (void)addView:(UIView *)view
{
    view.tag = kUserViewTag;
    
    [self shiftButtons:RIGHT];
    
    // Add the new subview
    CGSize menuSize = self.frame.size;
    int viewSize = menuSize.height - INSET * 2;
    view.frame = CGRectMake(INSET, (menuSize.height - viewSize) / 2, viewSize, viewSize);
    
    [super addSubview:view];
    
    CGSize oldSize = self.contentSize;
    CGSize newSize = CGSizeMake(oldSize.width + INSET + viewSize, oldSize.height);
    [self setContentSize:newSize];
}

- (void)removeFirstSubView
{
    // Find the first subview with tag kUserViewTag and delete it
    UIView *subView = nil;
    for (int i = [self.subviews count] - 1; i >= 0; i--) {
        subView = [self.subviews objectAtIndex:i];
        if (subView.tag == kUserViewTag) {
            [subView removeFromSuperview];
            
            CGSize oldSize = self.contentSize;
            int viewSize = subView.frame.size.width;
            CGSize newSize = CGSizeMake(oldSize.width - INSET - viewSize, oldSize.height);
            [self setContentSize:newSize];
            
            break;
        }
    }
    
    [self shiftButtons:LEFT];
}

- (void)removeAllSubViews
{
    UIView *subView = nil;
    for (int i = [self.subviews count] - 1; i >= 0; i--) {
        subView = [self.subviews objectAtIndex:i];
        if (subView.tag == kUserViewTag) {
            [subView removeFromSuperview];
            
            CGSize oldSize = self.contentSize;
            int viewSize = subView.frame.size.width;
            CGSize newSize = CGSizeMake(oldSize.width - INSET - viewSize, oldSize.height);
            [self setContentSize:newSize];
        }
    }
}

- (void)shiftButtons:(ShiftDirection)direction
{
    CGSize menuSize = self.frame.size;
    int viewSize = menuSize.height - INSET * 2;
 
    if (direction == LEFT) {
        for (UIView *subView in self.subviews) {
            if (subView.tag == kUserViewTag) {
                CGPoint svOrigin = subView.frame.origin;
                subView.frame = CGRectMake(svOrigin.x - INSET - viewSize, (menuSize.height - viewSize) / 2,
                                           viewSize, viewSize);
            }
        }

        
    } else if (direction == RIGHT) {
        for (UIView *subView in self.subviews) {
            if (subView.tag == kUserViewTag) {
                CGPoint svOrigin = subView.frame.origin;
                subView.frame = CGRectMake(svOrigin.x + INSET + viewSize, (menuSize.height - viewSize) / 2,
                                           viewSize, viewSize);
            }
        }

    }
}

#pragma mark - Animations

- (void)slideIn
{
    AnimationsBlock animations = ^ {
        CGSize menuSize = self.frame.size;
        [self setTransform:CGAffineTransformMakeTranslation(0, menuSize.height)];
        _visible = YES;
    };
    
    [self animateWithAnimations:animations];
}

- (void)slideOut
{
    CGSize menuSize = self.frame.size;
    AnimationsBlock animations = ^ {
        [self setTransform:CGAffineTransformMakeTranslation(0, self.frame.origin.y - menuSize.height)];
        _visible = NO;
    };
    
    [self animateWithAnimations:animations];

    
}

- (void)animateWithAnimations:(void (^)(void))animations
{
    [UIView animateWithDuration: 0.3
                          delay: 0
                        options: (UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction)
                     animations:animations
                     completion:^(BOOL finished) {
                     }];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return YES;
}

@end
