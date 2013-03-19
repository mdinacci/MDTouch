//
//  MDScrollingMenu.h
//  MDTouch
//
//  Created by Marco Dinacci on 14/02/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^AnimationsBlock)(void);

@interface MDScrollingMenu : UIScrollView

@property (nonatomic, assign, readonly) BOOL visible;

- (id)initWithFrame:(CGRect)frame;

- (void)slideOut;
- (void)slideIn;

- (void)animateWithAnimations:(AnimationsBlock)animations;

- (void)addView:(UIView *)view;
- (void)removeFirstSubView;
- (void)removeAllSubViews;

@end