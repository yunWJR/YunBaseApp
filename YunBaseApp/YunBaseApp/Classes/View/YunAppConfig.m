//
// Created by yun on 2017/8/2.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppConfig.h"

@interface YunAppConfig () {
}

@end

@implementation YunAppConfig

+ (YunAppConfig *)instance {
    static YunAppConfig *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _viewUpdateInterval = 120;
    }

    return self;
}

@end