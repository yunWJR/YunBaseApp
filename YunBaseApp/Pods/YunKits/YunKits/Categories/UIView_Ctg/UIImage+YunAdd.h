//
// Created by yun on 2017/5/17.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YunAdd)

#pragma mark - instacne

+ (UIImage *)imgWithObj:(id)obj;

+ (UIImage *)imgWithColor:(UIColor *)color;

+ (UIImage *)imgWithColor:(UIColor *)color height:(CGFloat)height;

+ (UIImage *)imgWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)getViewImage:(UIView *)view;

#pragma mark - common

- (UIImage *)roundCornerImg;

- (UIImage *)resizeAndCmpDef;

- (UIImage *)resize:(CGFloat)boundary andCmp:(NSInteger)length;

// 如果要上传，最好用 NSData，不然大小容易出问题
- (NSData *)resizeAndCmpToDataDef;

- (NSData *)resizeToData:(CGFloat)boundary andCmp:(NSInteger)length;

#pragma mark - size

// 默认压缩尺寸
- (UIImage *)resizeByDef;

// 压缩尺寸
- (UIImage *)resizeByMaxBd:(CGFloat)boundary;

// 尺寸压缩
- (UIImage *)resizeWithHeight:(CGFloat)height;

#pragma mark - length

// kb 图片大小，估计值，有一点误差
- (NSInteger)imgLength;

// kb 默认压缩大小
- (UIImage *)compressDef;

// kb 压缩大小
- (UIImage *)compressByMaxLength:(NSInteger)length;

// KB 压缩大小
- (NSData *)compressByMaxLengthToData:(NSInteger)length;

// length 大小
- (NSInteger)imgSize
__deprecated_msg("已过期, 请使用imgLength");

- (UIImage *)resizeWithSize:(NSInteger)size
__deprecated_msg("已过期, 请使用compressByMaxLength");

- (UIImage *)resizeWithMaxSize:(NSInteger)size
__deprecated_msg("已过期, 请使用compressByMaxLength");

@end