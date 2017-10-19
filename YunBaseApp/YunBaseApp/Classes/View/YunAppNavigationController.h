//
// Created by yun on 2017/10/19.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunBaseAppNorHeader.h"
#import <YunKits/YunNavigationController.h>

@class YunBlankView;

@interface YunAppNavigationController : YunNavigationController

@property (nonatomic, assign) BOOL changed;

@property (nonatomic, copy) void (^didPopSuperView)(YunAppNavigationController *vc);

// YES
@property (nonatomic, assign) BOOL updateItem;

@property (nonatomic, strong) NSMutableArray *blankViewList;

@property (nonatomic, strong) YunBlankView *noCtnView;

@property (nonatomic, copy) NSString *noCtnMsg;

@property (nonatomic, strong) YunBlankView *noNetView;

@property (nonatomic, strong) YunBlankView *stateView;

@property (nonatomic, strong) YunBlankView *msgView;

@property (nonatomic, assign) BOOL hideStateView;

// 最后一次更新信息
@property (nonatomic, strong) NSDate *lastUpdateDate;

// 120秒
@property (nonatomic, assign) NSTimeInterval updateInterval;

@property (nonatomic, assign) BOOL hasUpdated;

- (void)setNagBg:(UIColor *)color;

- (void)setNagTitle:(UIColor *)color font:(UIFont *)font;

- (void)setLeftBarItemName:(NSString *)name;

- (void)setLeftBarItemBtn:(UIBarButtonItem *)btn;

- (void)setLeftBarItemName:(NSString *)name color:(UIColor *)color;

- (void)setRightBarItemBtn:(UIBarButtonItem *)btn;

- (void)setRightBarItemName:(NSString *)name;

- (void)setRightBarItemName:(NSString *)name color:(UIColor *)color;

- (void)setNavTitle:(NSString *)title;

#pragma mark - request

- (void)rqtDataFromServer:(BOOL)force;

- (void)rqtDataFromServer;

- (void)rqtMoreDataFromServer;

- (void)updateVcData;

#pragma mark - update date

- (void)setCurUpdateDate;

- (BOOL)canUpdate;

@end