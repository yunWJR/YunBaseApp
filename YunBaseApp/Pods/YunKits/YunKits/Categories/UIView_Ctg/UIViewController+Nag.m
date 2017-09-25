//
// Created by yun on 2017/9/22.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UIViewController+Nag.h"
#import "YunSizeHelper.h"
#import "Masonry.h"
#import "YunConfig.h"

@implementation UIViewController (Nag)

- (UIView *)createTitleView {
    UIView *tV = [UIView new];

    CGFloat tW = YunSizeHelper.screenWidth - YunConfig.instance.nagItemWidth * 2;
    CGFloat tH = YunSizeHelper.navigationBarHeight;

    tV.frame = CGRectMake(0, 0, tW, tH);

    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_9_x_Max) {
        [tV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(tW));
            make.height.equalTo(@(tH));
        }];
    }
    else { //iOS10以下 无需
    }

    self.navigationItem.titleView = tV;

    return tV;
}

@end