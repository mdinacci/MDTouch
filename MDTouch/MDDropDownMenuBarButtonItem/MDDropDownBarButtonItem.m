//
//  MDDropDownBarButtonItem.m
//  MDTouch
//
//  Created by Marco Dinacci on 14/02/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import "MDDropDownBarButtonItem.h"
#import "MDScrollingMenu.h"

@implementation MDDropDownBarButtonItem

- (id)init
{
    self = [super init];
    if (self) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"drop_down_menu_icon.png"] forState:UIControlStateNormal];
        button.frame = CGRectMake(0.0f, 0.0f, 48.0f, 30.0f);
        [button setImageEdgeInsets:UIEdgeInsetsMake(5, 10, 5, 0)];
        [button addTarget:self action:@selector(menuButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        
        self.customView = button;
        self.style = UIBarButtonSystemItemFixedSpace;
    }
    
    return self;
}

- (void)menuButtonPressed
{
    [self.delegate menuButtonPressed];
}

@end
