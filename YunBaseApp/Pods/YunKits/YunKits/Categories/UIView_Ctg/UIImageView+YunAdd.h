//
// Created by 王健 on 16/10/8.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YunAdd)

- (void)setImgUrlStr:(NSString *)urlStr;

- (void)setImgUrlStr:(NSString *)urlStr holderImg:(UIImage *)phImg;

- (void)setAvrImgUrlStr:(NSString *)urlStr;

- (BOOL)setIconName:(NSString *)iconName
               size:(CGFloat)size
              color:(UIColor *)color;

- (void)downLoadImg:(NSString *)urlStr result:(void (^)(NSURL *path))rst;

@end