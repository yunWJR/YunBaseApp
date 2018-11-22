//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <YunKits/YunView.h>
#import "YunAppViewController.h"
#import "YunAppConfig.h"
#import "YunSizeHelper.h"
#import "YunYunAppViewControllerDelegate.h"

typedef NS_ENUM(NSInteger, YunAppViewControllerDelegateItem) {
    didInitVcDataDelegateItem,
    didInitVcSubViewsDelegateItem,
    startLoadDataDelegateItem,
    startUpdateVcStateDelegateItem,
    didUpdateVcStateCmpDelegateItem,
};

@interface YunAppViewController () {
}

@end

@implementation YunAppViewController

- (instancetype)init {
    self = [super init];

    if (self) {
        [self initVcData];
    }

    return self;
}

// loadView -- 不要重载该方法

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initVcSubViews];

    [self showDefBlankView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self handleViewWillAppear];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self handleViewDidAppear];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    [self handleViewDidDisappear];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// - (void)dealloc {} 施放对象

#pragma mark - app vc flow

- (void)initVcData {
    self.firstLoad = YES;
    self.needUpdateData = NO;

    _updateNagBarItem = YES;
    _updateInterval = YunAppConfig.instance.viewUpdateInterval;

    _noCtnMsg = @"无内容";

    _isNagBarClear = NO;

    _loadDataMode = YunAppVc_LoadDataFromServer;

    self.sideOff = YunAppConfig.instance.defVcSideOff;
    self.hideNagBarBtmLine = YunAppConfig.instance.isHideNagBtmLine;

    [self notiDelegate:didInitVcDataDelegateItem];
}

- (void)initVcSubViews {
    // 自动校准滚动视图的嵌入视图,对加载到 self.view 的第一个 view(UIScrollView)起作用
    if (@available(iOS 11.0, *)) {
    }
    else {
        // iOS11 废除
        self.automaticallyAdjustsScrollViewInsets = NO;
    }

    // view不延伸（包括，状态栏、导航栏）
    [self setEdgesForExtendedLayout:UIRectEdgeNone];

    // 不延伸时，导航栏设为不透明，不然为灰色
    //self.navigationController.navigationBar.translucent = NO;

    if (YunAppTheme.colorVcBg) {
        self.view.backgroundColor = YunAppTheme.colorVcBg;
    }

    [self notiDelegate:didInitVcSubViewsDelegateItem];
}

- (void)handleViewWillAppear {
    if (!self.hideNagBar) {
        //
        if (!self.firstLoad && _isNagBarClear) {
            [self setNagBarClear];
        }

        if (!_isNagBarClear) {
            // 导航栏背景颜色
            [self setNagBg:YunAppTheme.colorNagBg];
        }

        // title 字体
        [self setNagTitle:YunAppTheme.colorNagDark font:YunAppTheme.nagFontTitle];

        if (_updateNagBarItem) {
            // 返回item
            if (!self.hideNagBarBackItem) {
                self.navigationItem.leftBarButtonItem = self.leftNagItem;
            }

            // right item
            self.navigationItem.rightBarButtonItem = self.rightNagItem;
        }
        else {
            if (!self.hideNagBarBackItem) {
                self.navigationItem.leftBarButtonItem = self.leftNagItem;
            }
        }
    }
}

- (void)handleViewDidAppear {
    if (self.shouldLoadData) {
        if (self.needUpdateData || self.canUpdate) {
            switch (_loadDataMode) {
                case YunAppVc_LoadDataNone: {
                    [self updateVcState];
                }
                    break;
                case YunAppVc_LoadDataFromLocal: {
                    [self loadDataFromLocal];
                }
                    break;
                case YunAppVc_LoadDataFromServer: {
                    [self loadDataFromServer];
                }
                    break;
            }
        }
    }

    if (!_isNagBarClear) {
        // 导航栏背景颜色-修复透明导航到不透明导航，偶尔导航栏为黑色。
        [self setNagBg:YunAppTheme.colorNagBg];
    }
}

- (void)handleViewDidDisappear {

}

