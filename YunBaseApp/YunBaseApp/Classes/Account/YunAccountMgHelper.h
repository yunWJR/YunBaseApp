//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YunAccountMg;

@interface YunAccountMgHelper : NSObject

//+ (instancetype)instance;

+ (YunAccountMg *)mg;

+ (void)setMg:(YunAccountMg *)mg;

@end