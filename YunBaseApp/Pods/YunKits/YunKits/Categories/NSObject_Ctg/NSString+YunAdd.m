//
// Created by 王健 on 16/10/8.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "NSString+YunAdd.h"
#import "YunValueVerifier.h"

@implementation NSString (YunAdd)

- (NSString *)strByDefCtn:(NSString *)text {
    return [YunValueVerifier isNilOrEmptyStr:self] ? text : self;
}

@end