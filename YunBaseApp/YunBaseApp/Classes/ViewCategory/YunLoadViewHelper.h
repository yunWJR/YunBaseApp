//
// Created by yun on 2017/9/5.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YunLoadView;

@interface YunLoadViewHelper : NSObject

@property (nonatomic, strong) YunLoadView *loadView;

+ (YunLoadViewHelper *)instance;

- (void)showLoadView:(BOOL)hasBg;

- (void)hideLoadView;

@end