//
// Created by yun on 2017/5/11.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppTheme+Font.h"

@implementation YunAppTheme (Font)

+ (UIFont *)fontL_N {
    return [UIFont fontWithName:YunAppTheme.instance.fontLName size:YunAppTheme.instance.sizeN];
}

+ (UIFont *)fontN_N {
    return [UIFont fontWithName:YunAppTheme.instance.fontNName size:YunAppTheme.instance.sizeN];
}

+ (UIFont *)fontB_N {
    return [UIFont fontWithName:YunAppTheme.instance.fontBName size:YunAppTheme.instance.sizeN];
}

+ (UIFont *)fontL:(CGFloat)size {
    return [UIFont fontWithName:YunAppTheme.instance.fontLName size:[YunAppTheme.instance sSize:size]];
}

+ (UIFont *)fontN:(CGFloat)size {
    return [UIFont fontWithName:YunAppTheme.instance.fontNName size:[YunAppTheme.instance sSize:size]];
}

+ (UIFont *)fontB:(CGFloat)size {
    return [UIFont fontWithName:YunAppTheme.instance.fontBName size:[YunAppTheme.instance sSize:size]];
}

// 不缩放
+ (UIFont *)nagFontTitle {
    return [UIFont fontWithName:YunAppTheme.instance.fontNagTitle size:YunAppTheme.instance.sizeNagTitle];
}

// 不缩放
+ (UIFont *)nagFontItem {
    return [UIFont fontWithName:YunAppTheme.instance.fontNagItem size:YunAppTheme.instance.sizeNagItem];
}

@end