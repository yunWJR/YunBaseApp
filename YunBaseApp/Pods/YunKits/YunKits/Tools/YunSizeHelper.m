//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunSizeHelper.h"

@implementation YunSizeHelper

+ (CGFloat)statusBarHeight { //
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

// 该高度有可能有误差
+ (CGFloat)navigationBarHeight {
    return 44;
}

+ (CGFloat)statusAndNagBarHeight {
    return self.navigationBarHeight + self.statusBarHeight;
}

+ (CGFloat)tabBarHeight {
    return 49;
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

@end
