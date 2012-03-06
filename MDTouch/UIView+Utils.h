//
//  UIView+Utils.h
//  MDTouch
//
//  Created by Marco Dinacci on 21/09/2011.
//  Copyright 2011 Marco Dinacci. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_Utils)

// Handy methods to print a view hierarchy 
+ (void)dumpViews:(UIView *)view withText:(NSString *)text andIndent:(NSString *)indent;

- (void)slideFromParent:(UIView *)parentView up:(BOOL)up;
- (void)slideInFromBottom;
- (void)slideOutToBottom;

@end
