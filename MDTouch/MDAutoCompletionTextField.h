//
//  MDAutoCompletionTextField.h
//  CheckYourPet
//
//  Created by Marco Dinacci on 26/02/2013.
//  Copyright (c) 2013 Oxbridge Animal Services. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MDAutoCompletionDataSource <NSObject>

- (NSArray *)completionsForString:(NSString *)string;
- (NSArray *)completionsForString:(NSString *)string countLimit:(NSUInteger)limit;

@end


@interface MDAutoCompletionTextField : UITextField

@end
