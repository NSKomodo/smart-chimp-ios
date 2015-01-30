//
//  Question.h
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/24/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Answer;

@interface Question : NSManagedObject

@property (nonatomic, retain) NSNumber * question_id;
@property (nonatomic, retain) NSString * question_text;
@property (nonatomic, retain) NSSet *answer;
@end

@interface Question (CoreDataGeneratedAccessors)

- (void)addAnswerObject:(Answer *)value;
- (void)removeAnswerObject:(Answer *)value;
- (void)addAnswer:(NSSet *)values;
- (void)removeAnswer:(NSSet *)values;

@end
