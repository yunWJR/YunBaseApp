//
// Created by yun on 2017/4/25.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunAppItem : NSObject

+ (UIWindow *)appWindow;

+ (UIWindow *)getCurWindow;

// 禁止手机睡眠
+ (void)stopIdle;

// 跳进app设置
+ (void)gotoSettingView;

// 隐藏键盘
+ (void)hideKb;

// 单位:M
+ (CGFloat)getCacheSize;

// 清除缓存
- (void)clearCache;

// 手机型号
+ (NSString *)getDeviceInfo;

// 获取当前正在显示的控制器
+ (UIViewController *)getVisibleVcFrom:(UIViewController *)vc;

// 跳转 app store 评论
+ (BOOL)gotoAppStoreComment;

// 跳转app store
+ (BOOL)gotoAppStore;

@end