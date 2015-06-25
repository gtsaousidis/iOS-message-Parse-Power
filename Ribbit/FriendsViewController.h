//
//  FriendsViewController.h
//  Ribbit
//
//  Created by George Tsaousidis on 25/6/15.
//  Copyright (c) 2015 DFG-Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FriendsViewController : UITableViewController

@property (nonatomic, strong) PFRelation *friendsRelation;
@property(nonatomic, strong) NSArray *friends;

@end
