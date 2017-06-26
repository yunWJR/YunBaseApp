//
// Created by 王健 on 2016/11/14.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUIViewFactory : NSObject

+ (UIView *)viewWithBgColor:(UIColor *)color;

+ (UIView *)viewWithBgColor:(UIColor *)color
                     radius:(CGFloat)radius
                      width:(CGFloat)width
                borderColor:(UIColor *)borderColor;

@end