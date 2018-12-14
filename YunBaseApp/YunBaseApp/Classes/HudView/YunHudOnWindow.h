//
// Created by yun on 2017/7/12.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAppView.h"

@interface YunHudOnWindow : YunAppView {
}

@property (nonatomic, assign) UIBlurEffectStyle blurStyle;

@property (nonatomic, weak) UINavigationController *nc;

@property (nonatomic, weak) UIViewController *vc;

@property (nonatomic, copy) void (^didViewWillDis)(void);

@property (nonatomic, strong) UIColor *bgColor;

@property (nonatomic, assign) BOOL blur;

@property (nonatomic, assign) BOOL hideAuto;

@property (nonatomic, assign) BOOL amt;

@property (nonatomic, assign) CGFloat showAmtDur;

@property (nonatomic, assign) CGFloat hideAmtDur;

@property (nonatomic, weak) UIView *contentView;

@property (nonatomic, assign) BOOL isShow;

@property (nonatomic, assign) BOOL isAmtBtmToUp;

- (void)initSubClass;

- (void)showView:(void (^)(BOOL finished))cmp;

- (void)showView;

- (void)hideView;

- (void)handleRemove;

@end
