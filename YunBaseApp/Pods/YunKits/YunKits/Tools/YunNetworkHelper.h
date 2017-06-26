//
//  YunNetworkHelper.h
//  Report
//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
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
