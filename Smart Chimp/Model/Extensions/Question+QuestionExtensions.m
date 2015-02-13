//
//  Question+QuestionExtensions.m
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/26/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "Question+QuestionExtensions.h"
#import "AppDelegate.h"
#import "NSMutableArray+NSMutableArrayExtensions.h"

@implementation Question (QuestionExtensions)

+ (NSArray *)allQuestions {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *questions = [context executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return questions;
}

+ (NSArray *)randomQuestions {
    NSMutableArray *questionNumbers = [NSMutableArray array];
    NSArray *allQuestions = [self allQuestions];
    NSMutableArray *randomQuestions = [NSMutableArray array];
    
    for (int i = 0; i < allQuestions.count; i++) {
        [questionNumbers addObject:[NSNumber numberWithInt:i]];
    }
    
    [questionNumbers shuffle];
    
    for (int i = 0; i < 10; i++) {
        [randomQuestions addObject:[allQuestions objectAtIndex:[[questionNumbers objectAtIndex:i] intValue]]];
        NSLog(@"Question #%@", [questionNumbers objectAtIndex:i]);
    }
    
    return randomQuestions;
}

+ (NSArray *)answersForQuestion:(Question *)question {
    return [question.answer allObjects];
}

@end
