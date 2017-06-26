//
//  NSError+YunAdd.m
//
//  Created by 王健 on 16/5/26.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSError+YunAdd.h"

@implementation NSError (YunAdd)

+ (instancetype)errorWithCustomMsg:(NSString *)msg {
    return [self errorWithCustomMsg:msg andCode:-1];
}

+ (instancetype)errorWithCustomMsg:(NSString *)msg andCode:(NSInteger)code {
    return [[NSError alloc] initWithDomain:@"error_custom" code:code userInfo:@{CUSTOM_MSG_KEY : msg}];
}

+ (instancetype)errorWithCustomCode:(NSInteger)code {
    return [[NSError alloc] initWithDomain:@"error_custom" code:code userInfo:@{CUSTOM_MSG_KEY : @""}];
}

@end
