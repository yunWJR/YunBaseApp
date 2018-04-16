//
//  UILabel+YunAdd.h
//
// Created by yun on 16/5/8.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (YunAdd)

// cal
+ (CGFloat)calHeightByWidth:(CGFloat)width text:(NSString *)text font:(UIFont *)font;

+ (CGFloat)calOneLineHeight:(UIFont *)font;

+ (CGFloat)calWidthWithText:(NSString *)text font:(UIFont *)font;

+ (CGFloat)calWidthWithTextAt:(NSAttributedString *)at;

// pro
- (CGFloat)getTextHeightByWidth:(CGFloat)width;

- (CGFloat)getOneLineHeight;

- (CGFloat)getOneLineHeightWithoutOffV;

- (CGFloat)getTextWidth;

- (CGFloat)getTitleWidthOff;

- (CGFloat)getWidthByWordCount:(NSInteger)count;

- (CGFloat)getOneWordWidth;

// attr 形式
- (void)setText:(NSString *)text lineInner:(CGFloat)inner;

@end
