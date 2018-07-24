//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunPinYinTool.h"

@implementation YunPinYinTool

+ (NSString *)pinYinFromChinese:(NSString *)chinese {
    return [self pinYinFromChinese:chinese hasSoundMark:NO];
}

+ (NSString *)pinYinFromChinese:(NSString *)chinese hasSoundMark:(BOOL)hasOrNot {
    CFMutableStringRef chineseMutableStringRef = CFStringCreateMutableCopy(NULL, 0, (__bridge CFStringRef) chinese);

    CFStringTransform(chineseMutableStringRef, NULL, kCFStringTransformMandarinLatin, NO);
    if (!hasOrNot) {
        CFStringTransform(chineseMutableStringRef, NULL, kCFStringTransformStripDiacritics, NO);
    }

    return (__bridge NSString *) (chineseMutableStringRef);
}

@end
