//
// Created by yun on 2017/6/5.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "UITabBar+YunAdd.h"
#import "UIImage+YunAdd.h"

@implementation UITabBar (YunAdd)

- (void)setBarBgColor:(UIColor *)bgColor {
    [self setBackgroundImage:[UIImage getImageWithColor:bgColor size:CGSizeMake(1.0f, 1.0f)]];
}

@end