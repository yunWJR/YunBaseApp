//
// Created by yun on 2017/7/31.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAppViewController.h"

@interface YunAppViewController (ErrorHlp)

- (void)showRqtError:(YunErrorHelper *)error;

- (void)showRqtErrorView:(YunErrorHelper *)error
                  inView:(UIView *)superView
            reloadAction:(void (^)(YunErrorHelper *))action;

- (void)showRqtErrorView:(YunErrorHelper *)error resultAction:(void (^)(YunErrorHelper *))action;

@end