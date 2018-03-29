//
//  Created by 王健 on 16/4/19.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (YunAdd)

- (void)setTextLeftPadding:(CGFloat)leftPadding;

- (void)setRadius:(CGFloat)radius color:(UIColor *)color width:(CGFloat)width
__deprecated_msg("已过期, 请使用setViewRadius");

- (void)setPhColor:(UIColor *)phColor phFont:(UIFont *)phFont;

- (void)setPhText:(NSString *)text tAl:(NSTextAlignment)tAl font:(UIFont *)font color:(UIColor *)color;

- (void)addTextChangedNoti:(id)tg action:(SEL)action;

@end