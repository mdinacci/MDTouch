//
//  UIImage+Utils.h
//  Marco Dinacci
//
//  Created by Marco Dinacci on 04/10/2011.
//  Copyright 2011 Marco Dinacci Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (UIImage_Utils)

- (UIImage *)thumbnailWithSize:(CGSize)size;
- (UIImage *)thumbnailWithWidth:(NSInteger)width andHeight:(NSInteger)height;
- (BOOL)saveJPEGToPath:(NSString *)path withQuality:(CGFloat)quality;

@end
