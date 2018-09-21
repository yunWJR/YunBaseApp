//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAccountMgHelper.h"
#import "YunAccountMg.h"

@interface YunAccountMgHelper () {
}

@property (nonatomic, strong) YunAccountMg *curMg;

@end

@implementation YunAccountMgHelper

+ (YunAccountMg *)mg {
    return YunAccountMgHelper.instance.curMg;
}

+ (void)setMg:(YunAccountMg *)mg {
    YunAccountMgHelper.instance.curMg = mg;
}

- (YunAccountMg *)curMg {
    if (_curMg == nil) {
        _curMg = [YunAccountMg new];
    }

    return _curMg;
}

+ (instancetype)instance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}


@end