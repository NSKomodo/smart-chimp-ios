//
//  AudioManager.m
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/24/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "AudioManager.h"

@interface AudioManager ()

@end

@implementation AudioManager

- (instancetype)initWithFile:(NSString *)fileName ofType:(NSString *)fileType {
    self = [super init];
    
    if (self) {
        [self configureAudioSession];
        [self configureAudioPlayerWithFile:fileName ofType:fileType];
        [self configureButtonSound];
        [self configureCorrectSound];
    }
    
    return self;
}

- (void)tryPlayMusic {
	if (self.musicPlaying || [self.audioSession isOtherAudioPlaying]) {
        return;
    }
    
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
    self.musicPlaying = YES;
}

- (void)playButtonSound {
    AudioServicesPlaySystemSound(self.buttonSound);
}

- (void)playCorrectSound {
    AudioServicesPlaySystemSound(self.correctSound);
}

#pragma mark - Audio session and player setup

- (void)configureAudioSession {
    self.audioSession = [AVAudioSession sharedInstance];
    
    NSError *setCategoryError = nil;
    if ([self.audioSession isOtherAudioPlaying]) {
        [self.audioSession setCategory:AVAudioSessionCategorySoloAmbient error:&setCategoryError];
        self.musicPlaying = NO;
    } else {
        [self.audioSession setCategory:AVAudioSessionCategoryAmbient error:&setCategoryError];
    }
    
    if (setCategoryError) {
        NSLog(@"Error setting category: %ld", (long)[setCategoryError code]);
    }
}

- (void)configureAudioPlayerWithFile:(NSString *)fileName ofType:(NSString *)fileType {
    NSString *backgroundMusicPath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileType];
    NSURL *backgroundMusicURL = [NSURL fileURLWithPath:backgroundMusicPath];
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:backgroundMusicURL error:nil];
    self.audioPlayer.delegate = self;
    self.audioPlayer.numberOfLoops = -1;
}

- (void)configureButtonSound {
    NSString *buttonSoundPath = [[NSBundle mainBundle] pathForResource:@"Punch" ofType:@"mp3"];
	NSURL *buttonSoundURL = [NSURL fileURLWithPath:buttonSoundPath];
	AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonSoundURL, &_buttonSound);
}

- (void)configureCorrectSound {
    NSString *correctSoundPath = [[NSBundle mainBundle] pathForResource:@"Jackpot" ofType:@"mp3"];
    NSURL *correctSoundURL = [NSURL fileURLWithPath:correctSoundPath];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)correctSoundURL, &_correctSound);
}

#pragma mark - Audio player delegate

- (void) audioPlayerBeginInterruption: (AVAudioPlayer *) player {
    self.musicInterrupted = YES;
	self.musicPlaying = NO;
}

- (void) audioPlayerEndInterruption: (AVAudioPlayer *) player withOptions:(NSUInteger)flags {
    [self tryPlayMusic];
    self.musicInterrupted = NO;
}

@end
