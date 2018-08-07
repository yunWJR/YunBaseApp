//
// Created by yun on 2017/6/28.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAppViewController+CoverView.h"
#import <YunKits/YunConfig.h>
#import "YunCoverView.h"
#import "YunLoadView.h"
#import "YunLoadViewHelper.h"
#import "YunAppBlankViewConfig.h"

@implementation YunAppViewController (CoverView)

#pragma mark - blankList

- (id)getBlankView:(VcBlankViewItem)item {
    if (self.blankViewList == nil) {
        self.blankViewList = [NSMutableArray new];
        for (int i = 0; i < VcBvMax; ++i) {
            [self.blankViewList addObject:@""];
        }
    }

    id itemV = self.blankViewList[item];
    if ([itemV isKindOfClass:NSString.class]) {
        return nil;
    }

    return itemV;
}

- (void)setItem:(VcBlankViewItem)item view:(id)view {
    self.blankViewList[item] = view;
}

#pragma mark - err ctn

- (void)showErrCtnView:(NSString *)errMsg {
    [self hideBlankView];

    YunCoverView *noCtn = [self getErrCtnView];
    if (noCtn) {
        [noCtn updateMsg:errMsg];
        noCtn.hidden = NO;
    }

    [self.view bringSubviewToFront:noCtn];
}

- (void)hideErrCtnView {
    YunCoverView *noCtn = [self getErrCtnView];
    if (noCtn) {
        noCtn.hidden = YES;
    }
}

- (YunCoverView *)getErrCtnView {
    YunCoverView *view = (YunCoverView *) self.ctnErrView;
    if (view == nil) {
        view = [YunCoverView itemWithMsg:@"出错了！"
                                     img:YunConfig.instance.imgViewNoNetName
                                btnTitle:@"点击重试" btnTag:1];
        view.backgroundColor = YunAppTheme.colorBaseWhite;
        [view setBgColor:YunAppTheme.colorBaseWhite];
        WEAK_SELF
        view.didBtnClick = ^(NSInteger btnTag) {
            [weakSelf handleRetryByErrCtn];
        };

        [self.view addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.view);
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view);
        }];

        self.ctnErrView = view;
    }

    return view;
}

- (void)handleRetryByErrCtn {
    self.firstLoad = YES;
    self.hasUpdated = NO;
    self.needUpdateData = NO;

    WEAK_SELF
    self.didUpdateVcState = ^{
        [weakSelf hideGeneraBlankView];  // 视觉优化 todo
    };

    [self viewDidAppear:NO];
}

#pragma mark - no ctn blank

- (void)initDefBlankView {
    if (self.defBlankView == nil) {
        self.defBlankView = [YunView new];
        self.defBlankView.backgroundColor = YunAppTheme.colorBaseWhite;
    }
}

#pragma mark - no ctn

- (void)showNoCtnViewByImg:(NSString *)imgName {
    [self hideBlankView];

    YunCoverView *noCtn = [self getNoCtnView];
    [noCtn updateMsg:@""];
    [noCtn setImageWithName:imgName];

    [self.view bringSubviewToFront:noCtn];
}

- (void)showNoCtnView:(NSString *)msg {
    [self hideBlankView];

    YunCoverView *noCtn = [self getNoCtnView];
    [noCtn updateMsg:msg];

    [self.view bringSubviewToFront:noCtn];
}

- (void)showNoCtnView {
    [self showNoCtnView:self.noCtnMsg];
}

- (void)hideNoCtnView {
    if (self.noCtnView) {
        self.noCtnView.hidden = YES;
    }

    [self hideGeneraBlankView];
}

- (YunCoverView *)getNoCtnView {
    YunCoverView *view = (YunCoverView *) self.noCtnView;
    if (view == nil) {
        view = [YunCoverView itemWithMsg:@"无内容"
                                     img:YunConfig.instance.imgViewNoCtnImgName];
        view.backgroundColor = YunAppTheme.colorBaseWhite;

        [self.view addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.width.equalTo(self.view);
            make.centerX.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];

        self.noCtnView = view;
    }

    view.hidden = NO;
    return view;
}

- (void)setNoCtnSelfBlock:(void (^)(void))block {
    YunCoverView *bv = self.getNoCtnView;

    [bv setSelfBlock:block];
}

#pragma mark - no net

- (void)showNoNetView {
    [self hideBlankView];

    YunCoverView *noNet = [self getNoNetView];

    [self.view bringSubviewToFront:noNet];
}

- (void)hideNoNetView {
    if (self.netErrView) {
        self.netErrView.hidden = YES;
    }
}

- (YunCoverView *)getNoNetView {
    YunCoverView *view = (YunCoverView *) self.netErrView;
    if (view == nil) {
        view = [YunCoverView itemWithMsg:@"网络错误，请检查您的网络后重试！"
                                     img:YunConfig.instance.imgViewNoNetName
                                btnTitle:@"点击重试" btnTag:1];
        view.backgroundColor = YunAppTheme.colorBaseWhite;
        [view setBgColor:YunAppTheme.colorBaseWhite];

        WEAK_SELF
        view.didBtnClick = ^(NSInteger btnTag) {
            [weakSelf handleRetryByNoNet];
        };

        [self.view addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.view);
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view);
        }];

        self.netErrView = view;
    }

    view.hidden = NO;
    return view;
}

- (void)handleRetryByNoNet {
    self.firstLoad = YES;
    self.hasUpdated = NO;
    self.needUpdateData = NO;

    WEAK_SELF
    self.didUpdateVcState = ^{
        [weakSelf hideGeneraBlankView];  // 视觉优化 todo
    };

    [self viewDidAppear:NO];
}

#pragma mark - load

- (void)showLoadView:(BOOL)hasBg {
    if (self.hideStateView) {
        return;
    }

    [self showLoadViewForce:hasBg];
}

// 忽略self.hideStateView属性
- (void)showLoadViewForce:(BOOL)hasBg {
    if (YunAppBlankViewConfig.instance.isFullLoad) {
        [YunLoadViewHelper.instance showLoadView:hasBg];
    }
    else {
        YunLoadView *loadView = [self getLoadViewInstance];
        [loadView showWithBg:hasBg];

        [self.view bringSubviewToFront:loadView];
    }
}

- (void)hideLoadView {
    if (YunAppBlankViewConfig.instance.isFullLoad) {
        [YunLoadViewHelper.instance hideLoadView];
    }
    else {
        YunLoadView *loadView = [self getLoadViewInstance];
        [loadView hiddenView];
    }
}

- (YunLoadView *)getLoadViewInstance {
    YunLoadView *view = (YunLoadView *) self.stateView;
    if (view == nil) {
        view = [YunLoadView new];

        [self.view addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self.view);
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(self.view);
        }];

        self.stateView = view;
    }

    view.hidden = NO;
    return view;
}

#pragma mark - msg

#pragma mark - handle

#pragma mark - private funtions

- (void)hideBlankView {
    [self hideGeneraBlankView];

    if (self.noCtnView) {
        self.noCtnView.hidden = YES;
    }

    if (self.msgView) {
        self.msgView.hidden = YES;
    }

    if (self.stateView) {
        self.stateView.hidden = YES;
        [(YunLoadView *) self.stateView stop];
    }
}

- (void)hideGeneraBlankView {
    [self hideNoNetView];
    [self hideErrCtnView];
}

@end