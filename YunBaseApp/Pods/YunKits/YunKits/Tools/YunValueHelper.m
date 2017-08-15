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

+ (NSString *)floatStr:(CGFloat)value {
    return [NSString stringWithFormat:@"%0.02lf", value];
}

+ (NSString *)doubleStr:(double)value {
    return [NSString stringWithFormat:@"%0.02lf", value];
}

+ (NSString *)priceDbStr:(double)price {
    return [NSString stringWithFormat:@"￥%0.02lf", price];
}

+ (NSString *)priceFlStr:(CGFloat)price {
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

+ (NSMutableString *)randomChinese:(NSInteger)len {
    NSMutableString *randomChineseStr = @"".mutableCopy;

    for (NSInteger i = 0; i < len; i++) {
        NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);

        //随机生成汉字高位
        NSInteger randomH = 0xA1 + arc4random() % (0xFE - 0xA1 + 1);

        //随机生成汉子低位
        NSInteger randomL = 0xB0 + arc4random() % (0xF7 - 0xB0 + 1);

        //组合生成随机汉字
        NSInteger number = (randomH << 8) + randomL;

        NSData *data = [NSData dataWithBytes:&number length:2];

        NSString *string = [[NSString alloc] initWithData:data encoding:gbkEncoding];

        [randomChineseStr appendString:string];
    }

    return randomChineseStr;
}

+ (NSMutableString *)randomChineseWithMaxLength:(NSInteger)maxLen {
    return [self randomChinese:[self randomInt:maxLen]];
}

+ (NSString *)randomStrWithLength:(NSInteger)len {
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity:len];

    for (int i = 0; i < len; i++) {
        [randomString appendFormat:@"%C", [letters characterAtIndex:arc4random_uniform((int) [letters length])]];
    }

    return randomString;
}

+ (NSString *)randomStrWithMaxLength:(NSInteger)maxLen {
    return [self randomStrWithLength:[self randomInt:maxLen]];
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