//
//  Created by 王健 on 16/9/18.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunViewController.h"

@interface YunViewController () {
    UIImageView *_navBarHairlineImageView;
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

        self.hidesBottomBarWhenPushed = _hideBottomBar;
    }

    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setAutomaticallyAdjustsScrollViewInsets:NO];

    // 不延伸
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    self.navigationController.navigationBar.translucent = NO; // 不延伸时，导航栏设为不透明，不然为灰色

    _navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    if (_hideNagBar) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
    else {
        [self.navigationController setNavigationBarHidden:NO animated:YES];

        if (_hideNagBarBackItem) {
            UIBarButtonItem *noneItem = [[UIBarButtonItem alloc] initWithCustomView:[UIButton new]];

            self.navigationItem.leftBarButtonItem = noneItem;
        }
        else {
            [self.navigationItem.backBarButtonItem setTarget:self];
            [self.navigationItem.backBarButtonItem setAction:@selector(didClickNagLeftItem)];
        }
    }

    [self setNagBottomLineHideStatus:_hideNagBarBtmLine];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    self.isAppear = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.navigationController setNavigationBarHidden:_hideNagBar animated:YES];

    [self setNagBottomLineHideStatus:_hideNagBarBtmLine];
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

- (void)setBackVcNeedUpdate {
    if (self.backVC) {
        self.backVC.needUpdateData = YES;
    }
}

#pragma mark - public functions

- (void)setRightBarItemByNormalImg:(NSString *)norImg highLightImg:(NSString *)highImg {
    UIBarButtonItem *rBtnItem = [self createBarItemByImg:norImg action:@selector(didClickNagRightItem)];

    self.navigationItem.rightBarButtonItem = rBtnItem;

    self.rightNagItem = rBtnItem;
}

- (void)setRightBarItemName:(NSString *)name font:(UIFont *)font color:(UIColor *)color {
    if (name == nil) {
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
    if (name == nil) {
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
                                                                style:UIBarButtonItemStyleDone
                                                               target:self
                                                               action:action];
    [btnItem setTitleTextAttributes:
                     @{
                             NSFontAttributeName            : font,
                             NSForegroundColorAttributeName : color
                     }
                           forState:UIControlStateNormal];

    return btnItem;

}

#pragma mark - setter getter

- (void)setHideNagBarBtmLine:(BOOL)hideNagBarBtmLine {
    _hideNagBarBtmLine = hideNagBarBtmLine;

    [self setNagBottomLineHideStatus:_hideNagBarBtmLine];
}

#pragma mark - private functions

- (void)setNagBottomLineHideStatus:(BOOL)hide {
    if (_navBarHairlineImageView) {
        _navBarHairlineImageView.hidden = hide;
    }
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *) view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark - protocol

#pragma mark - request functions

@end