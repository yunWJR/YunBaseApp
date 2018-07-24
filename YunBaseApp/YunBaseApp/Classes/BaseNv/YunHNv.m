//
// Created by yun on 2017/11/7.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunHNv.h"

@interface YunHNv () {
}

@end

@implementation YunHNv

+ (instancetype)nvWithVc:(UIViewController *)vc {
    YunHNv *nc = [[YunHNv alloc] initWithRootViewController:vc];

    return nc;
}

- (BOOL)shouldAutorotate {
    return NO;
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}

//画面一开始加载时就是竖向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

@end