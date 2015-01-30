//
//  Question+QuestionExtensions.m
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/26/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "Question+QuestionExtensions.h"
#import "AppDelegate.h"

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
    NSArray *allQuestions = [self allQuestions];
    NSMutableArray *questions = [NSMutableArray array];
    
    if (allQuestions) {
        for (int i = 0; i < 10; i++) {
            int totalQuestions = (int)allQuestions.count;
            int random = arc4random_uniform(totalQuestions);
            
            [questions addObject:[allQuestions objectAtIndex:random]];
        }
        
        return questions;
    }
    
    return nil;
}

+ (NSArray *)answersForQuestion:(Question *)question {
    return [question.answer allObjects];
}

@end
