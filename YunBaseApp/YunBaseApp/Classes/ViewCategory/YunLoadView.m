//
// Created by yun on 16/6/28.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <YunKits/YunUILabelFactory.h>
#import <YunKits/YunValueVerifier.h>
#import "YunLoadView.h"
#import "MBProgressHUD.h"
#import "YunAppBlankViewConfig.h"
#import "YunAppTheme.h"
#import "YunAppTheme+Font.h"
#import "YunAppThemeHeader.h"

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

    _cmtLbl = [YunUILabelFactory labelWithText:@""
                                          font:[YunAppTheme fontN:16]
                                         color:YunAppTheme.colorBaseDark
                                         align:NSTextAlignmentCenter
                                         lines:0
                                        adjust:NO];

    [self addSubview:_backView];
    [self addSubview:_cmtLbl];

    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.size.equalTo(self);
    }];

    [_cmtLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self).offset(60);
        make.width.equalTo(self).offset(-80);
        make.centerX.equalTo(self);
    }];
}

#pragma mark - public functions

- (void)showWithBg:(BOOL)hasBack {
    [self showWithBg:hasBack cmt:nil];
}

- (void)showWithBg:(BOOL)hasBack cmt:(NSString *)cmt {
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

    _cmtLbl.text = cmt;
    _cmtLbl.hidden = [YunValueVerifier isInvalidStr:cmt];

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
