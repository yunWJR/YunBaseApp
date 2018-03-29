//
// Created by yun on 2017/5/11.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppTheme+Size.h"

@implementation YunAppTheme (Size)

+ (CGFloat)lineHeightL {
    return YunAppTheme.instance.lineHL;
}

+ (CGFloat)lineHeight {
    return YunAppTheme.instance.lineH;
}

+ (CGFloat)lineHeightB {
    return YunAppTheme.instance.lineHB;
}

+ (CGFloat)screenSize:(CGFloat)size {
    return [YunAppTheme.instance sSize:size];
}

@end