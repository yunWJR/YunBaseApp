//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunImageHelper : NSObject

- (NSString *)encodeToBase64Str:(UIImage *)image;

- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData;

@end