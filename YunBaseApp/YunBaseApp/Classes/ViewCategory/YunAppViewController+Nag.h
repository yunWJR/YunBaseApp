//
// Created by yun on 2017/7/6.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAppViewController.h"

@interface YunAppViewController (Nag)

+ (UIBarButtonItem *)nagItemWithImg:(NSString *_Nullable)image
                             target:(id _Nullable)target
                             isLeft:(BOOL)isLeft
                             action:(SEL _Nullable)action;

- (UIView *)createTitleView;

- (void)setNagItemIsLeft:(BOOL)isLeft type:(NSInteger)type;

- (void)setNagItemIsLeft:(BOOL)isLeft imgName:(NSString *)imgName;

- (void)setNagItemIsLeft:(BOOL)isLeft cl:(UIColor *)cl ft:(UIFont *)ft;

- (void)setNagBackItem;

@end