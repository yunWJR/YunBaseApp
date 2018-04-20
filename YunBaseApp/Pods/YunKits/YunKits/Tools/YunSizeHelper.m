//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunSizeHelper.h"

@implementation YunSizeHelper

+ (CGFloat)statusBarHeight { //
    CGFloat sBar = [UIApplication sharedApplication].statusBarFrame.size.height;

    return sBar; // def = 20pt iPhoneX=44pt
}

// 该高度有可能有误差
+ (CGFloat)navigationBarHeight {
    return 44;
}

+ (CGFloat)statusAndNagBarHeight {
    return self.navigationBarHeight + self.statusBarHeight;
}

+ (CGFloat)tabBarHeight {
    return 49 + self.btmSafeOff;
}

+ (CGFloat)screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)widthOn2x:(CGFloat)width {
    return self.screenWidth * width / 375.00f;
}

+ (CGFloat)heightOn2x:(CGFloat)height {
    return self.screenHeight * height / 667.00f;
}

+ (CGFloat)btmSafeOff {
    return self.isIPhoneX ? 34.0f : 0.0f;
}

+ (BOOL)isIPhoneX {
    BOOL iPhoneX = self.screenWidth == 375.0f && self.screenHeight == 812.0f;

    return iPhoneX;
}

@end
