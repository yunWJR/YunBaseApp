//
// Created by yun on 2017/8/2.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YunAppViewControllerDelegate;

@interface YunAppConfig : NSObject

// 默认 120秒
@property (nonatomic, assign) NSTimeInterval viewUpdateInterval;

@property (nonatomic, assign) BOOL isHideNagBtmLine;

@property (nonatomic, assign) CGFloat defVcSideOff;
@property (nonatomic, assign) CGFloat defViewSideOff;

@property (nonatomic, weak) id <YunAppViewControllerDelegate> appDelegate;

+ (YunAppConfig *)instance;

@end