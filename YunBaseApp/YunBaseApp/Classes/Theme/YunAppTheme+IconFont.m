//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppTheme+IconFont.h"
#import "YunConfig.h"

@implementation YunAppTheme (IconFont)

+ (UIFont *)iconFontBySize:(CGFloat)size {
    return [UIFont fontWithName:YunConfig.instance.iconFontName size:size];
}

@end