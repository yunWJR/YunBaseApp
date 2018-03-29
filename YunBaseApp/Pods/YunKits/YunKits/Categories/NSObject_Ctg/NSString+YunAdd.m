//
// Created by yun on 16/10/8.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "NSString+YunAdd.h"
#import "YunValueVerifier.h"

@implementation NSString (YunAdd)

- (NSString *)strByDefCtn:(NSString *)ctn {
    return [YunValueVerifier isValidStr:self] ? self : ctn;
}

// 查询子字段个数
- (NSInteger)calSubCount:(NSString *)str {
    ////@"abcd123abcdrgabc"
    //@"abc"

    NSInteger count = 0;

    NSRange range = [self rangeOfString:str];
    if (range.location == NSNotFound) {
        return count;
    }

    //声明一个临时字符串,记录截取之后的字符串
    NSString *subStr = self;
    while (range.location != NSNotFound) {
        //只要进入循环就要count++
        count++;

        //每次记录之后,把找到的字串截取掉
        //range.location + range.length 得出的结果就是我们要截取的字符串起始索引的位置
        subStr = [subStr substringFromIndex:range.location + range.length];

        //每一次截取之后,要判断一些,截取完成剩余部分字符串,是否还有子串存在
        //如果存在,我们的while循环会继续运行,如果不存在while循环结束
        range = [subStr rangeOfString:str];
    }

    return count;
}

@end