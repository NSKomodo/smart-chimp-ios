//
//  HighScore+HighScoreExtensions.h
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/26/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "HighScore.h"

@interface HighScore (HighScoreExtensions)

+ (NSArray *)allHighScores;
+ (void)removeAll;

@end
