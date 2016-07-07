//
//  ViewController.m
//  NewsFeedCodeTest
//
//  Created by Lycodes_Dong on 7/7/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIActivityIndicatorView *myActivityIndicatorView;

@end

@implementation ViewController

#pragma mark UIView Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayProfilePicture = [[NSMutableArray alloc]init];
    self.arrayImage = [[NSMutableArray alloc]init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.myActivityIndicatorView = [DongFramework createCustomActivityIndicatorView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [self.view addSubview:self.myActivityIndicatorView];
    
    [self.myActivityIndicatorView startAnimating];
    
    NSURL *url = [NSURL URLWithString:@"http://api.androidhive.info/feed/feed.json"];
    
    [DongFramework getJsonWithURL:url Target:self Action:@selector(getJsonFinished:) Name:@"GetJson"];

}

#pragma mark Get Json Finished

- (void)getJsonFinished:(NSNotification *)notification {
    
    NSArray *arrayJson = (NSArray *)[notification object];
    
    NSArray *arrayFeed = [arrayJson valueForKey:@"feed"];
    
    if ([arrayFeed count] > 0) {
        
        self.arrayProfilePictureUrl = [arrayFeed valueForKey:@"profilePic"];
        self.arrayName = [arrayFeed valueForKey:@"name"];
        self.arrayTime = [arrayFeed valueForKey:@"timeStamp"];
        self.arrayStatus = [arrayFeed valueForKey:@"status"];
        self.arrayImageUrl = [arrayFeed valueForKey:@"image"];
        
    }
    
    [self getImage];
    
}

#pragma mark Get Image

- (void)getImage {
    
    NSURL *url;
    
    NSString *urlString;
    
    UIImage *image;
    
    for (int i = 0; i < [self.arrayProfilePictureUrl count]; i++) {
        
        urlString = [NSString stringWithFormat:@"%@",[self.arrayProfilePictureUrl objectAtIndex:i]];
        
        if (![urlString isEqualToString:@"<null>"]) {
            
            url = [NSURL URLWithString:urlString];
            
            image = [DongFramework getImageWithURL:url];
            
            [self.arrayProfilePicture addObject:image];
            
        }else {
            
            [self.arrayProfilePicture addObject:@""];
            
        }
        
        urlString = [NSString stringWithFormat:@"%@",[self.arrayImageUrl objectAtIndex:i]];
        
        if (![urlString isEqualToString:@"<null>"]) {
            
            url = [NSURL URLWithString:urlString];
            
            image = [DongFramework getImageWithURL:url];
            
            [self.arrayImage addObject:image];
            
        }else {
            
            [self.arrayImage addObject:@""];
            
        }
        
    }
    
    if ([self.arrayProfilePicture count] == [self.arrayProfilePictureUrl count]) {
        
        if ([self.arrayImage count] == [self.arrayImageUrl count]) {
            
            [self.myActivityIndicatorView stopAnimating];
            
            for (UIView *view in self.view.subviews) {
                
                if (view == self.myActivityIndicatorView) {
                    
                    [view removeFromSuperview];
                    
                }
                
            }
            
            self.myActivityIndicatorView = nil;
            
            [self createMyTableView];
            
        }
        
    }
    
}

#pragma mark Create MyTableView

- (void)createMyTableView {
    
    CGFloat appStatusHeight = [DongFramework getStatusHeight];
    
    self.myCustomNewsFeedTableView = [[CustomNewsFeedTableView alloc]init];
    self.myCustomNewsFeedTableView.dataSource = self;
    
    UITableView *myTableView = [self.myCustomNewsFeedTableView getNewsFeedTableViewWithCGRect:CGRectMake(0, appStatusHeight, self.view.bounds.size.width, self.view.bounds.size.height - appStatusHeight)];
    
    [self.view addSubview:myTableView];

}

#pragma mark CustomNewsFeedTableViewDataSoure

- (NSArray *)newsFeedArrayProfilePicture:(CustomNewsFeedTableView *)newsfeedtableview {

    NSArray *array;
    
    if (newsfeedtableview == self.myCustomNewsFeedTableView) {
        array = [self.arrayProfilePicture copy];
    }
    
    return array;

}

- (NSArray *)newsFeedArrayName:(CustomNewsFeedTableView *)newsfeedtableview {

    NSArray *array;
    
    if (newsfeedtableview == self.myCustomNewsFeedTableView) {
        array = self.arrayName;
    }
    
    return array;

}

- (NSArray *)newsFeedArrayTime:(CustomNewsFeedTableView *)newsfeedtableview {
    
    NSArray *array;
    
    if (newsfeedtableview == self.myCustomNewsFeedTableView) {
        array = self.arrayTime;
    }
    
    return array;
    
}

- (NSArray *)newsFeedArrayStatus:(CustomNewsFeedTableView *)newsfeedtableview {
    
    NSArray *array;
    
    if (newsfeedtableview == self.myCustomNewsFeedTableView) {
        array = self.arrayStatus;
    }
    
    return array;
}

- (NSArray *)newsFeedArrayImage:(CustomNewsFeedTableView *)newsfeedtableview {
    
    NSArray *array;
    
    if (newsfeedtableview == self.myCustomNewsFeedTableView) {
        array = [self.arrayImage copy];
    }
    
    return array;

}

#pragma mark Receive Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
