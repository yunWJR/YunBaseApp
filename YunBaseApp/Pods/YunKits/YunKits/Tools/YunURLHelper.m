//
// Created by yun on 2017/10/27.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunURLHelper.h"
#import "YunValueVerifier.h"

@interface YunURLHelper () {
}

@end

@implementation YunURLHelper

+ (NSDictionary *)dicFromQuery:(NSString *)query {
    return [self dicFromQuery:query eCode:NSUTF8StringEncoding ignoreNil:YES];
}

+ (NSDictionary *)dicFromQuery:(NSString *)query eCode:(NSStringEncoding)encoding ignoreNil:(BOOL)ignoreNil {
    if ([YunValueVerifier isInvalidStr:query]) {
        return [NSDictionary new];
    }

    NSCharacterSet *delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&;"];

    NSMutableDictionary *pairs = [NSMutableDictionary dictionary];

    NSScanner *scanner = [[NSScanner alloc] initWithString:query];
    while (![scanner isAtEnd]) {
        NSString *pairString = nil;

        [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
        [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
        NSArray *kvPair = [pairString componentsSeparatedByString:@"="];

        if (kvPair.count == 2) {
            NSString *key = [kvPair[0] stringByReplacingPercentEscapesUsingEncoding:encoding];

            NSString *value = [kvPair[1] stringByReplacingPercentEscapesUsingEncoding:encoding];

            if (!ignoreNil || [YunValueVerifier isValidStr:value]) {
                pairs[key] = value;
            }
        }
    }

    return [NSDictionary dictionaryWithDictionary:pairs];
}

+ (BOOL)fineQuery:(NSURL *)url lastItem:(NSString *)itemKey rst:(void (^)(NSString *itemV, NSString *retainQuery))rst {
    NSString *urlStr;
    NSString *query = [url query];
    NSRange range = [query rangeOfString:itemKey];

    BOOL find = NO;
    NSString *newQr = nil;
    if (range.location != NSNotFound) {
        NSString *urlQr = [query substringFromIndex:range.location];

        urlStr = [urlQr substringFromIndex:itemKey.length + 1]; // xxx=

        newQr = [query substringToIndex:range.location];

        find = YES;
    }
    else {
        newQr = query;
    }

    if (rst) {
        rst(urlStr, newQr);
    }

    return find;
}

@end