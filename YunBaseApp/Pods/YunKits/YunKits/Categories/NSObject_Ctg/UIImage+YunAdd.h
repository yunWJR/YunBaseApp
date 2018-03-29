//
// Created by yun on 2017/5/17.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YunAdd)

// image
+ (UIImage *)imgWithColor:(UIColor *)color;

+ (UIImage *)imgWithColor:(UIColor *)color height:(CGFloat)height;

+ (UIImage *)imgWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)getViewImage:(UIView *)view;

- (UIImage *)roundCornerImg;

// size 尺寸
// 高度压缩
- (UIImage *)resizeWithHeight:(CGFloat)height;

// length 大小
- (NSInteger)imgSize
__deprecated_msg("已过期, 请使用imgLength");

// kb 估计值，有一点误差
- (NSInteger)imgLength;

- (UIImage *)resizeWithSize:(NSInteger)size
__deprecated_msg("已过期, 请使用compressByMaxLength");

- (UIImage *)resizeWithMaxSize:(NSInteger)size
__deprecated_msg("已过期, 请使用compressByMaxLength");

// kb
- (UIImage *)compressByMaxLength:(NSInteger)length;

- (NSData *)compressByMaxLengthToData:(NSInteger)length;

@end