//
//  AVAudioRecorder+Player.m
//  Marco Dinacci
//
//  Created by Marco Dinacci on 24/08/2011.
//  Copyright 2011 Marco Dinacci Ltd. All rights reserved.
//

#import "AVAudioRecorder+Player.h"
#import "MDTouch.h"

@implementation AVAudioRecorder (Player)

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)play
{
    NSError *error = nil;
    AVAudioPlayer *player = [[AVAudioPlayer alloc] initWithContentsOfURL:[self url] error:&error];
    [player setDelegate:self];
    
    if(error != nil) {
        ULOG(@"Problem to initialise audio player, cannot play audio: %d", [error code]);  
        return;
    }
    
    ULOG(@"Playing audio from: %@", [self url]);
    
    player.volume = 1.0; // we don't want it to be silent.
    [player play];
}



@end
