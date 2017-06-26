//
// Created by 王健 on 16/10/8.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (YunAdd)

- (void)setImgUrlStr:(NSString *)urlStr;

- (void)downLoadImg:(NSString *)imgStr result:(void (^)(NSURL *))rs;

- (void)setImgUrlStr:(NSString *)urlStr holderImg:(UIImage *)img;

- (void)setAvrImgUrlStr:(NSString *)urlStr;

@end