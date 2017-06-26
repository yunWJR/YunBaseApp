//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunErrorModel.h"

@implementation YunErrorModel

- (instancetype)initWithType:(YunErrorType)type code:(NSInteger)code msg:(NSString *)msg {
    self = [super init];
    if (self) {
        self.type = type;
        self.code = code;
        self.msg = msg;
    }

    return self;
}

+ (instancetype)itemWithType:(YunErrorType)type code:(NSInteger)code msg:(NSString *)msg {
    return [[self alloc] initWithType:type code:code msg:msg];
}


@end