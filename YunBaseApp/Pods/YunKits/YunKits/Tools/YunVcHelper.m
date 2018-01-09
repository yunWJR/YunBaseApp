//
// Created by yun on 2017/11/30.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunVcHelper.h"

@interface YunVcHelper () {
}

@end

@implementation YunVcHelper

//获取当前屏幕显示的 view controller
+ (UIViewController *)getCurrentVc {
    UIViewController *rootVc = [UIApplication sharedApplication].keyWindow.rootViewController;

    UIViewController *curVc = [self getCurrentVcFrom:rootVc];

    return curVc;
}

+ (UIViewController *)getCurrentVcFrom:(UIViewController *)rootVC {
    UIViewController *curVc;

    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }

    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        curVc = [self getCurrentVcFrom:[(UITabBarController *) rootVC selectedViewController]];
    }
    else if ([rootVC isKindOfClass:[UINavigationController class]]) {
        // 根视图为UINavigationController
        curVc = [self getCurrentVcFrom:[(UINavigationController *) rootVC visibleViewController]];
    }
    else {
        // 根视图为非导航类
        curVc = rootVC;
    }

    return curVc;
}

@end