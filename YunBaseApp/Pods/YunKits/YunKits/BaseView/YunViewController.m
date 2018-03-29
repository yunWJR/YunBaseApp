//
// Created by yun on 16/12/1.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunViewController.h"
#import "YunValueVerifier.h"

@interface YunViewController () {
    UIImageView *_nagBtmLine;
}

@end

@implementation YunViewController

- (instancetype)init {
    self = [super init];

    if (self) {
        _hideNagBar = NO;
        _hideNagBarBtmLine = NO;
        _hideNagBarBackItem = NO;

        _needUpdateData = NO;
        _forceNoUpdate = NO;

        _hideBottomBar = YES;

        _sideOff = 0;
        _topOff = 0;

        _firstLoad = YES;
        _isAppear = NO;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.hidesBottomBarWhenPushed = _hideBottomBar;

    // 自动校准滚动视图的嵌入视图,对加载到 self.view 的第一个 view(UIScrollView)起作用
    [self setAutomaticallyAdjustsScrollViewInsets:NO];

    // view不延伸（包括，状态栏、导航栏）
    [self setEdgesForExtendedLayout:UIRectEdgeNone];

    // 不延伸时，导航栏设为不透明，不然为灰色
    self.navigationController.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self updateNagHideState];

    if (!_hideNagBar) {
        if (_hideNagBarBackItem) {
            UIBarButtonItem *noneItem = [[UIBarButtonItem alloc] initWithCustomView:[UIButton new]];

            self.navigationItem.leftBarButtonItem = noneItem;
        }
        else {
            [self.navigationItem.backBarButtonItem setTarget:self];
            [self.navigationItem.backBarButtonItem setAction:@selector(didClickNagLeftItem)];
        }

        [self updateNagBtmLineState];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.isAppear = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self updateNagHideState];

    if (!_hideNagBar) {
        [self updateNagBtmLineState];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    self.isAppear = NO;
}

#pragma mark - handles

- (void)didClickNagLeftItem {
    if (self.isModalVc) {
        [self dismissViewControllerAnimated:YES completion:nil];
        return;
    }

    if (_backVC) {
        [self.navigationController popToViewController:_backVC animated:YES];
        _backVC = nil;
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didClickNagRightItem {
}

#pragma mark - public functions

- (void)setBackVcNeedUpdate {
    if (self.backVC) {
        self.backVC.needUpdateData = YES;
    }
}

- (void)setRightBarItemByImg:(NSString *)img {
    UIBarButtonItem *rBtnItem = [self createBarItemByImg:img action:@selector(didClickNagRightItem)];

    self.navigationItem.rightBarButtonItem = rBtnItem;

    self.rightNagItem = rBtnItem;
}

- (void)setRightBarItemName:(NSString *)name font:(UIFont *)font color:(UIColor *)color {
    if ([YunValueVerifier isInvalidStr:name]) {
        return;
    }

    UIBarButtonItem *rBtnItem = [self createBarItemByName:name
                                                     font:font
                                                    color:color
                                                   action:@selector(didClickNagRightItem)];

    self.navigationItem.rightBarButtonItem = rBtnItem;

    self.rightNagItem = rBtnItem;
}

- (void)setLeftBarItemByImg:(NSString *)img {
    UIBarButtonItem *lBtnItem = [self createBarItemByImg:img action:@selector(didClickNagLeftItem)];

    self.navigationItem.leftBarButtonItem = lBtnItem;

    self.leftNagItem = lBtnItem;
}

- (void)setLeftBarItemName:(NSString *)name font:(UIFont *)font color:(UIColor *)color {
    if ([YunValueVerifier isInvalidStr:name]) {
        return;
    }

    UIBarButtonItem *lBtnItem = [self createBarItemByName:name
                                                     font:font
                                                    color:color
                                                   action:@selector(didClickNagLeftItem)];

    self.navigationItem.leftBarButtonItem = lBtnItem;

    self.leftNagItem = lBtnItem;
}

- (UIBarButtonItem *)createBarItemByImg:(NSString *)img action:(nullable SEL)action {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:img]
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:action];

    return btnItem;
}

- (UIBarButtonItem *)createBarItemByName:(NSString *)name
                                    font:(UIFont *)font
                                   color:(UIColor *)color
                                  action:(nullable SEL)action {
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithTitle:name
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:action];
    //UIBarButtonItemStylePlain        默认按钮风格；按下时会闪动
    //UIBarButtonItemStyleBordered     与UIBarButtonItemStylePlain相同，但显示的按钮有边框(已废弃)
    //UIBarButtonItemStyleDone         显示一个蓝色按钮，提醒用户编辑完毕时应该点触（tap）该按钮。

    [btnItem setTitleTextAttributes:
                     @{
                             NSFontAttributeName            : font,
                             NSForegroundColorAttributeName : color
                     }
                           forState:UIControlStateNormal];

    // 防止按下变色
    [btnItem setTitleTextAttributes:
                     @{
                             NSFontAttributeName            : font,
                             NSForegroundColorAttributeName : color
                     }
                           forState:UIControlStateHighlighted];

    return btnItem;
}

#pragma mark - setter getter

- (void)setHideNagBarBtmLine:(BOOL)hideNagBarBtmLine {
    _hideNagBarBtmLine = hideNagBarBtmLine;

    [self updateNagBtmLineState];
}

#pragma mark - private functions

- (void)updateNagBtmLineState {
    [self setNagBottomLineHideStatus:_hideNagBarBtmLine];
}

- (void)setNagBottomLineHideStatus:(BOOL)hide {
    if (_nagBtmLine == nil) {
        _nagBtmLine = [self findNagBtmLine:self.navigationController.navigationBar];
    }

    if (_nagBtmLine) {
        _nagBtmLine.hidden = hide;
    }
}

- (UIImageView *)findNagBtmLine:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *) view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findNagBtmLine:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

- (void)updateNagHideState {
    // animated=YES 防止侧滑 黑条
    [self.navigationController setNavigationBarHidden:_hideNagBar animated:YES];
}

#pragma mark - protocol

#pragma mark - request functions

@end