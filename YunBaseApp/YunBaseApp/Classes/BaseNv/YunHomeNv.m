//
// Created by yun on 2017/11/7.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunHomeNv.h"

@interface YunHomeNv () {
}

@end

@implementation YunHomeNv

+ (instancetype)nvWithVc:(UIViewController *)vc {
    YunHomeNv *nc = [[YunHomeNv alloc] initWithRootViewController:vc];

    return nc;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

//画面一开始加载时就是竖向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

//- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
//    return [self.viewControllers.lastObject supportedInterfaceOrientations];
//}
//
//- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return [self.viewControllers.lastObject
//            preferredInterfaceOrientationForPresentation];
//}

@end