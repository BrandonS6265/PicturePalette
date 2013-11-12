//
//  shareViewController.m
//  Picture Palette
//
//  Created by Unbounded on 11/11/13.
//  Copyright (c) 2013 BWS. All rights reserved.
//

#import "shareViewController.h"

@interface shareViewController ()

@end

@implementation shareViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.imageView.image = self.finalImage;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareImage:(UIButton *)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        //Device is able to send facebook messages
        SLComposeViewController *composeController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        [composeController addImage:self.finalImage];
        
        [self presentViewController:composeController animated:YES completion:nil];
    } else{
        UIAlertView *connectionAlert = [[UIAlertView alloc]initWithTitle:@"Sharing Unavailable" message:@"Please go to your iPhone settings and log in to your Facebook account" delegate:self cancelButtonTitle:Nil otherButtonTitles:@"ok", nil];
        [connectionAlert show];
    }

}
@end
