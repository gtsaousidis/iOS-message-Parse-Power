//
//  EditFriendTableViewController.h
//  Ribbit
//
//  Created by George Tsaousidis on 8/6/15.
//  Copyright (c) 2015 DFG-Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendTableViewController : UITableViewController

@property(nonatomic, strong) NSArray *allUsers;
@property(nonatomic, strong) PFUser *currentUser;
@property(nonatomic,strong) NSMutableArray *friends;

- (BOOL)isFriend:(PFUser *)user;

@end
