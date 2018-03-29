//
//  NSError+YunAdd.m
//
// Created by yun on 16/12/1.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSError+YunAdd.h"

@implementation NSError (YunAdd)

+ (instancetype)errorWithCustomMsg:(NSString *)msg {
    return [self errorWithCustomMsg:msg andCode:-1];
}

+ (instancetype)errorWithCustomMsg:(NSString *)msg andCode:(NSInteger)code {
    if (msg == nil) {msg = @"no_error_msg";}

    return [[NSError alloc] initWithDomain:@"error_custom" code:code userInfo:@{CUSTOM_MSG_KEY : msg}];
}

+ (instancetype)errorWithCustomCode:(NSInteger)code {
    return [[NSError alloc] initWithDomain:@"error_custom" code:code userInfo:@{CUSTOM_MSG_KEY : @""}];
}

- (NSString *)getErrorMsg {
    return self.userInfo[CUSTOM_MSG_KEY];
}

@end
