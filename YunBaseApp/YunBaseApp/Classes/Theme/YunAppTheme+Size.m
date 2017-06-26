//
// Created by yun on 2017/5/11.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAppTheme+Size.h"

@implementation YunAppTheme (Size)

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