//
//  AppDelegate.m
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/17/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "AppDelegate.h"
#import "Question.h"
#import "Answer.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self setupQuestionsAndAnswers];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)setupQuestionsAndAnswers {
    // Obtain Core Data context
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Empty questions and answers as initial setup
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init]; NSEntityDescription *entity = [NSEntityDescription entityForName:@"Question" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    NSArray *items = [context executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    for (Question *question in items) {
        [context deleteObject:question];
    }
    
    [self saveContext];
    
    // Pre-populate questions and answers
    
#pragma mark - Question #1
    Question *question1 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question1.question_text = @"What's the probability of picking an ace of spades out of a brand new deck without jokers?";
    
    Answer *answer1_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer1_1.answer_text = @"1/52";
    answer1_1.is_correct = @NO;
    
    Answer *answer1_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer1_2.answer_text = @"100%";
    answer1_2.is_correct = @YES;
    
    Answer *answer1_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer1_3.answer_text = @"4/52";
    answer1_3.is_correct = @NO;
    
    Answer *answer1_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer1_4.answer_text = @"50%";
    answer1_4.is_correct = @NO;
    
    [question1 addAnswer:[NSSet setWithObjects:answer1_1, answer1_2, answer1_3, answer1_4, nil]];
    
#pragma mark - Question #2
    Question *question2 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question2.question_text = @"How many ways is it possible to color the faces of a six sided cube white?";
    
    Answer *answer2_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer2_1.answer_text = @"Seven";
    answer2_1.is_correct = @NO;
    
    Answer *answer2_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer2_2.answer_text = @"Nine";
    answer2_2.is_correct = @NO;
    
    Answer *answer2_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer2_3.answer_text = @"Thirteen";
    answer2_3.is_correct = @NO;
    
    Answer *answer2_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer2_4.answer_text = @"Eleven";
    answer2_4.is_correct = @YES;
    
    [question2 addAnswer:[NSSet setWithObjects:answer2_1, answer2_2, answer2_3, answer2_4, nil]];
    
#pragma mark - Question #3
    Question *question3 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question3.question_text = @"A 4x4 planting density per acre is twice as many trees as an 8x8 spacing";
    
    Answer *answer3_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer3_1.answer_text = @"True";
    answer3_1.is_correct = @NO;
    
    Answer *answer3_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer3_2.answer_text = @"False";
    answer3_2.is_correct = @YES;
    
    Answer *answer3_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer3_3.answer_text = @"Both";
    answer3_3.is_correct = @NO;
    
    Answer *answer3_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer3_4.answer_text = @"Neither";
    answer3_4.is_correct = @NO;
    
    [question3 addAnswer:[NSSet setWithObjects:answer3_1, answer3_2, answer3_3, answer3_4, nil]];
    
#pragma mark - Question #4
    Question *question4 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question4.question_text = @"If you only had one match and you walked into a room where there was an oil burner, a kerosene lamp, and a wood burning stove, what would you light first?";
    
    Answer *answer4_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer4_1.answer_text = @"Kerosene lamp";
    answer4_1.is_correct = @NO;
    
    Answer *answer4_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer4_2.answer_text = @"The oil burner";
    answer4_2.is_correct = @NO;
    
    Answer *answer4_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer4_3.answer_text = @"What you had when you walked into the room";
    answer4_3.is_correct = @YES;
    
    Answer *answer4_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer4_4.answer_text = @"The wood burning stove";
    answer4_4.is_correct = @NO;
    
    [question4 addAnswer:[NSSet setWithObjects:answer4_1, answer4_2, answer4_3, answer4_4, nil]];
    
#pragma mark - Question #5
    Question *question5 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question5.question_text = @"There are 3 apples and you take away 2. How many do you have?";
    
    Answer *answer5_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer5_1.answer_text = @"One";
    answer5_1.is_correct = @NO;
    
    Answer *answer5_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer5_2.answer_text = @"Two";
    answer5_2.is_correct = @YES;
    
    Answer *answer5_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer5_3.answer_text = @"Three";
    answer5_3.is_correct = @NO;
    
    Answer *answer5_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer5_4.answer_text = @"None";
    answer5_4.is_correct = @NO;
    
    [question5 addAnswer:[NSSet setWithObjects:answer5_1, answer5_2, answer5_3, answer5_4, nil]];
    
#pragma mark - Question #6
    Question *question6 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question6.question_text = @"Two women play five games of checkers. Each woman wins the same number of games. There are no ties. Explain this.";
    
    Answer *answer6_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer6_1.answer_text = @"They are not wearing ties";
    answer6_1.is_correct = @NO;
    
    Answer *answer6_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer6_2.answer_text = @"Women are not playing each other";
    answer6_2.is_correct = @YES;
    
    Answer *answer6_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer6_3.answer_text = @"Women do not wear ties";
    answer6_3.is_correct = @NO;
    
    Answer *answer6_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer6_4.answer_text = @"They are playing men";
    answer6_4.is_correct = @NO;
    
    [question6 addAnswer:[NSSet setWithObjects:answer6_1, answer6_2, answer6_3, answer6_4, nil]];
    
#pragma mark - Question #7
    Question *question7 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question7.question_text = @"A woman gives a beggar 50 cents, the woman is the beggar’s sister, but the beggar is not the woman’s brother. How come?";
    
    Answer *answer7_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer7_1.answer_text = @"The woman is the beggar";
    answer7_1.is_correct = @NO;
    
    Answer *answer7_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer7_2.answer_text = @"The beggar is an in-law";
    answer7_2.is_correct = @NO;
    
    Answer *answer7_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer7_3.answer_text = @"The beggar is the woman’s sister";
    answer7_3.is_correct = @YES;
    
    Answer *answer7_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer7_4.answer_text = @"Not possible";
    answer7_4.is_correct = @NO;
    
    [question7 addAnswer:[NSSet setWithObjects:answer7_1, answer7_2, answer7_3, answer7_4, nil]];
    
#pragma mark - Question #8
    Question *question8 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question8.question_text = @"If a cat jumped out of a hat onto a doormat then sat on a ledge next to a school thinking he was in New York sitting on top of the Empire State building, where is the cat?";
    
    Answer *answer8_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer8_1.answer_text = @"On the doormat";
    answer8_1.is_correct = @NO;
    
    Answer *answer8_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer8_2.answer_text = @"On the ledge";
    answer8_2.is_correct = @YES;
    
    Answer *answer8_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer8_3.answer_text = @"New York";
    answer8_3.is_correct = @NO;
    
    Answer *answer8_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer8_4.answer_text = @"Empire State Building";
    answer8_4.is_correct = @NO;
    
    [question8 addAnswer:[NSSet setWithObjects:answer8_1, answer8_2, answer8_3, answer8_4, nil]];
    
#pragma mark - Question #9
    Question *question9 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question9.question_text = @"Two mothers and two daughters walk into a store. They have 21 dollars. How is it possible to split it equally without any cents (in whole dollars)?";
    
    Answer *answer9_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer9_1.answer_text = @"They get $7 each";
    answer9_1.is_correct = @YES;
    
    Answer *answer9_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer9_2.answer_text = @"They get $5.40 each";
    answer9_2.is_correct = @NO;
    
    Answer *answer9_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer9_3.answer_text = @"They get $6 each";
    answer9_3.is_correct = @NO;
    
    Answer *answer9_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer9_4.answer_text = @"Not Possible";
    answer9_4.is_correct = @NO;
    
    [question9 addAnswer:[NSSet setWithObjects:answer9_1, answer9_2, answer9_3, answer9_4, nil]];
    
#pragma mark - Question #10
    Question *question10 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question10.question_text = @"Divide 30 by half and add 10. What is the answer?";
    
    Answer *answer10_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer10_1.answer_text = @"15";
    answer10_1.is_correct = @NO;
    
    Answer *answer10_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer10_2.answer_text = @"25";
    answer10_2.is_correct = @NO;
    
    Answer *answer10_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer10_3.answer_text = @"30";
    answer10_3.is_correct = @NO;
    
    Answer *answer10_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer10_4.answer_text = @"70";
    answer10_4.is_correct = @YES;
    
    [question10 addAnswer:[NSSet setWithObjects:answer10_1, answer10_2, answer10_3, answer10_4, nil]];
    
#pragma mark - Question #11
    Question *question11 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question11.question_text = @"How many 2 cent stamps are in a dozen?";
    
    Answer *answer11_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer11_1.answer_text = @"Six";
    answer11_1.is_correct = @NO;
    
    Answer *answer11_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer11_2.answer_text = @"Twelve";
    answer11_2.is_correct = @YES;
    
    Answer *answer11_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer11_3.answer_text = @"Eighteen";
    answer11_3.is_correct = @NO;
    
    Answer *answer11_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer11_4.answer_text = @"Twenty-four";
    answer11_4.is_correct = @NO;
    
    [question11 addAnswer:[NSSet setWithObjects:answer11_1, answer11_2, answer11_3, answer11_4, nil]];
    
#pragma mark - Question #12
    Question *question12 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question12.question_text = @"A forester has 17 trees, and all but 9 die. How many are left?";
    
    Answer *answer12_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer12_1.answer_text = @"Eight";
    answer12_1.is_correct = @NO;
    
    Answer *answer12_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer12_2.answer_text = @"Nine";
    answer12_2.is_correct = @YES;
    
    Answer *answer12_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer12_3.answer_text = @"The first eight";
    answer12_3.is_correct = @NO;
    
    Answer *answer12_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer12_4.answer_text = @"I don't know";
    answer12_4.is_correct = @NO;
    
    [question12 addAnswer:[NSSet setWithObjects:answer12_1, answer12_2, answer12_3, answer12_4, nil]];
    
#pragma mark - Question #13
    Question *question13 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question13.question_text = @"What was the U.S. President's name in the 1950?";
    
    Answer *answer13_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer13_1.answer_text = @"Harry Truman";
    answer13_1.is_correct = @YES;
    
    Answer *answer13_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer13_2.answer_text = @"John Kennedy";
    answer13_2.is_correct = @NO;
    
    Answer *answer13_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer13_3.answer_text = @"President Eisenhower";
    answer13_3.is_correct = @NO;
    
    Answer *answer13_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer13_4.answer_text = @"Bill Clinton";
    answer13_4.is_correct = @NO;
    
    [question13 addAnswer:[NSSet setWithObjects:answer13_1, answer13_2, answer13_3, answer13_4, nil]];
    
#pragma mark - Question #14
    Question *question14 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question14.question_text = @"How far can a forester run into the woods?";
    
    Answer *answer14_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer14_1.answer_text = @"All the way into the woods";
    answer14_1.is_correct = @NO;
    
    Answer *answer14_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer14_2.answer_text = @"Half way into the woods";
    answer14_2.is_correct = @YES;
    
    Answer *answer14_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer14_3.answer_text = @"He doesn't actually run into the woods";
    answer14_3.is_correct = @NO;
    
    Answer *answer14_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer14_4.answer_text = @"I don't know";
    answer14_4.is_correct = @NO;
    
    [question14 addAnswer:[NSSet setWithObjects:answer14_1, answer14_2, answer14_3, answer14_4, nil]];
    
#pragma mark - Question #15
    Question *question15 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question15.question_text = @"I have two U.S. coins totaling 55 cents. One is not a nickel. What are the coins?";
    
    Answer *answer15_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer15_1.answer_text = @"I have no idea";
    answer15_1.is_correct = @NO;
    
    Answer *answer15_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer15_2.answer_text = @"A fifty-cent piece and a nickel";
    answer15_2.is_correct = @YES;
    
    Answer *answer15_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer15_3.answer_text = @"Not possible";
    answer15_3.is_correct = @NO;
    
    Answer *answer15_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer15_4.answer_text = @"100 yen";
    answer15_4.is_correct = @NO;
    
    [question15 addAnswer:[NSSet setWithObjects:answer15_1, answer15_2, answer15_3, answer15_4, nil]];
    
#pragma mark - Question #16
    Question *question16 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question16.question_text = @"Why can't a man living in the USA be buried in Canada?";
    
    Answer *answer16_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer16_1.answer_text = @"The Canadian government doesn't allow it";
    answer16_1.is_correct = @NO;
    
    Answer *answer16_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer16_2.answer_text = @"The man isnt dead yet";
    answer16_2.is_correct = @YES;
    
    Answer *answer16_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer16_3.answer_text = @"The man is a canadian living in America";
    answer16_3.is_correct = @NO;
    
    Answer *answer16_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer16_4.answer_text = @"The man is living on the border";
    answer16_4.is_correct = @NO;
    
    [question16 addAnswer:[NSSet setWithObjects:answer16_1, answer16_2, answer16_3, answer16_4, nil]];
    
#pragma mark - Question #17
    Question *question17 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question17.question_text = @"There are three playing cards lying face up, side by side. A five is just to the right of a two. A five is just to the left of a two. A spade is just to the left of a club, and a spade is just to the right of a spade. What are the three cards?";
    
    Answer *answer17_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer17_1.answer_text = @"5 spades, 2 spades, 5 clubs";
    answer17_1.is_correct = @YES;
    
    Answer *answer17_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer17_2.answer_text = @"I don't know";
    answer17_2.is_correct = @NO;
    
    Answer *answer17_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer17_3.answer_text = @"5 spades, 2 clubs, a random spade card";
    answer17_3.is_correct = @NO;
    
    Answer *answer17_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer17_4.answer_text = @"2 clubs, a random spade card and a 5 spades";
    answer17_4.is_correct = @NO;
    
    [question17 addAnswer:[NSSet setWithObjects:answer17_1, answer17_2, answer17_3, answer17_4, nil]];
    
#pragma mark - Question #18
    Question *question18 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question18.question_text = @"If you add the age of a man to the age of his wife, the sum is 91. He is now twice as old as she was, when he was as old as she is now. How old are they?";
    
    Answer *answer18_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer18_1.answer_text = @"Man 51, Wife 40";
    answer18_1.is_correct = @NO;
    
    Answer *answer18_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer18_2.answer_text = @"Wife 51, Man 40";
    answer18_2.is_correct = @NO;
    
    Answer *answer18_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer18_3.answer_text = @"Man 52, Wife 39";
    answer18_3.is_correct = @YES;
    
    Answer *answer18_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer18_4.answer_text = @"Man 54, Wife 37";
    answer18_4.is_correct = @NO;
    
    [question18 addAnswer:[NSSet setWithObjects:answer18_1, answer18_2, answer18_3, answer18_4, nil]];
    
#pragma mark - Question #19
    Question *question19 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question19.question_text = @"Can you buy an entire chess set in a pawn shop?";
    
    Answer *answer19_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer19_1.answer_text = @"Yes you can";
    answer19_1.is_correct = @NO;
    
    Answer *answer19_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer19_2.answer_text = @"No, they're completely unrelated";
    answer19_2.is_correct = @YES;
    
    Answer *answer19_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer19_3.answer_text = @"No, you can only buy pawns";
    answer19_3.is_correct = @NO;
    
    Answer *answer19_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer19_4.answer_text = @"You can get everything but the king and queen";
    answer19_4.is_correct = @NO;
    
    [question19 addAnswer:[NSSet setWithObjects:answer19_1, answer19_2, answer19_3, answer19_4, nil]];
    
#pragma mark - Question #20
    Question *question20 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question20.question_text = @"Mary had a coin purse with fifty coins, totaling exactly $1. While counting her change, she dropped one coin. What is the probability that the coin dropped was a penny?";
    
    Answer *answer20_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer20_1.answer_text = @"85%";
    answer20_1.is_correct = @YES;
    
    Answer *answer20_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer20_2.answer_text = @"100%";
    answer20_2.is_correct = @NO;
    
    Answer *answer20_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer20_3.answer_text = @"Marry had no pennies";
    answer20_3.is_correct = @NO;
    
    Answer *answer20_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer20_4.answer_text = @"There's no way to know";
    answer20_4.is_correct = @NO;
    
    [question20 addAnswer:[NSSet setWithObjects:answer20_1, answer20_2, answer20_3, answer20_4, nil]];
    
#pragma mark - Question #21
    Question *question21 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question21.question_text = @"If an electric train is going 150 miles per hour north and the wind is blowing the same south, which way does the smoke blow?";
    
    Answer *answer21_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer21_1.answer_text = @"None, the smoke goes up vertical";
    answer21_1.is_correct = @NO;
    
    Answer *answer21_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer21_2.answer_text = @"It blows South";
    answer21_2.is_correct = @NO;
    
    Answer *answer21_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer21_3.answer_text = @"It blows North at 300 miles per hour";
    answer21_3.is_correct = @NO;
    
    Answer *answer21_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer21_4.answer_text = @"There's no smoke in an electric train";
    answer21_4.is_correct = @YES;
    
    [question21 addAnswer:[NSSet setWithObjects:answer21_1, answer21_2, answer21_3, answer21_4, nil]];
    
#pragma mark - Question #22
    Question *question22 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question22.question_text = @"Two women and two doctors walk into an ice cream parlor. They each order an ice cream cone. When the ice cream cones come, there are only three ice cream cones. How come they don't complain?";
    
    Answer *answer22_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer22_1.answer_text = @"Because one of them changed their mind";
    answer22_1.is_correct = @NO;
    
    Answer *answer22_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer22_2.answer_text = @"Two of them are sharing";
    answer22_2.is_correct = @NO;
    
    Answer *answer22_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer22_3.answer_text = @"One women is a doctor, there are only three people";
    answer22_3.is_correct = @YES;
    
    Answer *answer22_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer22_4.answer_text = @"The cashier made a mistake";
    answer22_4.is_correct = @NO;
    
    [question22 addAnswer:[NSSet setWithObjects:answer22_1, answer22_2, answer22_3, answer22_4, nil]];
    
#pragma mark - Question #23
    Question *question23 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question23.question_text = @"A man gets an egg and a rocket kit. The man builds the rocket and puts the egg inside. Then the man launches the rocket. The rocket suddenly blows up but the egg is unharmed. How is this possible?";
    
    Answer *answer23_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer23_1.answer_text = @"The egg is super powerful";
    answer23_1.is_correct = @NO;
    
    Answer *answer23_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer23_2.answer_text = @"He took the egg out before launching the rocket";
    answer23_2.is_correct = @YES;
    
    Answer *answer23_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer23_3.answer_text = @"There was no egg to begin with";
    answer23_3.is_correct = @NO;
    
    Answer *answer23_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer23_4.answer_text = @"He launched another rocket he had";
    answer23_4.is_correct = @NO;
    
    [question23 addAnswer:[NSSet setWithObjects:answer23_1, answer23_2, answer23_3, answer23_4, nil]];
    
#pragma mark - Question #24
    Question *question24 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question24.question_text = @"Which word, if pronounced right is wrong, but if pronounced wrong is right?";
    
    Answer *answer24_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer24_1.answer_text = @"Wrong";
    answer24_1.is_correct = @YES;
    
    Answer *answer24_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer24_2.answer_text = @"Every word";
    answer24_2.is_correct = @NO;
    
    Answer *answer24_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer24_3.answer_text = @"This question makes no sense";
    answer24_3.is_correct = @NO;
    
    Answer *answer24_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer24_4.answer_text = @"No such word exists";
    answer24_4.is_correct = @NO;
    
    [question24 addAnswer:[NSSet setWithObjects:answer24_1, answer24_2, answer24_3, answer24_4, nil]];
    
#pragma mark - Question #25
    Question *question25 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question25.question_text = @"When James was nine years old, he hammered a nail into a tree to mark his height. Ten years later, he returned to see how much higher the nail was. If the tree grew four inches per year, how much higher is the nail?";
    
    Answer *answer25_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer25_1.answer_text = @"The nail is four inches higher";
    answer25_1.is_correct = @NO;
    
    Answer *answer25_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer25_2.answer_text = @"The nail is 40 inches higher";
    answer25_2.is_correct = @NO;
    
    Answer *answer25_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer25_3.answer_text = @"The nail did not move, the tree grows at the top";
    answer25_3.is_correct = @YES;
    
    Answer *answer25_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer25_4.answer_text = @"Can't say because the tree grows uniformly";
    answer25_4.is_correct = @NO;
    
    [question25 addAnswer:[NSSet setWithObjects:answer25_1, answer25_2, answer25_3, answer25_4, nil]];
    
#pragma mark - Question #26
    Question *question26 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question26.question_text = @"A boy and a doctor were fishing.The boy is the doctor's son but the doctor is not the boy's father. Who is the doctor?";
    
    Answer *answer26_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer26_1.answer_text = @"His grandfather";
    answer26_1.is_correct = @NO;
    
    Answer *answer26_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer26_2.answer_text = @"His brother";
    answer26_2.is_correct = @NO;
    
    Answer *answer26_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer26_3.answer_text = @"His mother";
    answer26_3.is_correct = @YES;
    
    Answer *answer26_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer26_4.answer_text = @"Can't tell";
    answer26_4.is_correct = @NO;
    
    [question26 addAnswer:[NSSet setWithObjects:answer26_1, answer26_2, answer26_3, answer26_4, nil]];
    
#pragma mark - Question #27
    Question *question27 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question27.question_text = @"Tanya is older than Eric. Cliff is older than Tanya. Eric is older than Cliff. If the first two statements are true, the third statement is?";
    
    Answer *answer27_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer27_1.answer_text = @"True";
    answer27_1.is_correct = @NO;
    
    Answer *answer27_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer27_2.answer_text = @"False";
    answer27_2.is_correct = @YES;
    
    Answer *answer27_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer27_3.answer_text = @"Both";
    answer27_3.is_correct = @NO;
    
    Answer *answer27_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer27_4.answer_text = @"None";
    answer27_4.is_correct = @NO;
    
    [question27 addAnswer:[NSSet setWithObjects:answer27_1, answer27_2, answer27_3, answer27_4, nil]];
    
#pragma mark - Question #28
    Question *question28 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question28.question_text = @"At the baseball game, Henry was sitting in seat 253. Marla was sitting to the right of Henry in seat 254. In the seat to the left of Henry was George. Inez was sitting to the left of George. Which seat is Inez sitting in?";
    
    Answer *answer28_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer28_1.answer_text = @"251";
    answer28_1.is_correct = @YES;
    
    Answer *answer28_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer28_2.answer_text = @"254";
    answer28_2.is_correct = @NO;
    
    Answer *answer28_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer28_3.answer_text = @"255";
    answer28_3.is_correct = @NO;
    
    Answer *answer28_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer28_4.answer_text = @"256";
    answer28_4.is_correct = @NO;
    
    [question28 addAnswer:[NSSet setWithObjects:answer28_1, answer28_2, answer28_3, answer28_4, nil]];
    
#pragma mark - Question #29
    Question *question29 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question29.question_text = @"Only gentlemen can become members of the club. Many of the members of the club are officers. Some of the officers have been invited for dinner.";
    
    Answer *answer29_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer29_1.answer_text = @"All the members have been invited for dinner";
    answer29_1.is_correct = @NO;
    
    Answer *answer29_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer29_2.answer_text = @"Some of the officers are not gentlemen";
    answer29_2.is_correct = @NO;
    
    Answer *answer29_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer29_3.answer_text = @"All gentlemen are members of the club";
    answer29_3.is_correct = @YES;
    
    Answer *answer29_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer29_4.answer_text = @"Only gentlemen have been invited for dinner";
    answer29_4.is_correct = @NO;
    
    [question29 addAnswer:[NSSet setWithObjects:answer29_1, answer29_2, answer29_3, answer29_4, nil]];
    
#pragma mark - Question #30
    Question *question30 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question30.question_text = @"Artists are generally whimsical. Some of them are frustrated. Frustrated people are prone to be drug addicts. Based on these statements which of the following conclusions is true?";
    
    Answer *answer30_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer30_1.answer_text = @"All frustrated people are drug addicts";
    answer30_1.is_correct = @NO;
    
    Answer *answer30_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer30_2.answer_text = @"Some artists may be drug addicts";
    answer30_2.is_correct = @YES;
    
    Answer *answer30_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer30_3.answer_text = @"All drug addicts are artists";
    answer30_3.is_correct = @NO;
    
    Answer *answer30_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer30_4.answer_text = @"Frustrated people are whimsical";
    answer30_4.is_correct = @NO;
    
    [question30 addAnswer:[NSSet setWithObjects:answer30_1, answer30_2, answer30_3, answer30_4, nil]];
    
#pragma mark - Question #31
    Question *question31 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question31.question_text = @"If A is the son of Q, Q and Y are sisters, Z is the mother of Y, P is the son of Z, then which of the following statements is correct?";
    
    Answer *answer31_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer31_1.answer_text = @"P is the maternal uncle of A";
    answer31_1.is_correct = @YES;
    
    Answer *answer31_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer31_2.answer_text = @"P and Y are sisters";
    answer31_2.is_correct = @NO;
    
    Answer *answer31_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer31_3.answer_text = @"A and P are cousins";
    answer31_3.is_correct = @NO;
    
    Answer *answer31_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer31_4.answer_text = @"None of the above";
    answer31_4.is_correct = @NO;
    
    [question31 addAnswer:[NSSet setWithObjects:answer31_1, answer31_2, answer31_3, answer31_4, nil]];
    
#pragma mark - Question #32
    Question *question32 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question32.question_text = @"Which is heavier, a ton of feathers or a ton of gold?";
    
    Answer *answer32_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer32_1.answer_text = @"A ton of feathers";
    answer32_1.is_correct = @NO;
    
    Answer *answer32_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer32_2.answer_text = @"A ton of gold";
    answer32_2.is_correct = @NO;
    
    Answer *answer32_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer32_3.answer_text = @"They are the same";
    answer32_3.is_correct = @YES;
    
    Answer *answer32_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer32_4.answer_text = @"None";
    answer32_4.is_correct = @NO;
    
    [question32 addAnswer:[NSSet setWithObjects:answer32_1, answer32_2, answer32_3, answer32_4, nil]];
    
#pragma mark - Question #33
    Question *question33 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question33.question_text = @"Which month has 28 days?";
    
    Answer *answer33_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer33_1.answer_text = @"February";
    answer33_1.is_correct = @NO;
    
    Answer *answer33_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer33_2.answer_text = @"January";
    answer33_2.is_correct = @NO;
    
    Answer *answer33_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer33_3.answer_text = @"December";
    answer33_3.is_correct = @NO;
    
    Answer *answer33_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer33_4.answer_text = @"All";
    answer33_4.is_correct = @YES;
    
    [question33 addAnswer:[NSSet setWithObjects:answer33_1, answer33_2, answer33_3, answer33_4, nil]];
    
#pragma mark - Question #34
    Question *question34 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question34.question_text = @"How many times can you subtract 10 from 100?";
    
    Answer *answer34_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer34_1.answer_text = @"10";
    answer34_1.is_correct = @NO;
    
    Answer *answer34_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer34_2.answer_text = @"5";
    answer34_2.is_correct = @NO;
    
    Answer *answer34_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer34_3.answer_text = @"2";
    answer34_3.is_correct = @NO;
    
    Answer *answer34_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer34_4.answer_text = @"1";
    answer34_4.is_correct = @YES;
    
    [question34 addAnswer:[NSSet setWithObjects:answer34_1, answer34_2, answer34_3, answer34_4, nil]];
    
#pragma mark - Question #35
    Question *question35 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question35.question_text = @"How many times can you subtract 10 from 100?";
    
    Answer *answer35_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer35_1.answer_text = @"10";
    answer35_1.is_correct = @NO;
    
    Answer *answer35_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer35_2.answer_text = @"5";
    answer35_2.is_correct = @NO;
    
    Answer *answer35_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer35_3.answer_text = @"2";
    answer35_3.is_correct = @NO;
    
    Answer *answer35_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer35_4.answer_text = @"1";
    answer35_4.is_correct = @YES;
    
    [question35 addAnswer:[NSSet setWithObjects:answer35_1, answer35_2, answer35_3, answer35_4, nil]];
    
#pragma mark - Question #36
    Question *question36 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question36.question_text = @"You throw away the outside and cook the inside. Then you eat the outside and throw away the inside. What did you eat?";
    
    Answer *answer36_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer36_1.answer_text = @"An egg";
    answer36_1.is_correct = @NO;
    
    Answer *answer36_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer36_2.answer_text = @"An artichoke";
    answer36_2.is_correct = @NO;
    
    Answer *answer36_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer36_3.answer_text = @"An ear of corn";
    answer36_3.is_correct = @YES;
    
    Answer *answer36_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer36_4.answer_text = @"An onion";
    answer36_4.is_correct = @NO;
    
    [question36 setAnswer:[NSSet setWithObjects:answer36_1, answer36_2, answer36_3, answer36_4, nil]];
    
#pragma mark - Question #37
    Question *question37 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question37.question_text = @"It goes in dry, it comes out wet, the longer it's in the stronger it gets. What is it?";
    
    Answer *answer37_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer37_1.answer_text = @"A swimmer";
    answer37_1.is_correct = @NO;
    
    Answer *answer37_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer37_2.answer_text = @"A tea bag";
    answer37_2.is_correct = @YES;
    
    Answer *answer37_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer37_3.answer_text = @"A soap bar";
    answer37_3.is_correct = @YES;
    
    Answer *answer37_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer37_4.answer_text = @"The Titanic";
    answer37_4.is_correct = @NO;
    
    [question37 setAnswer:[NSSet setWithObjects:answer37_1, answer37_2, answer37_3, answer37_4, nil]];
    
#pragma mark - Question #38
    Question *question38 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question38.question_text = @"There are 6 mangoes in a basket and 6 kids eagerly waiting to get one. Each kid is given 1 mango, yet there is one mango in the basket. How come?";
    
    Answer *answer38_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer38_1.answer_text = @"2 kids share 1 mango";
    answer38_1.is_correct = @NO;
    
    Answer *answer38_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer38_2.answer_text = @"One kid left";
    answer38_2.is_correct = @NO;
    
    Answer *answer38_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer38_3.answer_text = @"Last kid gets the basket with the mango in it";
    answer38_3.is_correct = @YES;
    
    Answer *answer38_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer38_4.answer_text = @"Not possible";
    answer38_4.is_correct = @NO;
    
    [question38 setAnswer:[NSSet setWithObjects:answer38_1, answer38_2, answer38_3, answer38_4, nil]];
    
#pragma mark - Question #39
    Question *question39 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question39.question_text = @"What happens only in the middle of each month, in all of the seasons, except summer and happens only in the night, never in the day?";
    
    Answer *answer39_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer39_1.answer_text = @"A change of seasons";
    answer39_1.is_correct = @NO;
    
    Answer *answer39_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer39_2.answer_text = @"The Northern Lights";
    answer39_2.is_correct = @NO;
    
    Answer *answer39_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer39_3.answer_text = @"A 5 week month";
    answer39_3.is_correct = @NO;
    
    Answer *answer39_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer39_4.answer_text = @"The letter 'n'";
    answer39_4.is_correct = @YES;
    
    [question39 setAnswer:[NSSet setWithObjects:answer39_1, answer39_2, answer39_3, answer39_4, nil]];
    
#pragma mark - Question #40
    Question *question40 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question40.question_text = @"What's in the middle of China?";
    
    Answer *answer40_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer40_1.answer_text = @"Beijing";
    answer40_1.is_correct = @NO;
    
    Answer *answer40_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer40_2.answer_text = @"The Great Wall";
    answer40_2.is_correct = @NO;
    
    Answer *answer40_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer40_3.answer_text = @"The Himalayas";
    answer40_3.is_correct = @NO;
    
    Answer *answer40_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer40_4.answer_text = @"The letter 'i'";
    answer40_4.is_correct = @YES;
    
    [question40 setAnswer:[NSSet setWithObjects:answer40_1, answer40_2, answer40_3, answer40_4, nil]];
    
#pragma mark - Question #41
    Question *question41 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question41.question_text = @"How many seconds are there in a year?";
    
    Answer *answer41_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer41_1.answer_text = @"31536000";
    answer41_1.is_correct = @NO;
    
    Answer *answer41_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer41_2.answer_text = @"365";
    answer41_2.is_correct = @NO;
    
    Answer *answer41_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer41_3.answer_text = @"12";
    answer41_3.is_correct = @YES;
    
    Answer *answer41_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer41_4.answer_text = @"None of the above";
    answer41_4.is_correct = @NO;
    
    [question41 setAnswer:[NSSet setWithObjects:answer41_1, answer41_2, answer41_3, answer41_4, nil]];
    
#pragma mark - Question #42
    Question *question42 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question42.question_text = @"If you were running a race and you passed the person in 2nd place, what place would you be in now?";
    
    Answer *answer42_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer42_1.answer_text = @"1st";
    answer42_1.is_correct = @NO;
    
    Answer *answer42_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer42_2.answer_text = @"2nd";
    answer42_2.is_correct = @YES;
    
    Answer *answer42_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer42_3.answer_text = @"3rd";
    answer42_3.is_correct = @NO;
    
    Answer *answer42_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer42_4.answer_text = @"None of the above";
    answer42_4.is_correct = @NO;
    
    [question42 setAnswer:[NSSet setWithObjects:answer42_1, answer42_2, answer42_3, answer42_4, nil]];
    
#pragma mark - Question #43
    Question *question43 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question43.question_text = @"When was it that Christmas and New Year were celebrated in the same year?";
    
    Answer *answer43_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer43_1.answer_text = @"Leap years";
    answer43_1.is_correct = @NO;
    
    Answer *answer43_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer43_2.answer_text = @"Year 2000";
    answer43_2.is_correct = @NO;
    
    Answer *answer43_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer43_3.answer_text = @"Every year";
    answer43_3.is_correct = @YES;
    
    Answer *answer43_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer43_4.answer_text = @"It's impossible";
    answer43_4.is_correct = @NO;
    
    [question43 setAnswer:[NSSet setWithObjects:answer43_1, answer43_2, answer43_3, answer43_4, nil]];
    
#pragma mark - Question #44
    Question *question44 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question44.question_text = @"20 pigeons sat on the branches of a tree. A man shot 1 pigeon with his gun. How many were left on the tree?";
    
    Answer *answer44_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer44_1.answer_text = @"19 pigeons";
    answer44_1.is_correct = @NO;
    
    Answer *answer44_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer44_2.answer_text = @"20, one is dead";
    answer44_2.is_correct = @NO;
    
    Answer *answer44_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer44_3.answer_text = @"None, the rest flew away";
    answer44_3.is_correct = @YES;
    
    Answer *answer44_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer44_4.answer_text = @"None of the above";
    answer44_4.is_correct = @NO;
    
    [question44 setAnswer:[NSSet setWithObjects:answer44_1, answer44_2, answer44_3, answer44_4, nil]];
    
#pragma mark - Question #45
    Question *question45 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question45.question_text = @"A clerk at a butcher shop stands five-feet ten-inches tall and wears size 13 sneakers. What does he weigh?";
    
    Answer *answer45_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer45_1.answer_text = @"180lbs";
    answer45_1.is_correct = @NO;
    
    Answer *answer45_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer45_2.answer_text = @"200lbs";
    answer45_2.is_correct = @NO;
    
    Answer *answer45_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer45_3.answer_text = @"220lbs";
    answer45_3.is_correct = @NO;
    
    Answer *answer45_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer45_4.answer_text = @"Meat";
    answer45_4.is_correct = @YES;
    
    [question45 setAnswer:[NSSet setWithObjects:answer45_1, answer45_2, answer45_3, answer45_4, nil]];
    
#pragma mark - Question #46
    Question *question46 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question46.question_text = @"Before Mt. Everest was discovered, which was the highest mountain in the world?";
    
    Answer *answer46_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer46_1.answer_text = @"Mt. St. Helens";
    answer46_1.is_correct = @NO;
    
    Answer *answer46_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer46_2.answer_text = @"Mt. Cotopaxi";
    answer46_2.is_correct = @NO;
    
    Answer *answer46_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer46_3.answer_text = @"Mt. Popocatépetl";
    answer46_3.is_correct = @NO;
    
    Answer *answer46_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer46_4.answer_text = @"Mt. Everest";
    answer46_4.is_correct = @YES;
    
    [question46 setAnswer:[NSSet setWithObjects:answer46_1, answer46_2, answer46_3, answer46_4, nil]];
    
#pragma mark - Question #47
    Question *question47 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question47.question_text = @"What can run but never walks, has a mouth but never talks, has a head but never weeps, and has a bed but never sleeps?";
    
    Answer *answer47_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer47_1.answer_text = @"A river";
    answer47_1.is_correct = @YES;
    
    Answer *answer47_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer47_2.answer_text = @"A clock";
    answer47_2.is_correct = @NO;
    
    Answer *answer47_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer47_3.answer_text = @"The wind";
    answer47_3.is_correct = @NO;
    
    Answer *answer47_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer47_4.answer_text = @"The sea";
    answer47_4.is_correct = @NO;
    
    [question47 setAnswer:[NSSet setWithObjects:answer47_1, answer47_2, answer47_3, answer47_4, nil]];
    
#pragma mark - Question #48
    Question *question48 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question48.question_text = @"Imagine you are in a sinking rowboat surrounded by sharks. How would you survive?";
    
    Answer *answer48_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer48_1.answer_text = @"Hitting sharks with the paddles";
    answer48_1.is_correct = @NO;
    
    Answer *answer48_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer48_2.answer_text = @"Riding the sharks";
    answer48_2.is_correct = @NO;
    
    Answer *answer48_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer48_3.answer_text = @"Trying to out-swim the sharks";
    answer48_3.is_correct = @NO;
    
    Answer *answer48_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer48_4.answer_text = @"Stop imagining";
    answer48_4.is_correct = @YES;
    
    [question48 setAnswer:[NSSet setWithObjects:answer48_1, answer48_2, answer48_3, answer48_4, nil]];
    
#pragma mark - Question #49
    Question *question49 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question49.question_text = @"Eskimos are very good hunters, but they never hunt penguins. Why not?";
    
    Answer *answer49_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer49_1.answer_text = @"Penguins are too dangerous";
    answer49_1.is_correct = @NO;
    
    Answer *answer49_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer49_2.answer_text = @"There are no penguins in the Arctic";
    answer49_2.is_correct = @YES;
    
    Answer *answer49_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer49_3.answer_text = @"Polar bears hunt all penguins";
    answer49_3.is_correct = @NO;
    
    Answer *answer49_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer49_4.answer_text = @"Eskimos are vegan";
    answer49_4.is_correct = @NO;
    
    [question49 setAnswer:[NSSet setWithObjects:answer49_1, answer49_2, answer49_3, answer49_4, nil]];
    
#pragma mark - Question #50
    Question *question50 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question50.question_text = @"What demands an answer but asks no question?";
    
    Answer *answer50_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer50_1.answer_text = @"A wife";
    answer50_1.is_correct = @NO;
    
    Answer *answer50_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer50_2.answer_text = @"A letter";
    answer50_2.is_correct = @NO;
    
    Answer *answer50_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer50_3.answer_text = @"A mother-in-law";
    answer50_3.is_correct = @NO;
    
    Answer *answer50_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer50_4.answer_text = @"A telephone";
    answer50_4.is_correct = @YES;
    
    [question50 setAnswer:[NSSet setWithObjects:answer50_1, answer50_2, answer50_3, answer50_4, nil]];
    
    // Save context after all questions and answers are set
    [self saveContext];
    
    NSLog(@"Data setup complete.");
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.mok3yb0ts.Smart_Chimp" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Smart_Chimp" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Smart_Chimp.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
