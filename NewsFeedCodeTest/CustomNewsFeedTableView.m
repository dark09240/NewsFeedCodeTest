//
//  CustomNewsFeedTableView.m
//  NewsFeedCodeTest
//
//  Created by Lycodes_Dong on 7/7/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "CustomNewsFeedTableView.h"

@implementation CustomNewsFeedTableView

#pragma mark Return UITableView

- (UITableView *)getNewsFeedTableViewWithCGRect:(CGRect)rect {
    
    self.myRect = rect;
    
    self.arrayProfilePicture = [self.dataSource newsFeedArrayProfilePicture:self];
    self.arrayName = [self.dataSource newsFeedArrayName:self];
    self.arrayTime = [self.dataSource newsFeedArrayTime:self];
    self.arrayStatus = [self.dataSource newsFeedArrayStatus:self];
    self.arrayImage = [self.dataSource newsFeedArrayImage:self];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.myRect style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.bounces = NO;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.allowsSelection = NO;
    
    self.myTableViewCellContentWidth = self.myRect.size.width - 10;
    
    return tableView;
    
}

- (CGFloat)getTableViewCellHeightWithIndex:(NSInteger)index {

    CGFloat height,textHeight,imageHeight;
    
    //Get text height
    
    NSString *string = [self.arrayStatus objectAtIndex:index];
    
    if (![string isEqualToString:@""]) {
        
        textHeight = [DongFramework getLabelHeightWithText:string Width:self.myTableViewCellContentWidth];
        
    }else {
    
        textHeight = 0;
    
    }
    
    //Get image height
    
    string = [NSString stringWithFormat:@"%@",[self.arrayImage objectAtIndex:index]];
    
    if (![string isEqualToString:@""]) {
        
        UIImage *image = [self.arrayImage objectAtIndex:index];
        
        imageHeight = [DongFramework setImageHeightWithImage:image Width:self.myTableViewCellContentWidth];
        
    }else {
    
        imageHeight = 0;
        
    }
    
    height = 90 + textHeight + imageHeight;
    
    return height;

}

#pragma mark UITableView DataSoure

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.arrayName count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell;
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithFrame:CGRectMake(0, 0, self.myRect.size.width, 0)];
    }
    
    CGFloat cellContentHeight = [self getTableViewCellHeightWithIndex:indexPath.row] - 10;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(5, 5, self.myTableViewCellContentWidth, cellContentHeight)];
    
    [cell addSubview:view];
    
    //ProfilePicture
    UIImageView *profilePictureView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 60.0f, 60.0f)];
    
    profilePictureView.image = (UIImage *)[self.arrayProfilePicture objectAtIndex:indexPath.row];
    
    [view addSubview:profilePictureView];
    
    //Name
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(profilePictureView.frame) + 10, CGRectGetMinY(profilePictureView.frame), view.bounds.size.width - profilePictureView.bounds.size.width - 10, 30.0f)];
    
    name.text = (NSString *)[self.arrayName objectAtIndex:indexPath.row];
    
    [view addSubview:name];
    
    //Time
    UILabel *time = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(name.frame), CGRectGetMaxY(name.frame), CGRectGetWidth(name.bounds), CGRectGetHeight(name.bounds))];
    
    time.text = (NSString *)[self.arrayTime objectAtIndex:indexPath.row];
    
    [view addSubview:time];
    
    //Status
    NSString *statusString = (NSString *)[self.arrayStatus objectAtIndex:indexPath.row];
    
    UILabel *status;
    
    if (![statusString isEqualToString:@""]) {
    
        status = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(profilePictureView.frame), CGRectGetMaxY(profilePictureView.frame) + 10, self.myTableViewCellContentWidth, [DongFramework getLabelHeightWithText:[self.arrayStatus objectAtIndex:indexPath.row] Width:self.myTableViewCellContentWidth])];
        
        status.text = (NSString *)[self.arrayStatus objectAtIndex:indexPath.row];
        
        status.numberOfLines = 0;
        
        status.lineBreakMode = NSLineBreakByWordWrapping;
        
        [view addSubview:status];
    
    }
    
    //Image
    NSString *imageString = [NSString stringWithFormat:@"%@",[self.arrayImage objectAtIndex:indexPath.row]];
    
    if (![imageString isEqualToString:@""]) {
        
        UIImageView *imageView = [[UIImageView alloc]init];
        
        UIImage *image = (UIImage *)[self.arrayImage objectAtIndex:indexPath.row];
        
        if ([statusString isEqualToString:@""]) {
        
            imageView.frame = CGRectMake(CGRectGetMinX(profilePictureView.frame), CGRectGetMaxY(profilePictureView.frame) + 10, self.myTableViewCellContentWidth, [DongFramework setImageHeightWithImage:image Width:self.myTableViewCellContentWidth]);
            
        }else {
        
            imageView.frame = CGRectMake(CGRectGetMinX(profilePictureView.frame), CGRectGetMaxY(status.frame) + 10, self.myTableViewCellContentWidth, [DongFramework setImageHeightWithImage:image Width:self.myTableViewCellContentWidth]);
        
        }
        
        imageView.image = image;
        
        [view addSubview:imageView];
    
    }
    
    return cell;

}

#pragma mark UITableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return [self getTableViewCellHeightWithIndex:indexPath.row];

}

@end
