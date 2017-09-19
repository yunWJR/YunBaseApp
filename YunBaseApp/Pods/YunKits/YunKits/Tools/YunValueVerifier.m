//
// Created by 王健 on 16/10/14.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunValueVerifier.h"
#import "YunValueHelper.h"

@implementation YunValueVerifier

+ (BOOL)isSameStr:(NSString *)str1 str2:(NSString *)str2 {
    if (str1 == nil) {str1 = @"";}
    if (str2 == nil) {str2 = @"";}

    return [str1 isEqualToString:str2];
}

+ (BOOL)isSameFloat:(CGFloat)value1 value2:(CGFloat)value2 {
    CGFloat delta = value1 - value2;

    return delta > -0.0001 && delta < 0.0001;
}

+ (BOOL)isNilOrEmptyStr:(NSString *)str {
    if (str == nil) {
        return YES;
    }

    return [str isEqualToString:@""];
}

+ (BOOL)isNilOrEmptyOrSpaceStr:(NSString *)str {
    if (str == nil) {
        return YES;
    }

    NSString *ctn = [YunValueHelper strWithoutSpace:str];

    return [ctn isEqualToString:@""];
}

+ (BOOL)isValidStr:(NSString *)str {
    return ![self isNilOrEmptyOrSpaceStr:str];
}

+ (BOOL)isInvalidStr:(NSString *)str {
    return [self isNilOrEmptyOrSpaceStr:str];
}

+ (BOOL)isNilOrEmptyDic:(id)model {
    if (model == nil) {
        return YES;
    }

    if ([model isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dic = model;
        return dic.allKeys.count == 0;
    }

    return YES;
}

+ (BOOL)isNilOrEmptyArray:(NSArray *)array {
    if (array == nil) {
        return YES;
    }

    return array.count == 0;
}

+ (BOOL)isAllNum:(NSString *)str {
    unichar c;
    for (NSUInteger i = 0; i < str.length; i++) {
        c = [str characterAtIndex:i];
        if (!isdigit(c)) {
            return NO;
        }
    }
    return YES;
}

+ (BOOL)isPureInt:(NSString *)str {
    NSScanner *scan = [NSScanner scannerWithString:str];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

+ (BOOL)isPureFloat:(NSString *)str {
    NSScanner *scan = [NSScanner scannerWithString:str];
    float val;
    return [scan scanFloat:&val] && [scan isAtEnd];
}

+ (BOOL)isPureDouble:(NSString *)str {
    NSScanner *scan = [NSScanner scannerWithString:str];
    double val;
    return [scan scanDouble:&val] && [scan isAtEnd];
}

@end