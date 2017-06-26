//
//  UIImage+Device.m
//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "UIImage+Device.h"
#import "YunDevice.h"

@implementation UIImage (Device)

+ imageNamedOnDevice:(NSString *)name {
    NSString *image = name;
    if ([YunDevice isPhone6Plus]) {
        image = [NSString stringWithFormat:@"%@-1242*2208", name];
    }
    else if ([YunDevice isPhone6]) {
        image = [NSString stringWithFormat:@"%@-750*1334", name];
    }
    else if ([YunDevice isPhone5]) {
        image = [NSString stringWithFormat:@"%@-640*1136", name];
    }
    else if ([YunDevice isPhone4]) {
        image = [NSString stringWithFormat:@"%@-640*960", name];
    }

    // 4 不加后缀

    return [UIImage imageNamed:image];
}

//+ imageNamedOnDevice:(NSString *)name {
//    NSString *image = name;
//    if ([YunDevice isPhone6Plus]) {
//        image = [NSString stringWithFormat:@"%@-6p", name];
//    }
//    else if ([YunDevice isPhone6]) {
//        image = [NSString stringWithFormat:@"%@-6", name];
//    }
//    else if ([YunDevice isPhone5]) {
//        image = [NSString stringWithFormat:@"%@-5", name];
//    }
//
//    // 4 不加后缀
//
//    return [UIImage imageNamed:image];
//}

@end
