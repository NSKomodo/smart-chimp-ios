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
    
    // Question #1
    Question *question1 = [NSEntityDescription insertNewObjectForEntityForName:@"Question" inManagedObjectContext:context];
    question1.question_text = @"Critical Thinking is ________";
    
    Answer *answer1_1 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer1_1.answer_text = @"A process doctors use to determine diseases";
    answer1_1.is_correct = @NO;
    
    Answer *answer1_2 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer1_2.answer_text = @"Study of clear, reasoned thinking";
    answer1_2.is_correct = @YES;
    
    Answer *answer1_3 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer1_3.answer_text = @"Mashing of ideas that produce clear thoughts";
    answer1_3.is_correct = @NO;
    
    Answer *answer1_4 = [NSEntityDescription insertNewObjectForEntityForName:@"Answer" inManagedObjectContext:[self managedObjectContext]];
    answer1_4.answer_text = @"Thought process that leads to clear ideas";
    answer1_4.is_correct = @NO;
    
    [question1 addAnswer:[NSSet setWithObjects:answer1_1, answer1_2, answer1_3, answer1_4, nil]];
    
    // Question #2
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
    
    // Question #3
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
    
    // Question #4
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
    
    // Question #5
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
    
    // Question #6
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
    
    // Question #7
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
    
    // Question #8
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
    
    // Question #9
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
    
    // Question #10
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
    
    // Save context after all questions and answers are set
    [self saveContext];
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
