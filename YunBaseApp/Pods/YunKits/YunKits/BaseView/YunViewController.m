//
// Created by yun on 16/12/1.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunViewController.h"
#import "YunValueVerifier.h"

@interface YunViewController () {
    UIImageView *_nagBtmLine;
}

@property (nonatomic, weak) UIBarButtonItem *noneLeftItem;

@end

@implementation YunViewController

- (instancetype)init {
    self = [super init];

    if (self) {
        _hideNagBar = NO;
        _hideNagBarBtmLine = NO;
        _hideNagBarBackItem = NO;

        _hideBottomBar = YES;

        _sideOff = 0;
        _topOff = 0;

        _isAppear = NO;

        self.hidesBottomBarWhenPushed = _hideBottomBar;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self updateNagHideState];

    if (!_hideNagBar) {
        if (_hideNagBarBackItem) {
            if (_noneLeftItem == nil) {
                _noneLeftItem = [[UIBarButtonItem alloc] initWithCustomView:[UIButton new]];
            }

            self.leftNagItem = _noneLeftItem;
            self.navigationItem.leftBarButtonItem = _noneLeftItem;
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

    _isAppear = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self updateNagHideState];

    if (!_hideNagBar) {
        //[self updateNagBtmLineState];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    _isAppear = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - handles

- (void)didClickNagLeftItem {
    if (self.isModalVc) {
        [self dismissViewControllerAnimated:YES completion:nil]; // completion
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

- (void)setHideBottomBar:(BOOL)hideBottomBar {
    _hideBottomBar = hideBottomBar;

    self.hidesBottomBarWhenPushed = _hideBottomBar;
}

- (YunViewController *)yunBackVC {
    if (_backVC) {
        if ([_backVC isKindOfClass:YunViewController.class]) {
            return (YunViewController *) _backVC;
        }
        else {
            return nil;
        }
    }

    return nil;
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