//
//  UIImage+Utils.m
//  Marco Dinacci
//
//  Created by Marco Dinacci on 04/10/2011.
//  Copyright 2011 Marco Dinacci Ltd. All rights reserved.
//

#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/UTCoreTypes.h>
#import "UIImage+Utils.h"

@implementation UIImage (UIImage_Utils)

- (UIImage *)thumbnailWithSize:(CGSize)size
{
    return [self thumbnailWithWidth:size.width andHeight:size.height];
}

- (UIImage *)thumbnailWithWidth:(NSInteger)width andHeight:(NSInteger)height
{
    CGSize origImageSize = [self size];
    CGRect newRect;
    newRect.origin = CGPointZero;
    newRect.size = CGSizeMake(width, height);
    
    float ratio = MAX(newRect.size.width / origImageSize.width, 
                      newRect.size.height / origImageSize.height);
    
    UIGraphicsBeginImageContext(newRect.size);
    
    // Setup the rectangle where we'll composite the image
    CGRect projectRect;
    projectRect.size.width = ratio * origImageSize.width;
    projectRect.size.height = ratio * origImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    
    // Draw the image on it
    [self drawInRect:projectRect];
    
    // Get the image from the image context, retain it as our thumbnail
    UIImage *thumbnail = UIGraphicsGetImageFromCurrentImageContext();
    
    // We're done
    UIGraphicsEndImageContext();
    
    return thumbnail;
}

- (BOOL)saveAsJpegWithName:(NSString *)path withQuality:(float)quality;
{
    BOOL success = [UIImageJPEGRepresentation(self, quality) writeToFile:path atomically:YES];
    return success;
}

@end
