//
//  UIView+Animations.h
//  CheckYourPet
//
//  Created by Marco Dinacci on 01/03/2013.
//  Copyright (c) 2013 Oxbridge Animal Services. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CompletionBlock)(void);

@interface UIView (Animations)

- (void)slideUp;
- (void)shiftBy:(CGPoint)point;
- (void)slideDownWithCompletionBlock:(CompletionBlock)block;

@end
