//
//  Created by Will on 14-6-23.
//  Copyright (c) 2014年 Will. All rights reserved.
//

#import "YunPinYinTool.h"

@implementation YunPinYinTool

+ (NSString *)pinYinFromChinese:(NSString *)chinese hasSoundMark:(BOOL)hasOrNot {
    CFMutableStringRef chineseMutableStringRef = CFStringCreateMutableCopy(NULL, 0, (__bridge CFStringRef) chinese);

    CFStringTransform(chineseMutableStringRef, NULL, kCFStringTransformMandarinLatin, NO);
    if (!hasOrNot) {
        CFStringTransform(chineseMutableStringRef, NULL, kCFStringTransformStripDiacritics, NO);
    }

    return (__bridge NSString *) (chineseMutableStringRef);
}

@end
