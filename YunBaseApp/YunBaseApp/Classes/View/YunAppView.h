//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunBaseAppNorHeader.h"
#import <YunKits/YunView.h>

@class YunBlankView;

@interface YunAppView : YunView

// 第一次加载标识符 // 默认YES
@property (nonatomic, assign) BOOL firstLoad;

// super view
@property (nonatomic, weak) UIViewController *superVC;

@property (nonatomic, copy) NSMutableArray *blankViewList;

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

#pragma mark - public functions

- (void)updateData:(BOOL)force;

#pragma mark - request

- (void)rqtDataFromServer:(BOOL)force;

- (void)rqtDataFromServer;

- (void)rqtMoreDataFromServer;

- (void)updateVcData;

#pragma mark - update date

- (void)setCurUpdateDate;

- (BOOL)canUpdate;

@end