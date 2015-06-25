//
//  EditFriendTableViewController.m
//  Ribbit
//
//  Created by George Tsaousidis on 8/6/15.
//  Copyright (c) 2015 DFG-Team. All rights reserved.
//

#import "EditFriendTableViewController.h"


@interface EditFriendTableViewController ()

@end

@implementation EditFriendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *query = [PFUser query];
  
    
    [query orderByAscending:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
        
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else{
        
            self.allUsers = objects;
            
            [self.tableView reloadData];
        
        }
    }];

    self.currentUser = [PFUser currentUser];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.allUsers count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    cell.textLabel.text = user.username;
    
    if ([self isFriend:user]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - Table view delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
    
     PFRelation *friendsRelation = [self.currentUser relationForKey:@"friendsRelation"];
    
    if ([self isFriend:user]) {
        
        //1. remove the checkmark
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        
        //2.remove for the array of friends
        
        for(PFUser *friend in self.friends){
            if ([friend.objectId isEqualToString:user.objectId]) {
                [self.friends removeObject:friend];
                
                break;
            }
        }
        
        //3. remove for the backend
       
         PFUser *user = [self.allUsers objectAtIndex:indexPath.row];
         [friendsRelation removeObject:user];
        
    }
    else{
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.friends addObject:user];
        [friendsRelation addObject:user];
        
    }
    [self.currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
        
        if (error) {
            NSLog(@"Error %@ %@", error, [error userInfo]);
        }
        
    }];
   
}

#pragma mark - Helper Methods

-(BOOL)isFriend:(PFUser *)user{

    for(PFUser *friend in self.friends){
        
        if ([friend.objectId isEqualToString:user.objectId]) {
            return YES;
        }
    
    }
    
    return NO;

}

@end
