//
// Created by 王健 on 2016/11/9.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunValueHelper.h"

@implementation YunValueHelper

+ (NSString *)intStr:(NSInteger)intValue {
    return [NSString stringWithFormat:@"%ld", (long) intValue];
}

+ (NSString *)intStr:(NSInteger)intValue append:(NSString *)append {
    return [NSString stringWithFormat:@"%ld%@", (long) intValue, append];
}

+ (NSString *)intStr:(NSInteger)intValue format:(NSString *)format {
    return [NSString stringWithFormat:format, [self intStr:intValue]];
}

+ (NSString *)priceStr:(CGFloat)price {
    return [NSString stringWithFormat:@"￥%0.02lf", price];
}

+ (NSString *)priceStrWithStr:(NSString *)priceStr {
    return [NSString stringWithFormat:@"￥%@", priceStr];
}

+ (NSString *)strWithoutSpace:(NSString *)str {
    if (str != nil) {

        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    }

    return str;
}

+ (NSString *)randomStrWithLength:(int)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:len];

    for (int i = 0; i < len; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random_uniform((int) [letters length])]];
    }

    return randomString;
}

+ (NSString *)strWithDic:(NSDictionary *)dic {
    NSMutableString *mS = [NSMutableString new];
    for (id k in [dic allKeys]) {
        [mS appendString:k];
        [mS appendString:@":"];

        [mS appendString:dic[k]];
        [mS appendString:@" "];
    }

    return mS;
}

+ (NSString *)boolStr:(BOOL)boolValue {
    return boolValue ? @"1" : @"0";
}

// 1- max 的数
+ (NSInteger)randomInt:(NSInteger)max {
    int value = arc4random() % max + 1;
    return value;
}

+ (BOOL)randomBool {
    int r = arc4random() * 10;
    return r >= 5;
}

@end