//
//  CustomNewsFeedTableView.h
//  NewsFeedCodeTest
//
//  Created by Lycodes_Dong on 7/7/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DongFramework.h"

@class CustomNewsFeedTableView;

@protocol CustomNewsFeedTableViewDataSoure <NSObject>

- (NSArray *)newsFeedArrayProfilePicture:(CustomNewsFeedTableView *)newsfeedtableview;
- (NSArray *)newsFeedArrayName:(CustomNewsFeedTableView *)newsfeedtableview;
- (NSArray *)newsFeedArrayTime:(CustomNewsFeedTableView *)newsfeedtableview;
- (NSArray *)newsFeedArrayStatus:(CustomNewsFeedTableView *)newsfeedtableview;
- (NSArray *)newsFeedArrayImage:(CustomNewsFeedTableView *)newsfeedtableview;

@end

@interface CustomNewsFeedTableView : NSObject<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) id<CustomNewsFeedTableViewDataSoure> dataSource;
@property (nonatomic) CGRect myRect;
@property (strong, nonatomic) NSArray *arrayProfilePicture,*arrayName,*arrayTime,*arrayStatus,*arrayImage;
@property (strong, nonatomic) NSMutableArray *myTableViewCellHeight;
@property (nonatomic) CGFloat myTableViewCellContentWidth;

- (UITableView *)getNewsFeedTableViewWithCGRect:(CGRect)rect;

@end