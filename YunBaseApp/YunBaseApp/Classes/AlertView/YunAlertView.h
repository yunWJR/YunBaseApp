///
/// Created by yun on 2018/7/23.
/// Copyright (c) 2018 skkj. All rights reserved.
///

#import <UIKit/UIKit.h>
#import "YunView.h"

@protocol YunAlertViewDelegate <NSObject>

@optional

- (void)didItemOn:(UIButton *)btn index:(NSInteger)index;

- (BOOL)shouldHideViewWhenBtnOn:(UIButton *)btn index:(NSInteger)index;

/// 创建 button，只设置样式，不设置 tag 和 action
- (UIButton *)createButtonWithTitle:(NSString *)title index:(NSInteger)index;

/// 设置样式
- (UIButton *)buttonStype:(UIButton *)btn index:(NSInteger)index;

@end

@interface YunAlertView : YunView

@property (nonatomic, weak) id <YunAlertViewDelegate> delegate;

@property (nonatomic, copy) void (^didBtnOn)(NSInteger index);

@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UIView *superView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *ctnLabel;

@property (nonatomic, strong) NSMutableArray<UIButton *> *btnList;

@property (nonatomic, assign) CGFloat ctnViewSideOffset;
@property (nonatomic, assign) CGFloat btnHeight;

- (void)initViewWithButtons:(NSArray<NSString *> *)btnTitles;

- (void)initViews;

- (void)setTitle:(NSString *)title ctn:(NSString *)ctn;

- (void)showView;

- (void)hideView;

- (void)hideViewWithNoAmt;

- (void)updateSuperView:(UIView *)view;

- (void)updateContent:(NSString *)content;

@end