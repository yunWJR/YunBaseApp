//
// Created by yun on 2017/8/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "NSURL+YunAdd.h"

@implementation NSURL (YunAdd)

+ (NSString *)urlStrWithStr:(NSString *)urlStr {
    NSURL *url = [self urlWithStr:urlStr];

    return [url absoluteString];
}

+ (NSURL *)urlWithStr:(NSString *)urlStr {
    NSURL *url = [self urlWithStr:urlStr set:[NSCharacterSet URLQueryAllowedCharacterSet]];

    return url;
}

+ (NSString *)urlStrWithStr:(NSString *)urlStr set:(NSCharacterSet *)set {
    NSURL *url = [self urlWithStr:urlStr set:set];

    return [url absoluteString];
}

+ (NSURL *)urlWithStr:(NSString *)urlStr set:(NSCharacterSet *)set {
    NSString *newUrl = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:set];
    NSURL *url = [NSURL URLWithString:newUrl];

    return url;
}

@end