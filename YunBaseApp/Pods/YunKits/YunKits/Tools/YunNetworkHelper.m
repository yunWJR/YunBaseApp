//
//  YunNetworkHelper.m
//  Report
//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunGlobalDefine.h"
#import "YunNetworkHelper.h"
#import "AFNetworkReachabilityManager.h"

const NSString *yun_network_status_changed_key = @"yun_network_status_changed_key";

@interface YunNetworkHelper () {
    BOOL _started;
}

@end

@implementation YunNetworkHelper

+ (instancetype)instance {
    static YunNetworkHelper *sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];

        [sharedInstance startMonitor];
    });

    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)startMonitor {
    // 网络状态检测
    WEAK_SELF
    [[AFNetworkReachabilityManager sharedManager]
                                   setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
                                       [weakSelf handleStatusChanged:status];
                                   }];

    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)handleStatusChanged:(AFNetworkReachabilityStatus)status {
    _started = YES;

    if (_didStatusChanged) {
        _didStatusChanged(self.isNetworkAvailable);
    }

    [[NSNotificationCenter defaultCenter]
                           postNotificationName:yun_network_status_changed_key
                                         object:nil
                                       userInfo:@{@"status" : @(self.isNetworkAvailable)}];
}

- (void)isNetworkReachable:(void (^)(BOOL))result {
    if (result) {
        result(self.isNetworkAvailable);
    }
}

- (BOOL)isNetworkAvailable {
    return [AFNetworkReachabilityManager sharedManager].isReachable;
}

@end