//
// Created by yun on 2017/5/11.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppTheme.h"

@interface YunAppTheme (Font)

+ (UIFont *)fontL_N;

+ (UIFont *)fontN_N;

+ (UIFont *)fontB_N;

+ (UIFont *)fontL:(CGFloat)size;

+ (UIFont *)fontN:(CGFloat)size;

+ (UIFont *)fontB:(CGFloat)size;

// 不缩放
+ (UIFont *)nagFontTitle;

// 不缩放
+ (UIFont *)nagFontItem;

@end