//
//  HighScoreViewController.m
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/22/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "HighScoreTableViewController.h"
#import "HighScore+HighScoreExtensions.h"

@implementation HighScoreTableViewController

- (void)viewDidLoad {
    self.highScores = [HighScore allHighScores];
    [self.tableView reloadData];
}

#pragma mark - Actions

- (IBAction)backAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)resetAction:(id)sender {
    [HighScore removeAll];
    self.highScores = nil;
    
    [self.tableView reloadData];
}

#pragma mark - Cell configuration

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    HighScore *highScore = [self.highScores objectAtIndex:indexPath.row];
    
    UILabel *scoreLabel = (UILabel *) [cell viewWithTag:1];
    NSString *score = [NSString stringWithFormat:@"x%@", highScore.score];
    [scoreLabel setText:score];
    
    UILabel *dateLabel = (UILabel *) [cell viewWithTag:2];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"E, dd/MM/y"];
    NSString *formattedDate = [dateFormatter stringFromDate:highScore.date_achieved];
    
    [dateLabel setText:formattedDate];
    
}

#pragma mark - Table data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.highScores count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HighScoreCell"];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

@end
