//
// Created by yun on 16/9/18.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (YunAdd)

- (void)setIconByImgName:(NSString *)imgName;

- (void)setRadius:(CGFloat)rd bgColor:(UIColor *)bgColor;

- (void)setRadius:(CGFloat)rd
          bgColor:(UIColor *)bgColor
      borderColor:(UIColor *)borderColor
      borderWidth:(CGFloat)borderWidth;

- (void)setBg:(UIColor *)color;

- (void)setBg:(UIColor *)color height:(CGFloat)height;

- (void)setBg:(UIColor *)color height:(CGFloat)height filedBgImg:(NSString *)img;

@end