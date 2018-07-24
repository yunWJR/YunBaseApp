//
// Created by yun on 2018/7/23.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAlertView.h"
#import "YunAppThemeHeader.h"
#import "UILabel+YunAdd.h"
#import "YunSizeHelper.h"
#import "UIView+YunAdd.h"
#import "YunValueVerifier.h"

const NSInteger baseTag = 100;

@implementation YunAlertView {
}

- (void)initViewWithButtons:(NSArray<NSString *> *)btnTitles {
    // 无效数据
    if ((btnTitles == nil || btnTitles.count == 0) &&
        (_btnList == nil || _btnList.count == 0)) {
        return;
    }

    for (int l = 0; l < _btnList.count; ++l) {
        [_btnList[l] removeFromSuperview];
    }

    _btnList = [NSMutableArray new];

    for (int i = 0; i < btnTitles.count; ++i) {
        UIButton *btn = nil;

        if (_delegate && [_delegate respondsToSelector:@selector(createButtonWithTitle:index:)]) {
            btn = [_delegate createButtonWithTitle:btnTitles[i] index:i];
        }

        if (btn == nil) {
            btn = [UIButton new];;
            btn.backgroundColor = [YunAppTheme colorBaseHl];
            [btn setTitle:btnTitles[i] forState:UIControlStateNormal];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            btn.titleLabel.adjustsFontSizeToFitWidth = YES;
            btn.titleLabel.textColor = YunAppTheme.colorBaseWhite;
            btn.titleLabel.font = [YunAppTheme fontB:17];
        }

        [btn setViewDiameter:_btnHeight];

        [_btnList addObject:btn];
    }

    // 添加 tag 和 aciton
    for (int j = 0; j < _btnList.count; ++j) {
        if (_delegate && [_delegate respondsToSelector:@selector(buttonStype:index:)]) {
            UIButton *newBtn = [_delegate buttonStype:_btnList[j] index:j];
            if (newBtn) {
                _btnList[j] = newBtn;
            }
        }

        _btnList[j].tag = j + baseTag;
        [_btnList[j] addTarget:self action:@selector(didBtnClicked:) forControlEvents:UIControlEventTouchUpInside];

        [_contentView addSubview:_btnList[j]];
    }

    // 1个btn
    if (_btnList.count == 1) {

        [_btnList[0] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_ctnLabel.mas_bottom).offset(self.ctnIntervalV * 2);
            make.centerX.equalTo(_contentView);
            make.width.equalTo(_contentView).multipliedBy(0.5f);
            make.height.equalTo(@(_btnHeight));
            make.bottom.offset(-self.bottomOff);
        }];

        return;
    }

    for (int k = 0; k < _btnList.count; ++k) {
        [_btnList[k] mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_ctnLabel.mas_bottom).offset(self.ctnIntervalV * 2);
            make.bottom.offset(-self.bottomOff);
        }];
    }

    // 多个 btn
    [_btnList mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                          withFixedSpacing:self.ctnIntervalH
                               leadSpacing:self.sideOff
                               tailSpacing:self.sideOff];
}

