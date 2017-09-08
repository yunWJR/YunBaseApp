//
//  UILabel+YunAdd.h
//
//  Created by yun on 16/5/8.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UILabel (YunAdd)

// cal
+ (CGFloat)calHeightByWidth:(CGFloat)width text:(NSString *)text font:(UIFont *)font;

+ (CGFloat)calOneLineHeight:(UIFont *)font;

+ (CGFloat)calWidthWithText:(NSString *)text font:(UIFont *)font;

// pro
- (CGFloat)getTextHeightByWidth:(CGFloat)width;

- (CGFloat)getOneLineHeight;

- (CGFloat)getOneLineHeightOff;

- (CGFloat)getTextWidth;

- (CGFloat)getTitleWidthOff;

- (CGFloat)getWidthByWordCount:(NSInteger)count;

- (CGFloat)getOneWordWidth;

- (void)setText:(NSString *)text lineInner:(CGFloat)inner;

@end