- (void)loadDataFromLocal {
    [self setCurUpdateDate];

    [self notiDelegate:startLoadDataDelegateItem];
}

- (void)loadDataFromServer {
    [self setCurUpdateDate];

    [self notiDelegate:startLoadDataDelegateItem];
}

- (void)loadMoreDataFromServer {
    [self notiDelegate:startLoadDataDelegateItem];
}

- (void)updateVcState {
    [self notiDelegate:startUpdateVcStateDelegateItem];

    [self updateVcStateOn];

    [self updateVcStateCmp];
}

- (void)updateVcStateOn {
    self.hasUpdated = YES;
    [self setCurUpdateDate];

    [self setLoadDataCmp];

    if (_isNagBarClear) {
        [self setNagBarClear];
    }

    if (_didUpdateVcState) {
        _didUpdateVcState();
    }
}

- (void)updateVcStateCmp {
    [self hideDefBlankView];

    [self notiDelegate:didUpdateVcStateCmpDelegateItem];
}

- (BOOL)shouldLoadData {
    return self.firstLoad || self.needUpdateData;
}

- (void)loadData {
    [self notiDelegate:startLoadDataDelegateItem];
}

- (void)loadDataCmp {
    [self notiDelegate:didUpdateVcStateCmpDelegateItem];
}

- (void)loadDataCmpAndUpdateVcState {
    [self updateVcState];
}

- (void)setLoadDataCmp {
    self.firstLoad = NO;
    self.needUpdateData = NO;
}

#pragma mark - handles

- (void)didClickNagLeftItem {
    [super didClickNagLeftItem];

    if (_didPopSuperView) {
        _didPopSuperView(self);
    }
}

#pragma mark - public functions

- (void)setNagBg:(UIColor *)color {
    // 导航栏背景颜色
    if (color) {
        self.navigationController.navigationBar.translucent = NO;

        UIImage *colorImg = [UIImage imgWithColor:color];
        if (colorImg == nil) {
            [YunLogHelper logMsg:@"colorImg is nil"];
        }

        [self.navigationController.navigationBar setBarTintColor:color];

        [self.navigationController.navigationBar setBackgroundImage:colorImg
                                                      forBarMetrics:UIBarMetricsDefault];
        self.navigationController.navigationBar.shadowImage = UIImage.new;

        [self.navigationController.navigationBar layoutIfNeeded];
    }
}

- (void)setNagTitle:(UIColor *)color font:(UIFont *)font {
    NSMutableDictionary *mDic = [NSMutableDictionary new];
    if (color) {
        mDic[NSForegroundColorAttributeName] = color;
    }

    if (font) {
        mDic[NSFontAttributeName] = font;
    }

    // title 字体
    [self.navigationController.navigationBar setTitleTextAttributes:mDic];
}

- (void)setRightBarItemName:(NSString *)name color:(UIColor *)color {
    [self setRightBarItemName:name
                         font:[YunAppTheme nagFontItem]
                        color:color == nil ? YunAppTheme.colorNagDark : color];
}

- (void)setRightBarItemName:(NSString *)name {
    [self setRightBarItemName:name color:nil];
}

- (void)setLeftBarItemName:(NSString *)name color:(UIColor *)color {
    [self setLeftBarItemName:name
                        font:[YunAppTheme nagFontItem]
                       color:color == nil ? YunAppTheme.colorNagDark : color];

    self.leftNagItem = self.navigationItem.leftBarButtonItem;
}

- (void)setLeftBarItemName:(NSString *)name {
    [self setLeftBarItemName:name color:nil];
}

- (void)setLeftBarItemBtn:(UIBarButtonItem *)btn {
    self.navigationItem.leftBarButtonItem = btn;

    self.leftNagItem = self.navigationItem.leftBarButtonItem;
}

- (void)setRightBarItemBtn:(UIBarButtonItem *)btn {
    self.navigationItem.rightBarButtonItem = btn;

    self.rightNagItem = self.navigationItem.rightBarButtonItem;
}

- (void)setNavTitle:(NSString *)title {
    self.navigationItem.title = title;
}

