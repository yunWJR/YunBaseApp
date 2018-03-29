//
//  YunNetworkHelper.h
//  Report
//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NETWORK_STATUS_NOTI_STR @"NETWORK_STATUS_NOTI_STR"

@interface YunNetworkHelper : NSObject

@property (nonatomic, copy) void (^didStatusChanged)(BOOL);

+ (instancetype)instance;

- (void)startMonitor;

- (void)isNetworkReachable:(void (^)(BOOL))result;

- (BOOL)isNetworkAvailable;

@end
