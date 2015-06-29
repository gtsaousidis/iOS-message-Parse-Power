//
//  ImageViewController.h
//  Ribbit
//
//  Created by George Tsaousidis on 29/6/15.
//  Copyright (c) 2015 DFG-Team. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ImageViewController : UIViewController

@property(nonatomic,strong) PFObject *message;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
