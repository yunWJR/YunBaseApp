//
// Created by yun on 2018/11/22.
// Copyright (c) 2018 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YunAppViewController;

@protocol YunAppViewControllerDelegate <NSObject>

- (void)viewWillAppear:(YunAppViewController *)sender;

- (void)viewDidAppear:(YunAppViewController *)sender;

- (void)viewWillDisappear:(YunAppViewController *)sender;

- (void)viewDidDisappear:(YunAppViewController *)sender;

- (void)didInitVcData:(YunAppViewController *)sender;

- (void)didInitVcSubViews:(YunAppViewController *)sender;

- (void)startLoadData:(YunAppViewController *)sender;

- (void)startUpdateVcState:(YunAppViewController *)sender;

- (void)didUpdateVcStateCmp:(YunAppViewController *)sender;

@end