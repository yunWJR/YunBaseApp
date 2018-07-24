//
// Created by yun on 2017/7/31.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAppView.h"
#import "YunAppViewController+CoverView.h"

typedef enum : NSInteger {
    ViewBvNoCtnView,
    ViewBvErrCtnView,
    ViewAlertView,
    ViewRqtAlertView,
    ViewBvMax
} ViewBlankViewItem;

@interface YunAppView (CoverView)

- (id)getBlankView:(ViewBlankViewItem)item;

- (void)setItem:(ViewBlankViewItem)item view:(id)view;

- (void)showErrCtnView:(NSString *)errMsg;

- (void)hideErrCtnView;

- (void)showNoCtnViewByImg:(NSString *)imgName;

- (void)showNoCtnView:(NSString *)msg;

- (void)showNoCtnView:(NSString *)msg frame:(CGRect)frame;

- (void)showNoCtnView;

- (void)hideNoCtnView;

- (void)setNoCtnSelfBlock:(void (^)(void))block;

- (void)showNoNetView;

- (void)hideNoNetView;

- (void)showLoadView:(BOOL)hasBg;

- (void)hideLoadView;

- (void)hideBlankView;

@end