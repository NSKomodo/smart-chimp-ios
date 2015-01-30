//
//  AudioManager.h
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/24/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface AudioManager : NSObject <AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioSession *audioSession;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (assign) BOOL musicPlaying;
@property (assign) BOOL musicInterrupted;
@property (assign) SystemSoundID buttonSound;
@property (assign) SystemSoundID correctSound;

- (instancetype)initWithFile:(NSString *)fileName ofType:(NSString *)fileType;
- (void)tryPlayMusic;
- (void)playButtonSound;
- (void)playCorrectSound;

@end
