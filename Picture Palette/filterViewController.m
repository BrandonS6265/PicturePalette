//
//  filterViewController.m
//  Picture Palette
//
//  Created by Unbounded on 11/11/13.
//  Copyright (c) 2013 BWS. All rights reserved.
//

#import "filterViewController.h"
#import "shareViewController.h"

@interface filterViewController ()

@end

@implementation filterViewController

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
    self.filterArray = [[NSArray alloc]initWithObjects:@"Sepia", @"Black & White", @"Bloom", @"Vibrance", @"Pixellate", nil];
    self.imageView.image = self.currentImage;
    self.finalImage = [[UIImage alloc]init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.filterArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    
    cell.textLabel.text = [self.filterArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //performs a different filter depending on the cell pressed
    //Sepia
    if (indexPath.row == 0) {
        CIImage *beginImage = [[CIImage alloc]initWithImage:self.currentImage];
        CIContext *context = [CIContext contextWithOptions:nil];
        
        CIFilter *filter = [CIFilter filterWithName:@"CISepiaTone"
                                      keysAndValues: kCIInputImageKey, beginImage,
                            @"inputIntensity", [NSNumber numberWithFloat:0.8], nil];
        CIImage *outputImage = [filter outputImage];
        
        CGImageRef cgimg =
        [context createCGImage:outputImage fromRect:[outputImage extent]];
        UIImage *newImg = [UIImage imageWithCGImage:cgimg];
        
        self.finalImage = newImg;
        
        CGImageRelease(cgimg);
    }
    //Black & White
    if (indexPath.row == 1) {
        CIImage *beginImage = [[CIImage alloc]initWithImage:self.currentImage];
        
        CIImage *blackAndWhite = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputImageKey, beginImage, @"inputBrightness", [NSNumber numberWithFloat:0.0], @"inputContrast", [NSNumber numberWithFloat:1.1], @"inputSaturation", [NSNumber numberWithFloat:0.0], nil].outputImage;
        CIImage *output = [CIFilter filterWithName:@"CIExposureAdjust" keysAndValues:kCIInputImageKey, blackAndWhite, @"inputEV", [NSNumber numberWithFloat:0.7], nil].outputImage;
        
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef cgiimage = [context createCGImage:output fromRect:output.extent];
        UIImage *newImage = [UIImage imageWithCGImage:cgiimage];
        
        self.finalImage = newImage;
        
        CGImageRelease(cgiimage);
    }
    //Bloom
    if (indexPath.row == 2) {
        CIImage *beginImage = [[CIImage alloc]initWithImage:self.currentImage];
        CIContext *context = [CIContext contextWithOptions:nil];
        
        CIFilter *filter = [CIFilter filterWithName:@"CIBloom" keysAndValues: kCIInputImageKey, beginImage, nil, nil];
        CIImage *outputImage = [filter outputImage];
        
        CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
        UIImage *newImg = [UIImage imageWithCGImage:cgimg];
        
        self.finalImage = newImg;
        
        CGImageRelease(cgimg);
    }
    //Vibrance
    if (indexPath.row == 3) {
        CIImage *beginImage = [[CIImage alloc]initWithImage:self.currentImage];
        CIContext *context = [CIContext contextWithOptions:nil];
        
        CIFilter *filter = [CIFilter filterWithName:@"CIVibrance" keysAndValues: kCIInputImageKey, beginImage, nil, nil];
        CIImage *outputImage = [filter outputImage];
        
        CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
        UIImage *newImg = [UIImage imageWithCGImage:cgimg];
        
        self.finalImage = newImg;
        
        CGImageRelease(cgimg);
    }
    //Pixellate
    if (indexPath.row == 4) {
        CIImage *beginImage = [[CIImage alloc]initWithImage:self.currentImage];
        CIContext *context = [CIContext contextWithOptions:nil];
        
        CIFilter *filter = [CIFilter filterWithName:@"CIPixellate" keysAndValues: kCIInputImageKey, beginImage, nil, nil];
        CIImage *outputImage = [filter outputImage];
        
        CGImageRef cgimg = [context createCGImage:outputImage fromRect:[outputImage extent]];
        UIImage *newImg = [UIImage imageWithCGImage:cgimg];
        
        self.finalImage = newImg;
        
        CGImageRelease(cgimg);
    }
    
    //initiate the segue
    [self performSegueWithIdentifier:@"performFilter" sender:self];
}

//ensures the filtered image is passed to the final view
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    shareViewController *destController = segue.destinationViewController;
    destController.finalImage = self.finalImage;
}
@end
