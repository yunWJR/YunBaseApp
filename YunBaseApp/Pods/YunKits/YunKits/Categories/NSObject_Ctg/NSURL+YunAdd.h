//
// Created by yun on 2017/8/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (YunAdd)

+ (NSURL *)urlWithStr:(NSString *)urlStr;

+ (NSString *)urlStrWithStr:(NSString *)urlStr;

+ (NSURL *)urlWithStr:(NSString *)urlStr set:(NSCharacterSet *)set;

+ (NSString *)urlStrWithStr:(NSString *)urlStr set:(NSCharacterSet *)set;

@end