//
//  UIColor+YunAdd.m
//
//  Created by WangJianrong on 15/11/13.
//  Copyright (c) 2015年 爱多星球教育科技有限公司. All rights reserved.
//

#import "UIColor+YunAdd.h"

@implementation UIColor (YunAdd)

+ (UIColor *)hexColor:(UInt32)hex {
    return [self hexColor:hex alpha:1.0];
}

+ (UIColor *)hexColor:(UInt32)hex alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0f
                           green:((hex & 0x00FF00) >> 8) / 255.0f
                            blue:((hex & 0xFF) >> 0) / 255.0f
                           alpha:alpha];
}

+ (UIColor *)hexColorString:(NSString *)color alpha:(CGFloat)alpha {
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:
                                        [NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"]) {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6) {
        return [UIColor clearColor];
    }

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:alpha];
}

+ (UIColor *)randomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f
                                         green:aGreenValue / 255.0f
                                          blue:aBlueValue / 255.0f
                                         alpha:1.0f];
    return randColor;
}

@end