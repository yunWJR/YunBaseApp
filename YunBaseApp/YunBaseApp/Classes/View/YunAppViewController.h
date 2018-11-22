///
///  Created by 王健 on 16/8/25.
///  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
///

#import "YunBaseAppNorHeader.h"
#import <YunKits/YunViewController.h>

typedef NS_ENUM(NSInteger, YunAppVc_LoadDataMode) {
    YunAppVc_LoadDataNone       = 0, /// 不加载数据
    YunAppVc_LoadDataFromLocal  = 1, /// 从本地加载
    YunAppVc_LoadDataFromServer = 2  /// 从服务器加载
};

@class YunView;
@protocol YunAppViewControllerDelegate;

@interface YunAppViewController : YunViewController

/// delegate
@property (nonatomic, weak) id <YunAppViewControllerDelegate> delegate;

/// 第一次加载标识符 /// 默认YES
@property (nonatomic, assign) BOOL firstLoad;

/// 有数据需要更新 /// 默认NO
@property (nonatomic, assign) BOOL needUpdateData; /// 使用后设为NO

@property (nonatomic, assign) BOOL changed;

/// 点击 NagLeftItem 时触发
@property (nonatomic, copy) void (^didPopSuperView)(YunAppViewController *sender);

/// YES  更新NagBarItem
@property (nonatomic, assign) BOOL updateNagBarItem;

/// blank view
@property (nonatomic, strong) NSMutableArray *blankViewList;

/// 无内容 view
@property (nonatomic, strong) YunView *noCtnView;

/// 默认 无内容文字
@property (nonatomic, copy) NSString *noCtnMsg;

/// 无网络 view
@property (nonatomic, strong) YunView *netErrView;

/// 内容无效 view
@property (nonatomic, strong) YunView *ctnErrView;

/// 消息信息 view
@property (nonatomic, strong) YunView *msgView;

/// 第一次加载的空白页面
@property (nonatomic, strong) YunView *defBlankView;

/// 加载状态 view
@property (nonatomic, strong) YunView *stateView;

/// 隐藏加载状态：默认 NO
@property (nonatomic, assign) BOOL hideStateView;

/// 最后一次更新数据时间
@property (nonatomic, strong) NSDate *lastUpdateDate;

/// 更新间隔时间：默认120s
@property (nonatomic, assign) NSTimeInterval updateInterval;

/// 调用updateVcState
@property (nonatomic, copy) void (^didUpdateVcState)(void);

/// 加载数据模式：默认从服务器加载
@property (nonatomic, assign) YunAppVc_LoadDataMode loadDataMode;

/// 已经更新过 Vc 的状态（调用过updateVcState方法）
@property (nonatomic, assign) BOOL hasUpdated;

/// 导航栏是否为透明：默认 NO
@property (nonatomic, assign) BOOL isNagBarClear;

#pragma mark - app vc flow

/// 初始化数据
- (void)initVcData;

/// 初始化 view
- (void)initVcSubViews;

/// ViewWillAppear
- (void)handleViewWillAppear;

/// ViewDidAppear
- (void)handleViewDidAppear;

/// ViewDidDisappear
- (void)handleViewDidDisappear;

/// 从本地加载数据
- (void)loadDataFromLocal;

/// 从服务器加载数据
- (void)loadDataFromServer;

/// 从服务器加载更多数据
- (void)loadMoreDataFromServer;

/// 更新 Vc 的状态（可以在加载完成时调用）
- (void)updateVcState;

/// 开始更新 Vc 状态（实现该方法，updateVcState 时会触发）
- (void)updateVcStateOn;

/// 状态更新完成（隐藏一些加载框等）（实现该方法，updateVcState 时会触发）
- (void)updateVcStateCmp;

/// 是否需要加载数据（自动判断）
- (BOOL)shouldLoadData;

- (void)loadData;

- (void)loadDataCmp;

- (void)loadDataCmpAndUpdateVcState;

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