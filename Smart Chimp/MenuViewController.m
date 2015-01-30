//
//  MenuViewController.m
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/17/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import "MenuViewController.h"
#import "QuestionViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.audioManager) {
        [self.audioManager.audioPlayer play];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.audioManager = [[AudioManager alloc] initWithFile:@"bkgdWelcome" ofType:@"mp3"];
    [self.audioManager tryPlayMusic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)facebookAction:(id)sender {
    SLComposeViewController *fbController=[SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewControllerCompletionHandler __block completionHandler = ^(SLComposeViewControllerResult result) {
            [fbController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                    NSLog(@"Cancelled.....");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Posted....");
                    break;
            }
        };
        
        //[fbController addImage:[UIImage imageNamed:@"1.jpg"]];
        [fbController setInitialText:@"Testing my Critical Thinking skills with Smart Chimp, by The Monk3yb0ts. Available on the App Store!"];
        [fbController addURL:[NSURL URLWithString:@"http://facebook.com"]];
        [fbController setCompletionHandler:completionHandler];
        
        [self presentViewController:fbController animated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Smart Chimp" message:@"You are not signed in with Facebook. Please go to the Settings app > Facebook and sign in with your account." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (IBAction)twitterAction:(id)sender {
    SLComposeViewController *twitterController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
        SLComposeViewControllerCompletionHandler __block completionHandler = ^(SLComposeViewControllerResult result) {
            [twitterController dismissViewControllerAnimated:YES completion:nil];
            
            switch(result){
                case SLComposeViewControllerResultCancelled:
                default:
                    NSLog(@"Cancelled.....");
                    break;
                case SLComposeViewControllerResultDone:
                    NSLog(@"Posted....");
                    break;
            }
        };
        
        // [twitterController addImage:[UIImage imageNamed:@"1.jpg"]];
        [twitterController setInitialText:@"Testing my #CriticalThinking skills with #SmartChimp, by @TheMonk3yb0ts. Available on the App Store!"];
        [twitterController addURL:[NSURL URLWithString:@"http://twitter.com"]];
        [twitterController setCompletionHandler:completionHandler];
        
        [self presentViewController:twitterController animated:YES completion:nil];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Smart Chimp" message:@"You are not signed in with Twitter. Please go to the Settings app > Twitter and sign in with your account." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil, nil];
        [alert show];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"gameSegue"]) {
        QuestionViewController *questionViewController = (QuestionViewController *)segue.destinationViewController;
        questionViewController.delegate = self;
        
        if (self.audioManager) {
            [self.audioManager.audioPlayer pause];
        }
    }
}

@end
