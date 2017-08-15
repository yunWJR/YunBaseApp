//
// Created by yun on 2017/4/25.
// Copyright (c) 2017 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunAppItem : NSObject

+ (UIWindow *)appWindow;

+ (UIWindow *)getCurWindow;

// 禁止手机睡眠
+ (void)stopIdle;

// 跳进app设置
+ (void)gotoSettingView;

+ (void)hideKb;

// M
+ (CGFloat)getCacheSize;

- (void)clearCache;

+ (NSString *)getDeviceInfo;

// 获取当前正在显示的控制器
+ (UIViewController *)getVisibleVcFrom:(UIViewController *)vc;

+ (BOOL)gotoAppStoreComment;

+ (BOOL)gotoAppStore;

@end