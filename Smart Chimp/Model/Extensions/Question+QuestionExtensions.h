//
//  Question+QuestionExtensions.h
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/26/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "Question.h"

@interface Question (QuestionExtensions)

+ (NSArray *)allQuestions;
+ (NSArray *)randomQuestions;
+ (NSArray *)answersForQuestion:(Question *)question;

@end
