//
//  AVAudioRecorder+Player.h
//  Marco Dinacci
//
//  Created by Marco Dinacci on 24/08/2011.
//  Copyright 2011 Marco Dinacci Ltd. All rights reserved.
//
//  This category extend the AVAudioRecorder functionalities allowing it to play a file. 
//  Questionable from a OO point of view but it's easy to use a single (and small) component.

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AVAudioRecorder (Player) <AVAudioPlayerDelegate>

- (void) play;

@end
