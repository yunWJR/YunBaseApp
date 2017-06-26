//
// Created by 王健 on 2016/11/14.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
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