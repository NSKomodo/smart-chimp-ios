//
//  HighScoreViewController.h
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/22/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighScoreTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *highScores;

- (IBAction)backAction:(id)sender;
- (IBAction)resetAction:(id)sender;

@end
