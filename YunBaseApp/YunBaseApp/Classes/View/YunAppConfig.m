//
// Created by yun on 2017/8/2.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppConfig.h"
#import "YunAppViewController.h"
#import "YunAppViewController+CoverView.h"
#import "YunYunAppViewControllerDelegate.h"
#import "YunAppViewController+Nag.h"

@interface YunAppConfig () <YunAppViewControllerDelegate> {
}

@property (nonatomic, weak) id <YunAppViewControllerDelegate> defDelegate;

@end

@implementation YunAppConfig

+ (YunAppConfig *)instance {
    static YunAppConfig *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _viewUpdateInterval = 120;
        _defDelegate = self;
    }

    return self;
}

- (id <YunAppViewControllerDelegate>)appDelegate {
    return _defDelegate;
}

#pragma mark - YunAppViewControllerDelegate

- (void)didInitVcData:(YunAppViewController *)sender {
    if (_customDelegate && [_customDelegate respondsToSelector:@selector(didInitVcData:)]) {
        [_customDelegate didInitVcData:sender];
    }
}

- (void)didInitVcSubViews:(YunAppViewController *)sender {
    if (_isDefDelegateOn) {
        [sender initDefBlankView];

        [sender setNagBackItem];
    }

    if (_customDelegate && [_customDelegate respondsToSelector:@selector(didInitVcSubViews:)]) {
        [_customDelegate didInitVcSubViews:sender];
    }
}

- (void)startLoadData:(YunAppViewController *)sender {
    if (_isDefDelegateOn) {
        [sender showLoadView:sender.firstLoad];
    }

    if (_customDelegate && [_customDelegate respondsToSelector:@selector(startLoadData:)]) {
        [_customDelegate startLoadData:sender];
    }
}

- (void)startUpdateVcState:(YunAppViewController *)sender {
    if (_customDelegate && [_customDelegate respondsToSelector:@selector(startUpdateVcState:)]) {
        [_customDelegate startUpdateVcState:sender];
    }
}

- (void)didUpdateVcStateCmp:(YunAppViewController *)sender {
    if (_isDefDelegateOn) {
        [sender hideLoadView];
    }

    if (_customDelegate && [_customDelegate respondsToSelector:@selector(didUpdateVcStateCmp:)]) {
        [_customDelegate didUpdateVcStateCmp:sender];
    }
}

@end