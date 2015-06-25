//
//  LoginViewController.m
//  Ribbit
//
//  Created by George Tsaousidis on 7/6/15.
//  Copyright (c) 2015 DFG-Team. All rights reserved.
//

#import "LoginViewController.h"
#import <Parse/Parse.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setHidesBackButton:YES];
}

- (IBAction)login:(id)sender {
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if([username length] == 0 || [password length] == 0 ){
    
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Some of the field you enter is wrong. Please try again!" delegate:nil cancelButtonTitle:@"Ok!" otherButtonTitles:nil];
        
        [alertView show];
        
    }
    else{
       
    
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error){
         
            if(error){
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Sorry!" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alertView show];
            }
            else{
                
                [self.navigationController popToRootViewControllerAnimated:YES];
                
            }

                
        }];
        
    }
    
}
@end
