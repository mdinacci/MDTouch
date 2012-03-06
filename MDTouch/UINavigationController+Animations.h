//
//  UINavigationController+Animations.h
//  Marco Dinacci
//
//  Created by Marco Dinacci on 07/10/2011.
//  Copyright 2011 Marco Dinacci Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (UINavigationController_Animations)

- (void)pushController: (UIViewController*) controller withTransition: (UIViewAnimationTransition) transition;

@end
