//
// Created by yun on 2017/9/27.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunSystemHelper : NSObject

+ (void)printAllFont;

+ (BOOL)hasFont:(NSString *)name;

+ (NSString *)sysVersion;

+ (BOOL)sysVerEqual:(NSString *)ver;

+ (BOOL)sysVerGreater:(NSString *)ver;

+ (BOOL)sysVerGreater_Equal:(NSString *)ver;

+ (BOOL)sysVerLess:(NSString *)ver;

+ (BOOL)sysVerLess_Equal:(NSString *)ver;

@end