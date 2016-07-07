//
//  ViewController.h
//  NewsFeedCodeTest
//
//  Created by Lycodes_Dong on 7/7/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNewsFeedTableView.h"
#import "DongFramework.h"

@interface ViewController : UIViewController<CustomNewsFeedTableViewDataSoure>

@property (strong, nonatomic) CustomNewsFeedTableView *myCustomNewsFeedTableView;
@property (strong, nonatomic) NSArray *arrayProfilePictureUrl,*arrayName,*arrayTime,*arrayStatus,*arrayImageUrl;
@property (strong, nonatomic) NSMutableArray *arrayProfilePicture,*arrayImage;

@end

