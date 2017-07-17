//
// Created by yun on 2017/7/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunUITabBarItemFactory.h"
#import "UITabBar+YunAdd.h"

@implementation YunUITabBarItemFactory

+ (UINavigationController *)barItemWithRootVc:(UIViewController *)itemVc
                                        title:(NSString *)title
                                       defImg:(UIImage *)defImg
                                       selImg:(UIImage *)selImg {
    UINavigationController *item = [[UINavigationController alloc] initWithRootViewController:itemVc];
    item.tabBarItem.title = title;
    item.tabBarItem.image = defImg;
    item.tabBarItem.selectedImage = selImg;

    return item;
}

+ (UITabBarController *)tabBarWithVcs:(NSArray<__kindof UIViewController *> *)vcs
                              bgColor:(UIColor *)bgColor
                             selColor:(UIColor *)selColor {
    UITabBarController *tabVc = [UITabBarController new];
    tabVc.viewControllers = vcs;
    [tabVc.tabBar setBarBgColor:bgColor];
    [tabVc.tabBar setTranslucent:NO];

    tabVc.tabBar.tintColor = selColor; // 前景色,选中的颜色

    return tabVc;
}

@end