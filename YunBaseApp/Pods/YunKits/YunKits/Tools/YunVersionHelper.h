//
// Created by yun on 2017/11/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^YunVersionHelperBlock)(NSString *curVer, NSString *appStVer, NSString *openUrl, BOOL isUpdate);

@interface YunVersionHelper : NSObject

// 1.0.0
+ (NSString *)appVersion;

// 100
+ (NSString *)appVersionStr;

// 2.0.0 比较 1.0.0
+ (BOOL)shouldUpdate:(NSString *)serverVersion;

// 默认bundleId
+ (void)checkAppStUpdate:(YunVersionHelperBlock)block;

// 可自定义appId或bundleId
+ (void)checkAppStUpdateWithAppId:(NSString *)appId
                     withBundleId:(NSString *)bundleId
                            block:(YunVersionHelperBlock)block;

@end