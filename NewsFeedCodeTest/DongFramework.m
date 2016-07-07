//
//  DongFramework.m
//  NewsFeedTest
//
//  Created by Lycodes_Dong on 7/6/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "DongFramework.h"

@implementation DongFramework
#pragma mark Get Json

+ (void)getJsonWithURL:(NSURL *)url Target:(id)target Action:(SEL)action Name:(NSString *)name {
    
    [[NSNotificationCenter defaultCenter]addObserver:target selector:action name:name object:nil];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        
        if (error == nil) {
            
            NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            
            [[NSNotificationCenter defaultCenter]postNotificationName:name object:array];
            
            [[NSNotificationCenter defaultCenter]removeObserver:target name:name object:nil];
            
        }
        
    }];
    
    [dataTask resume];
    
}

#pragma mark Get Image

+ (UIImage *)getImageWithURL:(NSURL *)url {
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:data];
    
    return image;
    
}

#pragma mark Get Image Width

+ (float)setImageHeightWithImage:(UIImage *)image Width:(float)width {
    
    float height,imageHeight,imageWidth;
    
    imageWidth = image.size.width;
    
    imageHeight = image.size.height;
    
    height = imageHeight * width / imageWidth;
    
    return height;
    
}

#pragma mark Get Item Height

+ (float)getStatusHeight {
    
    float height = [UIApplication sharedApplication].statusBarFrame.size.height;
    
    return height;
    
}

+ (float)getNavigationHeightWithViewController:(UIViewController *)viewcontroller {
    
    float height = viewcontroller.navigationController.navigationBar.bounds.size.height;
    
    return height;
    
}

+ (float)getTabBarHeightWithViewController:(UIViewController *)viewcontroller {
    
    float height = viewcontroller.tabBarController.tabBar.bounds.size.height;
    
    return height;
    
}

+ (float)getLabelHeightWithText:(NSString *)text Width:(float)width {
    
    float labelHeight;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = text;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize size = [label sizeThatFits:CGSizeMake(label.frame.size.width, MAXFLOAT)];
    labelHeight = size.height;

    return labelHeight;

}

#pragma mark Create CustomActivityIndicatorView

+ (UIActivityIndicatorView *)createCustomActivityIndicatorView {
    
    UIActivityIndicatorView *myActivityIndicatorView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    myActivityIndicatorView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height /2);
    myActivityIndicatorView.hidesWhenStopped = YES;
    myActivityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    myActivityIndicatorView.color = [UIColor blackColor];
    myActivityIndicatorView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    
    return myActivityIndicatorView;
    
}

@end
