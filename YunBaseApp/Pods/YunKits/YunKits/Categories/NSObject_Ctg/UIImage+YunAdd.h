//
// Created by yun on 2017/5/17.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YunAdd)

+ (UIImage *)imgOfOrg:(NSString *)img;

+ (UIImage *)imgWithColor:(UIColor *)color;

+ (UIImage *)imgWithColor:(UIColor *)color height:(CGFloat)height;

+ (UIImage *)imgWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)getViewImage:(UIView *)view;

- (UIImage *)resizeWithHeight:(CGFloat)height;

- (UIImage *)resizeWithSize:(NSInteger)size;

- (UIImage *)resizeWithMaxSize:(NSInteger)size;

- (UIImage *)resizeWithSize:(NSInteger)size height:(CGFloat)height;

- (NSInteger)imgSize;

- (UIImage *)roundCornerImg;

@end