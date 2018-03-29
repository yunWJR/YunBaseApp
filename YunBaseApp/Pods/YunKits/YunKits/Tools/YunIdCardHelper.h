//
// Created by yun on 16/6/28.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunIdCardHelper : NSObject

+ (BOOL)isValidIdCard:(NSString *)idCard;

+ (NSInteger)getIdCardSex:(NSString *)idCard;

+ (NSString *)getIdCardAge:(NSString *)idCard;

@end