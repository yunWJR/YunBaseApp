//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UISearchBar (YunAdd)

- (void)setIconByImgName:(NSString *)imgName;

- (void)setRadius:(CGFloat)rd
          bgColor:(UIColor *)bgColor
      borderColor:(UIColor *)borderColor
      borderWidth:(CGFloat)borderWidth;

- (void)setBg:(UIColor *)color height:(CGFloat)height;

- (void)setRadius:(CGFloat)rd bgColor:(UIColor *)bgColor;

@end