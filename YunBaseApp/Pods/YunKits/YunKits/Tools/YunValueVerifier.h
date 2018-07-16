//
// Created by yun on 16/10/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunValueVerifier : NSObject

+ (BOOL)isSameStr:(NSString *)str1 str2:(NSString *)str2;

+ (BOOL)isSameFloat:(CGFloat)value1 value2:(CGFloat)value2;

+ (BOOL)isSameDouble:(double)value1 value2:(double)value2;

+ (BOOL)isNilOrEmptyStr:(NSString *)str;

+ (BOOL)isNilOrEmptyOrSpaceStr:(NSString *)str;

// 不是nil，空，全空格
+ (BOOL)isValidStr:(NSString *)str;

+ (BOOL)isInvalidStr:(NSString *)str;

+ (BOOL)isNilOrEmptyDic:(id)model;

+ (BOOL)isNilOrEmptyArray:(NSArray *)array;

+ (BOOL)isAllNum:(NSString *)str;

+ (BOOL)isIntObj:(id)obj;

+ (BOOL)isPureInt:(NSString *)str;

+ (BOOL)isPureFloat:(NSString *)str;

+ (BOOL)isPureDouble:(NSString *)str;

@end