//
//  picViewController.m
//  Picture Palette
//
//  Created by Unbounded on 11/11/13.
//  Copyright (c) 2013 BWS. All rights reserved.
//

#import "picViewController.h"
#import "filterViewController.h"

@interface picViewController ()

@end

@implementation picViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.currentImage = [[UIImage alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhotoBtn:(UIButton *)sender {
    /* This code allows the user to take a picture using their phone's camera. Unfortuately, this will cause the simulator to crash while it would not crash the app if it were running on a device.
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
	[self.navigationController presentViewController:picker animated:YES completion:nil];
     */
}

//Presents the image album picker
- (IBAction)choosePhotoBtn:(UIButton *)sender {
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
	picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
	[self.navigationController presentViewController:picker animated:YES completion:nil];
}

//this method is called when an image is chosen in the album picker.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //dismiss the picker view
	[picker dismissViewControllerAnimated:YES completion:nil];

    //save the image and seque to the filter view
    self.currentImage = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [self performSegueWithIdentifier:@"filter" sender:self];
}

//copy the image to the filter view before segue
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    filterViewController *destController = segue.destinationViewController;
    destController.currentImage = self.currentImage;
}
@end
