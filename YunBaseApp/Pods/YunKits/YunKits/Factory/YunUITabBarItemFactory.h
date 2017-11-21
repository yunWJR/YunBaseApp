//
// Created by yun on 2017/7/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUITabBarItemFactory : NSObject {
}

+ (UINavigationController *)barItemWithRootVc:(UIViewController *)itemVc
                                        title:(NSString *)title
                                       defImg:(UIImage *)defImg
                                       selImg:(UIImage *)selImg;

+ (UITabBarController *)tabBarWithVcs:(NSArray<UIViewController *> *)vcs
                              bgColor:(UIColor *)bgColor
                             selColor:(UIColor *)selColor;
@end