//
//  DongFramework.h
//  NewsFeedTest
//
//  Created by Lycodes_Dong on 7/6/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DongFramework : NSObject

+ (void)getJsonWithURL:(NSURL *)url Target:(id)target Action:(SEL)action Name:(NSString *)name;

+ (UIImage *)getImageWithURL:(NSURL *)url;

+ (float)setImageHeightWithImage:(UIImage *)image Width:(float)width;

+ (float)getStatusHeight;

+ (float)getNavigationHeightWithViewController:(UIViewController *)viewcontroller;

+ (float)getTabBarHeightWithViewController:(UIViewController *)viewcontroller;

+ (float)getLabelHeightWithText:(NSString *)text Width:(float)width;

@end
