//
// Created by yun on 2016/11/9.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Style)

- (void)setText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;

- (void)setAlign:(NSTextAlignment)align lines:(NSInteger)lines adjust:(BOOL)adjust;

// 使用 setViewRadius
- (void)setRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color
__deprecated_msg("已过期, 请使用setViewRadius");

@end