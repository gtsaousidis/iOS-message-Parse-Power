//
//  SignupViewController.h
//  Ribbit
//
//  Created by George Tsaousidis on 7/6/15.
//  Copyright (c) 2015 DFG-Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

- (IBAction)signup:(id)sender;

@end
