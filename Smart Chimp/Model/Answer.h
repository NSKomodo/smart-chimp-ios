//
//  Answer.h
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/24/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

@interface Answer : NSManagedObject

@property (nonatomic, retain) NSString * answer_text;
@property (nonatomic, retain) NSNumber * is_correct;
@property (nonatomic, retain) NSNumber * answer_id;
@property (nonatomic, retain) Question *question;

@end
