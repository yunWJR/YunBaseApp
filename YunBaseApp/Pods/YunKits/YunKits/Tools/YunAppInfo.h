//
// Created by yun on 2016/11/24.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunAppInfo : NSObject

// 1.0.0
+ (NSString *)appVersion;

// 100
+ (NSString *)appVersionStr;

+ (BOOL)shouldUpdate:(NSString *)serverVersion;

@end