//
//  HighScore.h
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/24/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface HighScore : NSManagedObject

@property (nonatomic, retain) NSNumber * score;
@property (nonatomic, retain) NSDate * date_achieved;
@property (nonatomic, retain) NSNumber * highscore_id;

@end
