//
// Created by yun on 2017/5/22.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunLogHelper : NSObject

+ (void)logMsg:(NSString *)msg;

+ (void)logMsg:(NSString *)msg force:(BOOL)force;

@end