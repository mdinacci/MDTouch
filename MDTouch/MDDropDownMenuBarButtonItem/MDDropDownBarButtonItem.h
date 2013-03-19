//
//  MDDropDownBarButtonItem.h
//  MDTouch
//
//  Created by Marco Dinacci on 14/02/2013.
//  Copyright (c) 2013 Marco Dinacci. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MDDropDownBarButtonItemDelegate <NSObject>

@required

- (void)menuButtonPressed;

@end

@interface MDDropDownBarButtonItem : UIBarButtonItem

@property (strong, nonatomic) id<MDDropDownBarButtonItemDelegate> delegate;

@end
