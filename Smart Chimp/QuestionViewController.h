//
//  QuestionViewController.h
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/20/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioManager.h"

@interface QuestionViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *correctLabel;
@property (weak, nonatomic) IBOutlet UILabel *bananaLabel;
@property (weak, nonatomic) IBOutlet UITextView *questionTextView;
@property (weak, nonatomic) IBOutlet UIButton *answer1Button;
@property (weak, nonatomic) IBOutlet UIButton *answer2Button;
@property (weak, nonatomic) IBOutlet UIButton *answer3Button;
@property (weak, nonatomic) IBOutlet UIButton *answer4Button;
@property (weak, nonatomic) IBOutlet UIView *winLoseView;
@property (weak, nonatomic) IBOutlet UIImageView *winLoseImageView;
@property (weak, nonatomic) IBOutlet UIImageView *bananaPeelImageView;
@property (weak, nonatomic) IBOutlet UILabel *winLoseLabel;

@property (strong, nonatomic) AudioManager *audioManager;
@property (strong, nonatomic) NSArray *questionsForGame;
@property (strong, nonatomic) NSArray *answers;
@property (nonatomic) int currentQuestion;
@property (nonatomic) int correctQuestions;
@property (nonatomic) int bananasEarned;
@property (weak, nonatomic) id delegate;

- (IBAction)dismissAction:(id)sender;
- (IBAction)mainMenuAction:(id)sender;
- (IBAction)answer1Action:(id)sender;
- (IBAction)answer2Action:(id)sender;
- (IBAction)answer3Action:(id)sender;
- (IBAction)answer4Action:(id)sender;

@end
