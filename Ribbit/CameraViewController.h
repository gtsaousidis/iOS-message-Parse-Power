//
//  CameraViewController.h
//  Ribbit
//
//  Created by George Tsaousidis on 25/6/15.
//  Copyright (c) 2015 DFG-Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UITableViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property(nonatomic, strong) UIImagePickerController *imagePicker;
@property(nonatomic, strong) NSString *videoFilePath;

@property(nonatomic,strong) UIImage *image;

@end