- (void)setNagBarClear {
    // 1、设置导航栏半透明
    self.navigationController.navigationBar.translucent = YES;

    [self.navigationController.navigationBar setBarTintColor:UIColor.clearColor];

    // 2、设置导航栏背景图片
    [self.navigationController.navigationBar setBackgroundImage:UIImage.new forBarMetrics:UIBarMetricsDefault];
    // 3、设置导航栏阴影图片
    self.navigationController.navigationBar.shadowImage = UIImage.new;

    self.isNagBarClear = YES;
}

#pragma mark - private functions

- (void)showDefBlankView {
    if (self.defBlankView) {
        self.defBlankView.hidden = NO;

        [self.view addSubview:self.defBlankView];

        [self.defBlankView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(-YunSizeHelper.statusAndNagBarHeight);
            make.width.equalTo(self.view);
            make.left.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];

        [self.view bringSubviewToFront:self.defBlankView];
    }
}

- (void)hideDefBlankView {
    if (self.defBlankView) {
        self.defBlankView.hidden = YES;
        [self.defBlankView removeFromSuperview];

        self.defBlankView = nil;
    }
}

- (void)setBackVcNeedUpdate {
    if (self.appBackVC) {
        self.appBackVC.needUpdateData = YES;
    }
}

- (YunAppViewController *)appBackVC {
    if (self.backVC) {
        if ([self.backVC isKindOfClass:YunAppViewController.class]) {
            return (YunAppViewController *) self.backVC;
        }
        else {
            return nil;
        }
    }

    return nil;
}

- (BOOL)notiDelegate:(YunAppViewControllerDelegateItem)item {
    BOOL isHandle = NO;
    if (_delegate) {
        isHandle = [self handleNotiDelegate:item
                                   delegate:_delegate];
    }

    if (isHandle) {
        return isHandle;
    }

    if (YunAppConfig.instance.appDelegate) {
        isHandle = [self handleNotiDelegate:item
                                   delegate:YunAppConfig.instance.appDelegate];
    }

    return isHandle;
}

- (BOOL)handleNotiDelegate:(YunAppViewControllerDelegateItem)item delegate:(id <YunAppViewControllerDelegate>)delegate {
    if (delegate) {
        switch (item) {
            case didInitVcDataDelegateItem: {
                if ([delegate respondsToSelector:@selector(didInitVcData:)]) {
                    [delegate didInitVcData:self];
                    return YES;
                }
            }
                break;
            case didInitVcSubViewsDelegateItem: {
                if ([delegate respondsToSelector:@selector(didInitVcSubViews:)]) {
                    [delegate didInitVcSubViews:self];
                    return YES;
                }
            }
                break;
            case startLoadDataDelegateItem: {
                if ([delegate respondsToSelector:@selector(startLoadData:)]) {
                    [delegate startLoadData:self];
                    return YES;
                }
            }
                break;
            case startUpdateVcStateDelegateItem: {
                if ([delegate respondsToSelector:@selector(startUpdateVcState:)]) {
                    [delegate startUpdateVcState:self];
                    return YES;
                }
            }
                break;
            case didUpdateVcStateCmpDelegateItem: {
                if ([delegate respondsToSelector:@selector(didUpdateVcStateCmp:)]) {
                    [delegate didUpdateVcStateCmp:self];
                    return YES;
                }
            }
                break;
        }
    }

    return NO;
}

#pragma mark - protocol

#pragma mark - request functions

#pragma mark - update date

- (void)setCurUpdateDate {
    _lastUpdateDate = [NSDate date];
}

- (BOOL)canUpdate {
    if (_lastUpdateDate == nil) {
        return YES;
    }

    if (_updateInterval <= 0) {
        return YES;
    }

    NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:_lastUpdateDate];
    return time > _updateInterval;
}

- (UIViewController *)getPreVc {
    NSInteger vcId = self.navigationController.viewControllers.count - 2;
    if (vcId < 0) {
        return nil;
    }

    UIViewController *parent = self.navigationController.viewControllers[vcId];

    return parent;
}

@end