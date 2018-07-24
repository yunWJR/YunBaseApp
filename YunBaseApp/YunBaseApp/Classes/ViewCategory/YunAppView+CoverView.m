//
// Created by yun on 2017/7/31.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAppView+CoverView.h"
#import <YunKits/YunConfig.h>
#import "YunCoverView.h"
#import "YunLoadView.h"
#import "YunAppBlankViewConfig.h"
#import "YunLoadViewHelper.h"

@implementation YunAppView (CoverView)

#pragma mark - blankList

- (id)getBlankView:(ViewBlankViewItem)item {
    if (self.blankViewList == nil) {
        self.blankViewList = [NSMutableArray new];
        for (int i = 0; i < ViewBvMax; ++i) {
            [self.blankViewList addObject:@""];
        }
    }

    id itemV = self.blankViewList[item];
    if ([itemV isKindOfClass:NSString.class]) {
        return nil;
    }

    return itemV;
}

- (void)setItem:(ViewBlankViewItem)item view:(id)view {
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

    [self bringSubviewToFront:noCtn];
}

- (void)hideErrCtnView {
    YunCoverView *noCtn = [self getErrCtnView];
    if (noCtn) {
        noCtn.hidden = YES;
    }
}

- (YunCoverView *)getErrCtnView {
    YunCoverView *view = (YunCoverView *) [self noCtnView];
    if (view == nil) {
        view = [YunCoverView itemWithMsg:@"网络错误，请检查您的网络后重试！"
                                     img:YunConfig.instance.imgViewNoNetName
                                btnTitle:@"点击重试" btnTag:1];
        WEAK_SELF
        view.didBtnClick = ^(NSInteger btnTag) {
            [weakSelf handleRetryByErrCtn];
        };

        [self addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self);
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
        }];

        //[self setItem:ViewBvErrCtnView view:view];
    }

    return view;
}

- (void)handleRetryByErrCtn {
    self.firstLoad = YES;
    self.hasUpdated = NO;
    self.needUpdateData = NO;

    [self updateData:YES];
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

    [self bringSubviewToFront:noCtn];
}

- (void)showNoCtnView:(NSString *)msg {
    [self hideBlankView];

    YunCoverView *noCtn = [self getNoCtnView];
    [noCtn updateMsg:msg];

    [self bringSubviewToFront:noCtn];
}

- (void)showNoCtnView:(NSString *)msg frame:(CGRect)frame {
    [self hideBlankView];

    YunCoverView *noCtn = [self getNoCtnView];
    [noCtn updateMsg:msg];

    [self bringSubviewToFront:noCtn];
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

        [self addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.width.equalTo(self);
            make.centerX.equalTo(self);
            make.bottom.equalTo(self);
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

    [self bringSubviewToFront:noNet];
}

- (void)hideNoNetView {
    if (self.noNetView) {
        self.noNetView.hidden = YES;
    }
}

- (YunCoverView *)getNoNetView {
    YunCoverView *view = (YunCoverView *) self.noNetView;
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

        [self addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self);
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
        }];

        self.noNetView = view;
    }

    view.hidden = NO;
    return view;
}

- (void)handleRetryByNoNet {
    [self hideNoNetView];

    self.firstLoad = YES;
    self.hasUpdated = NO;

    [self updateData:YES];
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

        [self bringSubviewToFront:loadView];
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

        [self addSubview:view];

        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.equalTo(self);
            make.centerX.equalTo(self);
            make.centerY.equalTo(self);
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

    if (self.noNetView) {
        self.noNetView.hidden = YES;
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