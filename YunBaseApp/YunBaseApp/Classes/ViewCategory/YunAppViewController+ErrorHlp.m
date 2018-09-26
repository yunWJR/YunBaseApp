//
// Created by yun on 2017/7/31.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAppViewController+ErrorHlp.h"
#import "YunAppViewController+CoverView.h"
#import "YunAppViewController+AlertView.h"
#import "YunAccountMgHelper.h"
#import "YunAccountMg.h"

@implementation YunAppViewController (ErrorHlp)

#pragma mark - rqt view

- (void)showRqtErrorView:(YunErrorHelper *)error
                  inView:(UIView *)superView
            reloadAction:(void (^)(YunErrorHelper *))rlAction
            resultAction:(void (^)(YunErrorHelper *))rstAction {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self hideLoadView];

        [self showError:error superView:superView rst:^{
            if (rstAction) {
                rstAction(error);
            }
        }];
    });
}

- (void)showRqtErrorView:(YunErrorHelper *)error
                  inView:(UIView *)superView
            reloadAction:(void (^)(YunErrorHelper *))action {
    [self showRqtErrorView:error inView:superView reloadAction:action resultAction:nil];
}

- (void)showRqtErrorView:(YunErrorHelper *)error
            resultAction:(void (^)(YunErrorHelper *))action {
    [self showRqtErrorView:error inView:nil reloadAction:action resultAction:nil];
}

- (void)showRqtError:(YunErrorHelper *)error {
    [self showRqtErrorView:error inView:nil reloadAction:nil resultAction:nil];
}

- (void)showError:(YunErrorHelper *)helper superView:(UIView *)view rst:(void (^)(void))rst {
    YunErrorModel *err = helper.getError;

    if (err.code == YunErrTypeMustUpdate) {
        if (YunErrorConfig.instance.didErrorOn) {
            YunErrorConfig.instance.didErrorOn(err, NO);
        }
        return;
    }

    if (err.type == YunErrTypeOutOfLogin) {
        [YunAccountMgHelper.mg removeAcct];

        [YunAlertViewHelper.instance showYes:err.getMsgByMode result:^(BOOL yes) {
            if (YunErrorConfig.instance.didErrorOn) {
                YunErrorConfig.instance.didErrorOn(err, NO);
            }
        }];

        return;
    }

    if (err.type == YunErrTypeNoCtnAndGoBack) {
        [YunAlertViewHelper.instance showYes:err.getMsgByMode result:^(BOOL yes) {
            [self didClickNagLeftItem];
        }];

        return;
    }

    if (!self.hasUpdated) { // 第一次加载
        if (err.type == YunErrTypeNetWork) {
            [self showNoNetView];
        }
        else {
            [self showErrCtnView:err.getMsgByMode];
        }

        if (YunErrorConfig.instance.didErrorOn) {
            YunErrorConfig.instance.didErrorOn(err, YES);
        }
        return;
    }

    // 一个 alert view
    if (self.hideStateView) {
        [self showRqtAlert:err.getMsgByMode sv:self.view result:rst];
    }
    else {
        [self showRqtAlert:err.getMsgByMode sv:nil result:rst];
    }

    if (YunErrorConfig.instance.didErrorOn) {
        YunErrorConfig.instance.didErrorOn(err, YES);
    }
}

@end
