//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunImageHelper : NSObject

+ (NSString *)base64FormImg:(UIImage *)image;

+ (UIImage *)imgFromBase64:(NSString *)strEncodeData;

@end