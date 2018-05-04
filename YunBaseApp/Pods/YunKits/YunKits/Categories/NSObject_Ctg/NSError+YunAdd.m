//
//  NSError+YunAdd.m
//
// Created by yun on 16/12/1.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "NSError+YunAdd.h"

NSString *const yun_error_custom_msg_key = @"yun_error_custom_msg_key";

@implementation NSError (YunAdd)

+ (instancetype)errorWithCustomMsg:(NSString *)msg {
    return [self errorWithCustomMsg:msg andCode:-1];
}

+ (instancetype)errorWithCustomMsg:(NSString *)msg andCode:(NSInteger)code {
    if (msg == nil) {msg = @"no_error_msg";}

    return [[NSError alloc] initWithDomain:@"error_custom" code:code userInfo:@{yun_error_custom_msg_key : msg}];
}

+ (instancetype)errorWithCustomCode:(NSInteger)code {
    return [[NSError alloc] initWithDomain:@"error_custom" code:code userInfo:@{yun_error_custom_msg_key : @""}];
}

- (NSString *)getErrorMsg {
    return self.userInfo[yun_error_custom_msg_key];
}

@end