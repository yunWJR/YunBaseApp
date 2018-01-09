//
// Created by yun on 2017/11/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunVersionCheck : NSObject

/**
 block回调

 @param curVer 当前版本号
 @param appStVer 商店版本号
 @param openUrl 跳转到商店的地址
 @param isUpdate 是否为最新版本
 */
typedef void(^UpdateBlock)(NSString *curVer, NSString *appStVer, NSString *openUrl, BOOL isUpdate);

/**
 一行代码实现检测app是否为最新版本。appId，bundleId，随便传一个 或者都传nil 即可实现检测。

 @param appId    项目APPID，10位数字，有值默认为APPID检测，可传nil
 @param bundleId 项目bundelId，有值默认为bundelId检测，可传nil
 @param block    检测结果block回调
 */
+ (void)checkAppStUpdateWithAppId:(NSString *)appId withBundleId:(NSString *)bundleId block:(UpdateBlock)block;

@end
