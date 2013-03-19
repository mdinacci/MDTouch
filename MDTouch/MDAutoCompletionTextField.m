//
//  MDAutoCompletionTextField.m
//  CheckYourPet
//
//  Created by Marco Dinacci on 26/02/2013.
//  Copyright (c) 2013 Oxbridge Animal Services. All rights reserved.
//

#import "MDAutoCompletionTextField.h"

@interface MDAutoCompletionTextField ()

@property (strong, nonatomic) id<MDAutoCompletionDataSource> autoCompletionDataSource;
@property (strong, nonatomic) UIView *autoCompletionView;

@end

@implementation MDAutoCompletionTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

@end
