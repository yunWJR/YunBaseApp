//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunBaseAppNorHeader.h"
#import <YunKits/YunViewController.h>

typedef NS_ENUM(NSInteger, YunAppVc_LoadDataMode) {
    YunAppVc_LoadDataNone       = 0, // 不加载数据
    YunAppVc_LoadDataFromLocal  = 1, // 从本地加载
    YunAppVc_LoadDataFromServer = 2  // 从服务器加载
};

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

@property (nonatomic, assign) NSTimeInterval updateInterval;

// 加载数据模式：默认从服务器加载
@property (nonatomic, assign) YunAppVc_LoadDataMode loadDataMode;

// 已经更新过 Vc 的状态（调用过updateVcState方法）
@property (nonatomic, assign) BOOL hasUpdated;

@property (nonatomic, assign) BOOL isNagBarClear;

#pragma mark - app vc flow

// 初始化数据
- (void)initVcData;

// 初始化 view
- (void)initVcSubViews;

// ViewWillAppear
- (void)handleViewWillAppear;

// ViewDidAppear
- (void)handleViewDidAppear;

// ViewDidDisappear
- (void)handleViewDidDisappear;

// 从本地加载数据
- (void)loadDataFromLocal;

// 从服务器加载数据
- (void)loadDataFromServer;

// 从服务器加载更多数据
- (void)loadMoreDataFromServer;

// 更新 Vc 的状态（可以在加载完成时调用）
- (void)updateVcState;

// 开始更新 Vc 状态（实现该方法，updateVcState 时会触发）
- (void)updateVcStateOn;

// 状态更新完成（隐藏一些加载框等）（实现该方法，updateVcState 时会触发）
- (void)updateVcStateCmp;

// 是否需要加载数据（自动判断）
- (BOOL)shouldLoadData;

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

#pragma mark - update date

- (void)setCurUpdateDate;

- (BOOL)canUpdate;

- (UIViewController *)getPreVc;

@end