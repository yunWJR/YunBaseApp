//
//  NSError+YunAdd.h
//
// Created by yun on 16/12/1.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CUSTOM_MSG_KEY @"custom_error"

@interface NSError (YunAdd)

+ (instancetype)errorWithCustomMsg:(NSString *)msg;

+ (instancetype)errorWithCustomMsg:(NSString *)msg andCode:(NSInteger)code;

+ (instancetype)errorWithCustomCode:(NSInteger)code;

- (NSString *)getErrorMsg;

@end
