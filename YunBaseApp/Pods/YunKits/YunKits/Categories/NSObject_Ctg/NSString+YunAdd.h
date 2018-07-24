//
// Created by yun on 16/10/8.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (YunAdd)

// 如果 str 为 nil 或者@""，则取 ctn
- (NSString *)strByDefCtn:(NSString *)ctn;

// 查询str 中子字段的个数
- (NSInteger)calSubCount:(NSString *)str;

@end