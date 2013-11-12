//
//  filterViewController.h
//  Picture Palette
//
//  Created by Unbounded on 11/11/13.
//  Copyright (c) 2013 BWS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface filterViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UIImage *currentImage;
@property (strong, nonatomic) IBOutlet UIImage *finalImage;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NSArray *filterArray;

@end
