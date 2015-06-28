//
//  CameraViewController.h
//  Ribbit
//
//  Created by George Tsaousidis on 25/6/15.
//  Copyright (c) 2015 DFG-Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface CameraViewController : UITableViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(nonatomic, strong) UIImagePickerController *imagePicker;
@property(nonatomic, strong) NSString *videoFilePath;

@property(nonatomic,strong) UIImage *image;

@property (nonatomic, strong) PFRelation *friendsRelation;
@property(nonatomic, strong) NSArray *friends;
@property(nonatomic,strong) NSMutableArray *recipients;

- (IBAction)cancelMessage:(id)sender;

- (IBAction)sendMessage:(id)sender;

-(void)uploadMessage;

-(UIImage *)resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height;

@end
