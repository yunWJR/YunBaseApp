//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface YunImageHelper : NSObject {

}

- (NSString *)encodeToBase64String:(UIImage *)image;

- (UIImage *)decodeBase64ToImage:(NSString *)strEncodeData;

@end