- (void)initViews {
    if (self.topOff == 0) {
        self.topOff = 40;
    }

    if (self.bottomOff == 0) {
        self.bottomOff = 25;
    }

    if (self.sideOff == 0) {
        self.sideOff = 20;
    }

    if (self.ctnIntervalV == 0) {
        self.ctnIntervalV = 20;
    }

    if (self.ctnIntervalH == 0) {
        self.ctnIntervalH = 20;
    }

    if (_ctnViewSideOffset == 0) {
        _ctnViewSideOffset = 20;
    }

    if (_btnHeight == 0) {
        _btnHeight = 40;
    }

    if (_backView == nil) {
        _backView = [UIView new];
        _backView.backgroundColor = [UIColor colorWithRed:0
                                                    green:0
                                                     blue:0
                                                    alpha:0.3f];
    }

    if (_contentView == nil) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 10;
        _contentView.clipsToBounds = YES;
    }

    if (_titleLabel == nil) {
        _titleLabel = [UILabel new];
        _titleLabel.numberOfLines = 3;
        _titleLabel.font = [YunAppTheme fontB:18];
        _titleLabel.textColor = YunAppTheme.colorBaseDark;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }

    if (_ctnLabel == nil) {
        _ctnLabel = [UILabel new];
        _ctnLabel.numberOfLines = 10;
        _ctnLabel.font = [YunAppTheme fontN:18];
        _ctnLabel.textColor = YunAppTheme.colorBaseDark;
        _ctnLabel.backgroundColor = [UIColor clearColor];
        _ctnLabel.textAlignment = NSTextAlignmentCenter;
    }

    [self addSubview:_backView];
    [self addSubview:_contentView];

    [_contentView addSubview:_titleLabel];
    [_contentView addSubview:_ctnLabel];

    [_backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.size.equalTo(self);
    }];

    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.width.equalTo(self).offset(-_ctnViewSideOffset * 2);
    }];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_contentView).offset(self.topOff);
        make.centerX.equalTo(_contentView);
        make.width.equalTo(_contentView).offset(-self.sideOff * 2);
    }];

    [_ctnLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(self.ctnIntervalV);
        make.centerX.equalTo(_contentView);
        make.width.equalTo(_contentView).offset(-self.sideOff * 2);
        make.height.lessThanOrEqualTo(@([YunSizeHelper heightOn2x:YunSizeHelper.screenHeight * 0.7f]));
    }];
}

- (void)didBtnClicked:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(didItemOn:index:)]) {
        [_delegate didItemOn:sender index:sender.tag - baseTag];
    }

    if (_didBtnOn) {
        _didBtnOn(sender.tag - baseTag);
    }

    if (_delegate && [_delegate respondsToSelector:@selector(shouldHideViewWhenBtnOn:index:)]) {
        BOOL hide = [_delegate shouldHideViewWhenBtnOn:sender index:sender.tag - baseTag];
        if (hide) {
            [self hideView];
        }
    }
    else {
        [self hideView];
    }
}

- (void)setTitle:(NSString *)title ctn:(NSString *)ctn {
    _titleLabel.text = title;
    _ctnLabel.text = ctn;
}

- (void)showView {
    if (_superView == nil) {
        _superView = [[UIApplication sharedApplication].delegate window];
    }

    [self removeFromSuperview];

    if ([self superview] == nil) {
        [_superView addSubview:self];
        [_superView bringSubviewToFront:self];
    }

    [self mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_superView);
        make.left.equalTo(_superView);
        make.width.equalTo(_superView);
        make.height.equalTo(_superView);
    }];

    CGFloat lblHt = [UILabel calHeightByWidth:YunSizeHelper.screenWidth - _ctnViewSideOffset * 2 - self.sideOff * 2
                                         text:_ctnLabel.text
                                         font:_ctnLabel.font];
    if (lblHt > YunSizeHelper.screenHeight * 0.7f) {
        lblHt = YunSizeHelper.screenHeight * 0.7f;
    }

    CGFloat ctnTopOff = [YunValueVerifier isValidStr:_titleLabel.text] ? self.ctnIntervalV : 0;

    [_ctnLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).offset(ctnTopOff);
        make.height.equalTo(@(lblHt));
    }];

    //[_contentView mas_updateConstraints:^(MASConstraintMaker *make) {
    //    make.bottom.equalTo(_ctnLabel.mas_bottom).offset(self.bottomOff);
    //}];

    self.hidden = NO;
    self.layer.opacity = 0.0;
    [self layoutIfNeeded];

    [UIView animateWithDuration:0.3 animations:^{
        self.layer.opacity = 1;
        [self layoutIfNeeded];
    }];
}

- (void)hideView {
    [UIView animateWithDuration:0.3 animations:^{
        self.layer.opacity = 0.0;
        [self layoutIfNeeded];
    }                completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
    }];
}

- (void)hideViewWithNoAmt {
    self.hidden = YES;
    [self removeFromSuperview];
}

- (void)updateSuperView:(UIView *)view {
    _superView = view;
}

- (void)updateContent:(NSString *)content {
    _ctnLabel.text = content;
}

@end