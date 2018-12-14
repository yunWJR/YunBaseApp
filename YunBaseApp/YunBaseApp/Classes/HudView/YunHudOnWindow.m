//
// Created by yun on 2017/7/12.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunHudOnWindow.h"
#import "YunAppItem.h"

@implementation YunHudOnWindow {
    UIView *_superView;

    UIVisualEffectView *_blurV;

    CGFloat _blurOp;
}

#pragma mark - main

#pragma mark - main

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initViews];
    }

    return self;
}

- (void)initViews {
    _blurOp = 0.97f;

    _bgColor = [UIColor colorWithRed:0
                               green:0
                                blue:0
                               alpha:0.5f];

    _blurStyle = UIBlurEffectStyleLight;
    _blur = YES;
    _hideAuto = YES;
    _amt = YES;
    _showAmtDur = 0.3f;
    _hideAmtDur = 0.2f;

    self.layer.opacity = 0.0f;
}

#pragma mark - request functions

#pragma mark - handles

- (void)didClickBg {
    [self hideView];
}

#pragma mark - public functions

- (void)setViewStyle {
    [self setView:_bgColor blur:_blur hideAuto:_hideAuto];
}

- (void)setView:(UIColor *)bg blur:(BOOL)blur hideAuto:(BOOL)hideAuto {
    if (bg && !blur) {
        self.backgroundColor = bg;
    }

    if (blur) {
        UIView *bgView = [YunUIViewFactory viewWithBgColor:bg];
        [self addSubview:bgView];

        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.size.equalTo(self);
        }];

        _blurV = [[UIVisualEffectView alloc] initWithEffect:
                [UIBlurEffect effectWithStyle:_blurStyle]];
        _blurV.alpha = _blurOp;
        [bgView addSubview:_blurV];

        [_blurV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgView);
            make.left.equalTo(bgView);
            make.size.equalTo(bgView);
        }];
    }

    if (hideAuto) {
        UIButton *btn = [YunUIButtonFactory btnWithTarget:self action:@selector(didClickBg)];

        [self addSubview:btn];

        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.left.equalTo(self);
            make.size.equalTo(self);
        }];
    }
}

- (void)initSubClass {
}

- (void)showView:(void (^)(BOOL finished))cmp {
    [self removeAllSubView];

    [self setViewStyle];

    [self initSubClass];

    if (_superView == nil) {
        _superView = YunAppItem.appWindow;
    }

    [self removeFromSuperview];

    if (_isAmtBtmToUp) {
        [self showBtmToUp:cmp];
        return;
    }

    [_superView addSubview:self];

    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_superView);
        make.left.equalTo(_superView);
        make.size.equalTo(_superView);
    }];

    if (_amt) {
        _isShow = YES;
        [UIView animateWithDuration:_showAmtDur * 0.5f
                         animations:^{
                             self.layer.opacity = 1.0f;
                         } completion:^(BOOL finished) {
             if (_blurV) {
                 [UIView animateWithDuration:_showAmtDur * 0.5f
                                  animations:^{
                                      _blurV.alpha = _blurOp;
                                  } completion:^(BOOL finished2) {
                      if (cmp)(cmp(finished));
                  }];
             }
             else {
                 if (cmp)(cmp(finished));
             }
         }];
    }
    else {
        _isShow = YES;
        self.layer.opacity = 1.0f;
        _blurV.alpha = _blurOp;
        [self layoutIfNeeded];

        if (cmp)(cmp(YES));
    }
}

- (void)showBtmToUp:(void (^)(BOOL finished))cmp {
    [_superView addSubview:self];

    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_superView);
        make.left.equalTo(_superView);
        make.size.equalTo(_superView);
    }];

    self.layer.opacity = 1.0f;

    if (_blurV) {
        _blurV.alpha = _blurOp;
    }

    [_superView layoutIfNeeded];

    [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.left.equalTo(self);
        make.width.equalTo(self);
    }];

    if (_amt) {
        _isShow = YES;
        [UIView animateWithDuration:_showAmtDur * 0.5f
                         animations:^{
                             [self layoutIfNeeded];
                         } completion:^(BOOL finished) {

             if (cmp)(cmp(finished));
         }];
    }
    else {
        _isShow = YES;

        [self layoutIfNeeded];

        if (cmp)(cmp(YES));
    }
}

- (void)showView {
    [self showView:nil];
}

- (void)hideView {
    if (!_isShow) { // 隐藏的不再隐藏
        return;
    }

    if (_isAmtBtmToUp) {
        [self hideTopToBtm];
        return;
    }

    if (_amt) {
        [UIView animateWithDuration:_hideAmtDur * 0.5f
                         animations:^{
                             _blurV.alpha = 0.0;
                         }
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:_hideAmtDur * 0.5f
                                              animations:^{
                                                  self.layer.opacity = 0.0f;
                                              }
                                              completion:^(BOOL finished2) {
                                                  [self handleRemove];
                                              }];
                         }];
    }
    else {
        [self handleRemove];
    }
}

- (void)hideTopToBtm {
    if (_amt) {
        [self.contentView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_bottom);
            make.left.equalTo(self);
            make.width.equalTo(self);
        }];

        [UIView animateWithDuration:_hideAmtDur * 0.5f
                         animations:^{
                             [self layoutIfNeeded];
                         }
                         completion:^(BOOL finished) {
                             [self handleRemove];
                         }];
    }
    else {
        [self handleRemove];
    }
}

- (void)handleRemove {
    if (_didViewWillDis) {
        _didViewWillDis();

        _didViewWillDis = nil; // 防止多次调用
    }

    [self removeFromSuperview];

    _isShow = NO;
}

#pragma mark - private functions

#pragma mark - protocol

@end