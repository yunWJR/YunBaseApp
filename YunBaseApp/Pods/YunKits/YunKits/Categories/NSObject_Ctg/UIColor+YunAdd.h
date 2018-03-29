//
//  UIColor+YunAdd.h
//
// Created by yun on 15/11/13.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YunAdd)

+ (UIColor *)hexColor:(UInt32)hex;

+ (UIColor *)hexColor:(UInt32)hex alpha:(CGFloat)alpha;

+ (UIColor *)hexColorStr:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)randomColor;

@end
