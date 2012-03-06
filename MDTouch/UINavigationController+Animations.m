//
//  UINavigationController+Animations.m
//  Marco Dinacci
//
//  Created by Marco Dinacci on 07/10/2011.
//  Copyright 2011 Marco Dinacci Ltd. All rights reserved.
//

#import "UINavigationController+Animations.h"

@implementation UINavigationController (UINavigationController_Animations)

- (void)pushController: (UIViewController*) controller withTransition: (UIViewAnimationTransition) transition 
{
    [UIView beginAnimations:nil context:NULL];
    [self pushViewController:controller animated:NO];
    [UIView setAnimationDuration:.5];
    [UIView setAnimationBeginsFromCurrentState:YES];        
    [UIView setAnimationTransition:transition forView:self.view cache:YES];
    [UIView commitAnimations];
}

@end
