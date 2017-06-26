//
// Created by 王健 on 2016/11/9.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YunValueHelper : NSObject

+ (NSString *)intStr:(NSInteger)intValue;

+ (NSString *)intStr:(NSInteger)intValue append:(NSString *)append;

+ (NSString *)intStr:(NSInteger)intValue format:(NSString *)format;

+ (NSString *)priceStr:(CGFloat)price;

+ (NSString *)priceStrWithStr:(NSString *)priceStr;

+ (NSString *)strWithoutSpace:(NSString *)str;

+ (NSString *)randomStrWithLength:(int)len;

+ (NSString *)strWithDic:(NSDictionary *)dic;

+ (NSString *)boolStr:(BOOL)boolValue;

+ (NSInteger)randomInt:(NSInteger)max;

+ (BOOL)randomBool;

@end