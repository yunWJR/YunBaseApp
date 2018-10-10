//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunAppView.h"
#import "YunAppConfig.h"
#import "YunAppViewController.h"

@interface YunAppView ()

// 指定的SuperVc
@property (nonatomic, weak) UIViewController *appointSuperVc;

@end

@implementation YunAppView {
}

- (instancetype)init {
    if (self = [super init]) {
        [self initViewDataAndState];
    }
    return self;
}

// - (void)dealloc {} 施放对象

#pragma mark - app view flow

- (void)initViewDataAndState {
    self.firstLoad = YES;
    self.needUpdateData = NO;

    _updateInterval = YunAppConfig.instance.viewUpdateInterval;

    _noCtnMsg = @"无内容";

    self.sideOff = YunAppConfig.instance.defViewSideOff;

    if (YunAppTheme.colorViewBg) {
        self.backgroundColor = YunAppTheme.colorViewBg;
    }
}

- (void)updateWhenViewAppear {
    [self showDefBlankView];

    if (self.shouldLoadData) {
        if (self.needUpdateData || self.canUpdate) {
            [self loadViewData];
        }
    }
}

- (void)loadViewData {
    [self setCurUpdateDate];
}

- (void)updateViewState {
    [self updateViewStateOn];

    [self updateViewStateCmp];
}

- (void)updateViewStateOn {
    self.hasUpdated = YES;
    [self setCurUpdateDate];

    [self setLoadDataCmp];
}

- (void)updateViewStateCmp {
    [self hideDefBlankView];
}

- (BOOL)shouldLoadData {
    return self.firstLoad || self.needUpdateData;
}

- (void)setLoadDataCmp {
    self.firstLoad = NO;
    self.needUpdateData = NO;
}

#pragma mark - public funtions

- (void)updateData:(BOOL)force {
}

- (UIViewController *)superVC {
    if (_appointSuperVc == nil) {
        return [self superViewController];
    }
    else {
        return _appointSuperVc;
    }
}

- (void)setSuperVC:(UIViewController *)superVC {
    _appointSuperVc = superVC;
}

- (YunAppViewController *)superAppVc {
    id sVc = self.superVC;
    if ([sVc isKindOfClass:YunAppViewController.class]) {
        return sVc;
    }

    return nil;
}

#pragma mark - private funtions

- (void)showDefBlankView {
    if (self.defBlankView) {
        self.defBlankView.hidden = NO;

        [self addSubview:self.defBlankView];

        [self.defBlankView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.width.equalTo(self);
            make.left.equalTo(self);
            make.bottom.equalTo(self);
        }];

        [self bringSubviewToFront:self.defBlankView];
    }
}

- (void)hideDefBlankView {
    if (self.defBlankView) {
        self.defBlankView.hidden = YES;
        [self.defBlankView removeFromSuperview];

        self.defBlankView = nil;
    }
}

#pragma mark - request functions

- (void)rqtDataFromServer:(BOOL)force {
    if (force || self.canUpdate) {
        [self rqtDataFromServer];
    }
    else {
        return;
    }
}

- (void)rqtDataFromServer {
    [self setCurUpdateDate];
}

- (void)rqtMoreDataFromServer {
}

- (void)updateVcData {
    self.hasUpdated = YES;
    [self setCurUpdateDate];
}

#pragma mark - update date

- (void)setCurUpdateDate {
    _lastUpdateDate = [NSDate date];
}

- (BOOL)canUpdate {
    if (_lastUpdateDate == nil) {
        return YES;
    }

    NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:_lastUpdateDate];
    return time > _updateInterval;
}

@end