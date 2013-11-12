//
//  shareViewController.h
//  Picture Palette
//
//  Created by Unbounded on 11/11/13.
//  Copyright (c) 2013 BWS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>

@interface shareViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIImage *finalImage;

- (IBAction)shareImage:(UIButton *)sender;
@end
