//
//  YunDevice.m
//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunDevice.h"

@implementation YunDevice

+ (BOOL)isPhone4 {
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat height = CGRectGetHeight([UIScreen mainScreen].bounds);
    return width <= 320 && height <= 480;
}

+ (BOOL)isPhone5 {
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGFloat height = CGRectGetHeight([UIScreen mainScreen].bounds);
    return width <= 320 && height > 480;
}

+ (BOOL)isPhone6 {
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    return width > 320 && width < 414;
}

+ (BOOL)isPhone6Plus {
    CGFloat width = CGRectGetWidth([UIScreen mainScreen].bounds);
    return width >= 414;
}

@end
