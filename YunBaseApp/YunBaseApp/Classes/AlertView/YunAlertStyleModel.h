//
// Created by yun on 2018/7/23.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunAlertStyleModel : NSObject

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, assign) BOOL isYes;

@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, strong) UIColor *bgColor;

- (instancetype)initWithIndex:(NSInteger)index
                        isYes:(BOOL)isYes
                   titleColor:(UIColor *)titleColor
                      bgColor:(UIColor *)bgColor;

+ (instancetype)modelWithIndex:(NSInteger)index
                         isYes:(BOOL)isYes
                    titleColor:(UIColor *)titleColor
                       bgColor:(UIColor *)bgColor;

@end