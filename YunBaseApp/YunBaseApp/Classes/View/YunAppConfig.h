//
// Created by yun on 2017/8/2.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunAppConfig : NSObject

// 默认 120秒
@property (nonatomic, assign) NSTimeInterval viewUpdateInterval;

@property (nonatomic, assign) BOOL isHideNagBtmLine;

+ (YunAppConfig *)instance;

@end