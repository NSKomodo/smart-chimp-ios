//
//  MenuViewController.h
//  Smart Chimp
//
//  Created by Jorge Tapia on 1/17/15.
//  Copyright (c) 2015 The Monk3yb0ts. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "AudioManager.h"

@interface MenuViewController : UIViewController

@property (strong, nonatomic) AudioManager *audioManager;

- (IBAction)facebookAction:(id)sender;
- (IBAction)twitterAction:(id)sender;

@end

