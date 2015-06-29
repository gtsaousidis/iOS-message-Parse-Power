//
//  InboxViewController.h
//  Ribbit
//
//  Created by George Tsaousidis on 7/6/15.
//  Copyright (c) 2015 DFG-Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface InboxViewController : UITableViewController

@property(nonatomic, strong)  NSArray *messages;
@property(nonatomic, strong) PFObject *selectedMessage;

- (IBAction)logout:(id)sender;

@end
