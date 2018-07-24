//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunAlertConfig : NSObject

@property (nonatomic, strong) UIColor *yesTitleColor;
@property (nonatomic, strong) UIColor *yesBgColor;

@property (nonatomic, strong) UIColor *norTitleColor;
@property (nonatomic, strong) UIColor *norBgColor;

@property (nonatomic, strong) UIColor *alertTitleColor;
@property (nonatomic, strong) UIColor *alertBgColor;

+ (instancetype)instance;

@end