//
//  NSURL+Utils.m
//  Marco Dinacci
//
//  Created by Marco Dinacci on 29/11/2011.
//  Copyright (c) 2011 Marco Dinacci Ltd. All rights reserved.
//

#import "NSURL+Utils.h"

@implementation NSURL (NSURL_Utils)

- (BOOL) isEqualToURL:(NSURL*)otherURL;
{
	return [[self absoluteURL] isEqual:[otherURL absoluteURL]] || 
    ([self isFileURL] && [otherURL isFileURL] && ([[self path] isEqual:[otherURL path]]));
}

@end
