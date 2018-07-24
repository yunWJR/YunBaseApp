//
// Created by yun on 2017/6/28.
// Copyright (c) 2017 skkj. All rights reserved.
//


#import "YunAppViewController.h"

typedef enum : NSInteger {
    Bk_No_Search,
    Bk_No_Net,
} BlankCtnType;

typedef enum : NSInteger {
    VcBvNoCtnView,
    VcBvErrCtnView,
    VcAlertView,
    VcRqtAlertView,
    VcBvMax
} VcBlankViewItem;

@interface YunAppViewController (CoverView)

// NO CTN

- (void)initDefBlankView;

- (void)showNoCtnViewByImg:(NSString *)imgName;

- (void)showNoCtnView:(NSString *)msg;

- (void)showNoCtnView;

- (void)hideNoCtnView;

//

- (id)getBlankView:(VcBlankViewItem)item;

- (void)setItem:(VcBlankViewItem)item view:(id)view;

- (void)showErrCtnView:(NSString *)errMsg;

- (void)hideErrCtnView;

- (void)setNoCtnSelfBlock:(void (^)(void))block;

- (void)showNoNetView;

- (void)hideNoNetView;

- (void)showLoadView:(BOOL)hasBg;

- (void)showLoadViewForce:(BOOL)hasBg;

- (void)hideLoadView;

- (void)hideBlankView;

@end
