//
// Created by yun on 16/6/28.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunLoadView.h"
#import "MBProgressHUD.h"
#import "YunAppBlankViewConfig.h"

@implementation YunLoadView {
    UIView *_backView;

    MBProgressHUD *_progressHUD;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initSubView];
    }

    return self;
}

- (void)initSubView {
    self.backgroundColor = [UIColor clearColor];

    self.alpha = 0.0f;

    _backView = [UIView new];

    [self addSubview:_backView];

    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.size.equalTo(self);
    }];
}

#pragma mark - public functions

- (void)showWithBg:(BOOL)hasBack {
    self.hidden = NO;
    if (hasBack) {
        UIColor *bgCl = _bgColor ?
                        _bgColor :
                        YunAppBlankViewConfig.instance.loadViewBgColor ?
                        YunAppBlankViewConfig.instance.loadViewBgColor :
                        [UIColor colorWithRed:0
                                        green:0
                                         blue:0
                                        alpha:0.3f];

        _backView.backgroundColor = bgCl;
    }
    else {
        _backView.backgroundColor = [UIColor clearColor];
    }

    _progressHUD = [MBProgressHUD showHUDAddedTo:self animated:YES];

    [UIView animateWithDuration:0.1
                     animations:^{
                         self.alpha = 1.0f;
                     }];
}

- (void)hiddenView {
    [UIView animateWithDuration:0.1
                     animations:^{
                         self.alpha = 0.0f;
                     }];
}

- (void)stop {
    [_progressHUD hideAnimated:NO];
}

#pragma mark - handle

@end
