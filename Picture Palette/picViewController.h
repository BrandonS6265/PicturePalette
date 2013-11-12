//
//  picViewController.h
//  Picture Palette
//
//  Created by Unbounded on 11/11/13.
//  Copyright (c) 2013 BWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface picViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) UIImage *currentImage;

- (IBAction)takePhotoBtn:(UIButton *)sender;
- (IBAction)choosePhotoBtn:(UIButton *)sender;
@end
