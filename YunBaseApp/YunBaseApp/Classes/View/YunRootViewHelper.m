//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 yun. All rights reserved.
//

#import "YunRootViewHelper.h"

@interface YunRootViewHelper () {
}

@end

@implementation YunRootViewHelper

+ (instancetype)instance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _rootView = [[UIApplication sharedApplication].delegate window];
    }

    return self;
}


@end