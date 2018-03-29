//
// Created by yun on 2016/11/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunUIViewFactory.h"
#import "UIView+YunAdd.h"

@implementation YunUIViewFactory

+ (UIView *)viewWithBgColor:(UIColor *)color {
    UIView *view = [UIView new];

    if (color) {
        view.backgroundColor = color;
    }

    return view;
}

+ (UIView *)viewWithBgColor:(UIColor *)color
                     radius:(CGFloat)radius
                      width:(CGFloat)width
                borderColor:(UIColor *)borderColor {
    UIView *view = [self viewWithBgColor:color];

    [view setViewRadius:radius width:width color:borderColor];

    return view;
}

@end