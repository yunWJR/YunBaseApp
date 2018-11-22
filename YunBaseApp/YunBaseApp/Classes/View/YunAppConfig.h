///
/// Created by yun on 2017/8/2.
/// Copyright (c) 2017 yun. All rights reserved.
///

#import <UIKit/UIKit.h>

@protocol YunAppViewControllerDelegate;

@interface YunAppConfig : NSObject

/// 界面更新间隔时间：默认 120秒
@property (nonatomic, assign) NSTimeInterval viewUpdateInterval;

@property (nonatomic, assign) BOOL isHideNagBtmLine;

@property (nonatomic, assign) CGFloat defVcSideOff;
@property (nonatomic, assign) CGFloat defViewSideOff;

/// 默认的appDelegate 响应开关：默认 YES
@property (nonatomic, assign) BOOL isDefDelegateOn;

/// 自定义appDelegate，除了响应默认的appDelegate，还将响应自定义的appDelegate。
@property (nonatomic, weak) id <YunAppViewControllerDelegate> customDelegate;

+ (YunAppConfig *)instance;

- (id <YunAppViewControllerDelegate>)appDelegate;

@end