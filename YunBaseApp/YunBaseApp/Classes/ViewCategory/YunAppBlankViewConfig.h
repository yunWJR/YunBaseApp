//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunAppBlankViewConfig : NSObject

@property (nonatomic, assign) BOOL isFullLoad;

@property (nonatomic, strong) UIColor *loadViewBgColor;

+ (instancetype)instance;

@end