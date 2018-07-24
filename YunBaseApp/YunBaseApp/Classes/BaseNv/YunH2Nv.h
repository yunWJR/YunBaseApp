//
// Created by yun on 2017/11/23.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunH2Nv : UINavigationController

@property (nonatomic, weak) UIViewController *vc;

+ (instancetype)nvWithVc:(UIViewController *)vc;

@end