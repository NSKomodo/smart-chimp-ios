//
//  QuestionViewController.m
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/20/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "QuestionViewController.h"
#import "AppDelegate.h"
#import "Question+QuestionExtensions.h"
#import "Answer.h"
#import "HighScore.h"

@implementation QuestionViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.questionTextView addObserver:self forKeyPath:@"contentSize" options:(NSKeyValueObservingOptionNew) context:NULL];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.questionTextView removeObserver:self forKeyPath:@"contentSize"];
    [self.audioManager.audioPlayer stop];
    self.audioManager = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.questionsForGame = [Question randomQuestions];
    
    self.audioManager = [[AudioManager alloc] initWithFile:@"bkgdGame" ofType:@"mp3"];
    [self.audioManager tryPlayMusic];
    
    self.currentQuestion = 0;
    self.correctQuestions = 0;
    self.bananasEarned = 0;
    
    [self.questionTextView flashScrollIndicators];
    
    [self loadQuestion:[self.questionsForGame objectAtIndex:self.currentQuestion]];
}

- (void)loadQuestion:(Question *)question {
    self.answers = [Question answersForQuestion:[self.questionsForGame objectAtIndex:self.currentQuestion]];
    
    NSString *questionText = [NSString stringWithFormat:@"QUESTION #%d:\n%@", (self.currentQuestion + 1), question.question_text];
    [self.questionTextView setText:questionText];
    
    Answer *answer1 = [self.answers objectAtIndex:0];
    Answer *answer2 = [self.answers objectAtIndex:1];
    Answer *answer3 = [self.answers objectAtIndex:2];
    Answer *answer4 = [self.answers objectAtIndex:3];
    
    [self.answer1Button setTitle:answer1.answer_text forState:UIControlStateNormal];
    [self.answer1Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.answer2Button setTitle:answer2.answer_text forState:UIControlStateNormal];
    [self.answer2Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.answer3Button setTitle:answer3.answer_text forState:UIControlStateNormal];
    [self.answer3Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.answer4Button setTitle:answer4.answer_text forState:UIControlStateNormal];
    [self.answer4Button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.view setUserInteractionEnabled:YES];
}

- (void)updateCorrectText {
    [self.correctLabel setText:[NSString stringWithFormat:@"%d/10 Correct", self.correctQuestions]];
}

- (void)updateBananasEarned {
    [self.bananaLabel setText:[NSString stringWithFormat:@"x%d", self.bananasEarned]];
}

- (void)correctQuestionFromSender:(id) sender {
    UIButton *buttonPressed = sender;
    [buttonPressed setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    for (int i = 0; i < self.answers.count; i++) {
        Answer *answer = [self.answers objectAtIndex:i];
        if ([answer.is_correct boolValue]) {
            switch (i) {
                case 0:
                    [self.answer1Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                    break;
                    
                case 1:
                    [self.answer2Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                    break;
                    
                case 2:
                    [self.answer3Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                    break;
                    
                case 3:
                    [self.answer4Button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
                    break;
                    
                default:
                    break;
            }
        }
    }
    
    [self.view setUserInteractionEnabled:NO];
}

- (void)processAnswer:(Answer *)answer fromSender:(id)sender {
    if ([answer.is_correct boolValue]) {
        ++self.currentQuestion;
        ++self.correctQuestions;
        self.bananasEarned += 10;
        
        [self.audioManager playCorrectSound];
        
        [self updateCorrectText];
        [self updateBananasEarned];
        
        if (self.currentQuestion < 10) {
            [self loadQuestion:[self.questionsForGame objectAtIndex:self.currentQuestion]];
        } else {
            if (self.correctQuestions >= 7) {
                [self performSelector:@selector(showGameOverScreenForResult:) withObject:@YES afterDelay:3];
            } else {
                [self performSelector:@selector(showGameOverScreenForResult:) withObject:nil afterDelay:3];
            }
        }
    } else {
        ++self.currentQuestion;
        [self correctQuestionFromSender:sender];
        
        [self.audioManager playButtonSound];
        
        if (self.currentQuestion < 10) {
            [self performSelector:@selector(loadQuestion:) withObject:[self.questionsForGame objectAtIndex:self.currentQuestion] afterDelay:3];
        } else {
            if (self.correctQuestions >= 7) {
                [self performSelector:@selector(showGameOverScreenForResult:) withObject:@YES afterDelay:3];
            } else {
                [self performSelector:@selector(showGameOverScreenForResult:) withObject:nil afterDelay:3];
            }
        }
    }
    
    if (self.currentQuestion > 9) {
        if (self.bananasEarned > 0) {
            AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
            
            HighScore *highScore = [NSEntityDescription insertNewObjectForEntityForName:@"HighScore" inManagedObjectContext:[appDelegate managedObjectContext]];
            highScore.score = [NSNumber numberWithInt:self.bananasEarned];
            highScore.date_achieved = [NSDate date];
            
            [appDelegate saveContext];
        }
    }
}

- (void)showGameOverScreenForResult:(id)won {
    [self.view setUserInteractionEnabled:YES];
    
    if (won) {
        [self.winLoseImageView setImage:[UIImage imageNamed:@"WinBG"]];
        [self.winLoseLabel setText:@"CONGRATULATIONS\nYou win"];
        [self.bananaPeelImageView setAlpha:0.0];
        [self.winLoseView setHidden:NO];
    } else {
        [self.winLoseImageView setImage:[UIImage imageNamed:@"LoseBG"]];
        [self.winLoseLabel setText:@"YOU LOST!\nBetter luck next time"];
        [self.bananaPeelImageView setHidden:NO];
        [self.winLoseView setHidden:NO];
    }
}

#pragma mark - Actions

- (IBAction)dismissAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)mainMenuAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)answer1Action:(id)sender {
    Answer *answer1 = [self.answers objectAtIndex:0];
    [self processAnswer:answer1 fromSender:sender];
}

- (IBAction)answer2Action:(id)sender {
    Answer *answer2 = [self.answers objectAtIndex:1];
    [self processAnswer:answer2 fromSender:sender];
}

- (IBAction)answer3Action:(id)sender {
    Answer *answer3 = [self.answers objectAtIndex:2];
    [self processAnswer:answer3 fromSender:sender];
}

- (IBAction)answer4Action:(id)sender {
    Answer *answer4 = [self.answers objectAtIndex:3];
    [self processAnswer:answer4 fromSender:sender];
}

#pragma mark - Key-value observing

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    UITextView *textView = object;
    CGFloat topCorrect = ([textView bounds].size.height - [textView contentSize].height * [textView zoomScale]) / 2.0;
    topCorrect = (topCorrect < 0.0 ? 0.0 : topCorrect );
    textView.contentOffset = (CGPoint){ .x = 0, .y = -topCorrect };
}

@end
