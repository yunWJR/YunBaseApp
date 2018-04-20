//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunBaseAppNorHeader.h"
#import <YunKits/YunViewController.h>

@class YunBlankView;

@interface YunAppViewController : YunViewController

// 第一次加载标识符 // 默认YES
@property (nonatomic, assign) BOOL firstLoad;

// 有数据需要更新 // 默认NO
@property (nonatomic, assign) BOOL needUpdateData; // 使用后设为NO

@property (nonatomic, assign) BOOL changed;

// 点击 NagLeftItem 时触发
@property (nonatomic, copy) void (^didPopSuperView)(YunAppViewController *vc);

// YES  更新NagBarItem
@property (nonatomic, assign) BOOL updateItem;

// blank view

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

// 调用updateVcState
@property (nonatomic, copy) void (^didUpdateVcState)(void);

// 默认 NO，为 YES 时，每次请求都更新数据
@property (nonatomic, assign) BOOL isForceLoadData;

// isForceLoadData=NO 时，请求数据的间隔时间：默认120秒
@property (nonatomic, assign) NSTimeInterval updateInterval;

// 加载数据优先级：默认 NO，即先从服务器加载
@property (nonatomic, assign) BOOL isLoadDataFromLocalFirst;

@property (nonatomic, assign) BOOL hasUpdated;

@property (nonatomic, assign) BOOL isNagBarClear;

#pragma mark - app flow

- (void)initVcData;

- (void)initVcSubViews;

- (void)handleViewWillAppear;

- (void)handleViewDidAppear;

- (BOOL)loadDataFromLocal;

- (BOOL)loadDataFromServer;

- (void)loadMoreDataFromServer;

- (void)updateVcState;

- (void)updateVcStateOn;

- (void)updateVcStateCmp;

#pragma mark - app style

- (void)setNagBg:(UIColor *)color;

- (void)setNagTitle:(UIColor *)color font:(UIFont *)font;

- (void)setLeftBarItemName:(NSString *)name;

- (void)setLeftBarItemBtn:(UIBarButtonItem *)btn;

- (void)setLeftBarItemName:(NSString *)name color:(UIColor *)color;

- (void)setRightBarItemBtn:(UIBarButtonItem *)btn;

- (void)setRightBarItemName:(NSString *)name;

- (void)setRightBarItemName:(NSString *)name color:(UIColor *)color;

- (void)setNavTitle:(NSString *)title;

- (void)setNagBarClear;

- (void)setBackVcNeedUpdate;

- (YunAppViewController *)appBackVC;

#pragma mark - request

- (void)rqtDataFromServer:(BOOL)force;

- (void)rqtDataFromServer;

- (void)rqtMoreDataFromServer;

- (void)updateVcData;

#pragma mark - update date

- (void)setCurUpdateDate;

- (BOOL)canUpdate;

- (UIViewController *)getPreVc;

@end