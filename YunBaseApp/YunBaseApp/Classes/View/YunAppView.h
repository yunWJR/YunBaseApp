//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunBaseAppNorHeader.h"
#import <YunKits/YunView.h>

@class YunBlankView;
@class YunAppViewController;

@interface YunAppView : YunView

// 第一次加载标识符 // 默认YES
@property (nonatomic, assign) BOOL firstLoad;

// 有数据需要更新 // 默认NO
@property (nonatomic, assign) BOOL needUpdateData; // 使用后设为NO

// super view
@property (nonatomic, weak) UIViewController *superVC;

@property (nonatomic, strong) NSMutableArray *blankViewList;

@property (nonatomic, strong) YunBlankView *noCtnView;

@property (nonatomic, copy) NSString *noCtnMsg;

@property (nonatomic, strong) YunBlankView *noNetView;

@property (nonatomic, strong) YunBlankView *stateView;

@property (nonatomic, strong) YunBlankView *msgView;

// 第一次加载的空白页面
@property (nonatomic, strong) YunBlankView *defBlankView;

@property (nonatomic, assign) BOOL hideStateView;

// 最后一次更新信息
@property (nonatomic, strong) NSDate *lastUpdateDate;

// 120秒
@property (nonatomic, assign) NSTimeInterval updateInterval;

@property (nonatomic, assign) BOOL hasUpdated;

#pragma mark - app view flow

- (void)initViewDataAndState;

- (void)updateWhenViewAppear;

- (void)loadViewData;

- (void)updateViewState;

- (void)updateViewStateOn;

- (void)updateViewStateCmp;

- (BOOL)shouldLoadData;

#pragma mark - public functions

- (void)updateData:(BOOL)force;

- (YunAppViewController *)superAppVc;

#pragma mark - request

- (void)rqtDataFromServer:(BOOL)force;

- (void)rqtDataFromServer;

- (void)rqtMoreDataFromServer;

- (void)updateVcData;

#pragma mark - update date

- (void)setCurUpdateDate;

- (BOOL)canUpdate;

@end