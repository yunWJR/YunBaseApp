//
// Created by yun on 16/6/28.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <YunKits/YunView.h>

@interface YunLoadView : YunView

@property (nonatomic, strong) UIColor *bgColor;

@property (nonatomic, strong) UILabel *cmtLbl;

- (void)showWithBg:(BOOL)hasBack;

- (void)showWithBg:(BOOL)hasBack cmt:(NSString *)cmt;

- (void)hiddenView;

- (void)stop;

@end