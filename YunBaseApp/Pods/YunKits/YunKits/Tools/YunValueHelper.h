//
// Created by yun on 2016/11/9.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunValueHelper : NSObject

+ (NSString *)intStr:(NSInteger)intValue;

+ (NSString *)intStr:(NSInteger)intValue append:(NSString *)append;

+ (NSString *)intStr:(NSInteger)intValue format:(NSString *)format;

+ (NSString *)floatStr:(CGFloat)value;

+ (NSString *)doubleStr:(double)value;

+ (NSString *)priceDbStr:(double)price;

+ (NSString *)priceFlStr:(CGFloat)price;

+ (NSString *)priceStrWithStr:(NSString *)priceStr;

+ (NSString *)strWithoutSpace:(NSString *)str;

+ (NSMutableString *)randomChinese:(NSInteger)len;

+ (NSMutableString *)randomChineseWithMaxLength:(NSInteger)maxLen;

+ (NSString *)randomStrWithLength:(NSInteger)len;

+ (NSString *)randomStrWithMaxLength:(NSInteger)maxLen;

+ (NSString *)strWithDic:(NSDictionary *)dic;

+ (NSString *)boolStr:(BOOL)boolValue;

+ (NSInteger)randomInt:(NSInteger)max;

+ (BOOL)randomBool;

+ (NSString *)str:(NSString *)str withDef:(NSString *)def;

@end