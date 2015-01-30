//
//  HighScore+HighScoreExtensions.m
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/26/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "HighScore+HighScoreExtensions.h"
#import "AppDelegate.h"

@implementation HighScore (HighScoreExtensions)

+ (NSArray *)allHighScores {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"HighScore" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:NO];
    [fetchRequest setSortDescriptors:@[sortDescriptor]];
    
    NSError *error;
    NSArray *highScores = [context executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return highScores;
}

+ (void)removeAll {
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSError *error;
    NSArray *items = [self allHighScores];
    
    if (error) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    for (HighScore *highScore in items) {
        [context deleteObject:highScore];
    }
    
    [appDelegate saveContext];
}

@end
