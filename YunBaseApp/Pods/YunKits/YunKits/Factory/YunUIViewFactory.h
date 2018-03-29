//
// Created by yun on 2016/11/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUIViewFactory : NSObject

+ (UIView *)viewWithBgColor:(UIColor *)color;

+ (UIView *)viewWithBgColor:(UIColor *)color
                     radius:(CGFloat)radius
                      width:(CGFloat)width
                borderColor:(UIColor *)borderColor;

@end