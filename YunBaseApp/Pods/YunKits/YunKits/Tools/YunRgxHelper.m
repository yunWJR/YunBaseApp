//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunRgxHelper.h"

@implementation YunRgxHelper

+ (BOOL)matchRgx:(NSString *)rgx ctn:(NSString *)ctn {
    NSError *error;
    // 创建NSRegularExpression对象并指定正则表达式
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:rgx
                                                                           options:0
                                                                             error:&error];

    if (!error) { // 如果没有错误
        // 获取特特定字符串的范围
        NSTextCheckingResult *match = [regex firstMatchInString:ctn
                                                        options:0
                                                          range:NSMakeRange(0, [ctn length])];
        if (match) {
            return YES;
        }
    }

    return NO;
}

+ (NSString *)matchedCtnByRgx:(NSString *)rgx ctn:(NSString *)ctn {
    NSError *error;
    // 创建NSRegularExpression对象并指定正则表达式
    NSRegularExpression *regex = [NSRegularExpression
            regularExpressionWithPattern:rgx
                                 options:0
                                   error:&error];

    if (!error) { // 如果没有错误
        // 获取特特定字符串的范围
        NSTextCheckingResult *match = [regex firstMatchInString:ctn
                                                        options:0
                                                          range:NSMakeRange(0, [ctn length])];
        if (match) {
            return [ctn substringWithRange:match.range];
        }
    }

    return nil;
}

@end