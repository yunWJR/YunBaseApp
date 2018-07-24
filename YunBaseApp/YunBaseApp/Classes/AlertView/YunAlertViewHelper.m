//
// Created by yun on 2018/7/23.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAlertViewHelper.h"
#import "YunAlertView.h"
#import "YunAlertStyleModel.h"
#import "YunAlertConfig.h"

@interface YunAlertViewHelper () <YunAlertViewDelegate> {
    NSMutableArray<YunAlertStyleModel *> *_styleList;
}

@end

@implementation YunAlertViewHelper

+ (instancetype)factory {
    return [YunAlertViewHelper new];
}

+ (instancetype)instance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //_alertView = [YunAlertView new];
        //_alertView.delegate = self;
        //[_alertView initViews];
    }

    return self;
}

- (void)showYes:(NSString *)content {
    [self showAlert:AlertTypeYes content:content yesBlock:nil cusBlock:nil superView:nil];
}

- (void)showYes:(NSString *)content
         result:(AlertYesBlock)result {
    [self showAlert:AlertTypeYes content:content yesBlock:result cusBlock:nil superView:nil];
}

- (void)showDelete:(NSString *)content
            result:(AlertYesBlock)result {
    [self showAlert:AlertTypeDelCan content:content yesBlock:result cusBlock:nil superView:nil];
}

- (void)showYesNo:(NSString *)content
           result:(AlertYesBlock)result {
    [self showAlert:AlertTypeYesNo content:content yesBlock:result cusBlock:nil superView:nil];
}

- (void)showAlert:(AlertType)type
          content:(NSString *)content
         yesBlock:(AlertYesBlock)yesBlock
         cusBlock:(AlertCustomBlock)cusBlock
        superView:(UIView *)superView {
    NSArray *btnStyles = [self stylesByType:type];

    [self showAlert:[self titleByType:type]
            content:content
          btnTitles:[self titlesByType:type]
          btnStyles:btnStyles
           yesBlock:yesBlock
           cusBlock:cusBlock
          superView:superView];
}

- (void)showAlert:(NSString *)title
          content:(NSString *)content
        btnTitles:(NSArray *)btnTitles
         yesBlock:(AlertYesBlock)yesBlock
         cusBlock:(AlertCustomBlock)cusBlock
        superView:(UIView *)superView {
    NSArray *btnStyles = [self stylesWithCount:btnTitles.count];

    [self showAlert:title
            content:content
          btnTitles:btnTitles
          btnStyles:btnStyles
           yesBlock:yesBlock
           cusBlock:cusBlock
          superView:superView];
}

- (void)creatAlert:(NSString *)title
           content:(NSString *)content
         btnTitles:(NSArray *)btnTitles
         btnStyles:(NSArray<YunAlertStyleModel *> *)btnStyles
          yesBlock:(AlertYesBlock)yesBlock
          cusBlock:(AlertCustomBlock)cusBlock
         superView:(UIView *)superView {
    self.yesBlock = yesBlock;
    self.customBlock = cusBlock;

    _styleList = [[NSMutableArray alloc] initWithArray:btnStyles];

    _alertView = [YunAlertView new];
    _alertView.delegate = self;
    [_alertView initViews];
    _alertView.superView = superView;
    [_alertView initViewWithButtons:btnTitles];
    [_alertView setTitle:title ctn:content];
}

- (void)showAlert:(NSString *)title
          content:(NSString *)content
        btnTitles:(NSArray *)btnTitles
        btnStyles:(NSArray<YunAlertStyleModel *> *)btnStyles
         yesBlock:(AlertYesBlock)yesBlock
         cusBlock:(AlertCustomBlock)cusBlock
        superView:(UIView *)superView {
    [self creatAlert:title
             content:content
           btnTitles:btnTitles
           btnStyles:btnStyles
            yesBlock:yesBlock
            cusBlock:cusBlock
           superView:superView];

    if (_isCreat) {
        return;
    }

    [_alertView showView];
}

- (NSMutableArray *)stylesWithCount:(NSInteger)count {
    NSMutableArray *styleList = [NSMutableArray new];
    for (int i = 0; i < count; ++i) {
        [styleList addObject:[self item:i count:count]];
    }

    return styleList;
}

- (NSMutableArray *)stylesByType:(AlertType)type {
    NSMutableArray *styleList = [NSMutableArray new];
    NSInteger count = -1;

    switch (type) {
        case AlertTypeCustom:
            break;
        case AlertTypeIKnown:
        case AlertTypeYes:
        case AlertTypeSur:
            count = 1;
            break;
        case AlertTypeYesNo:
        case AlertTypeSurCan:
            count = 2;
            break;
        case AlertTypeDelCan: {
            if ([self isYesItem:0 count:2]) {
                [styleList addObject:[self alertItem:0]];
                [styleList addObject:[self noItem:1]];
            }
            else {
                [styleList addObject:[self alertItem:1]];
                [styleList addObject:[self noItem:0]];
            }
        }
            break;
    }

    if (count > 0) {
        for (int i = 0; i < count; ++i) {
            [styleList addObject:[self item:i count:count]];
        }
    }

    return styleList;
}

- (NSArray *)titlesByType:(AlertType)type {
    NSArray *list = nil;

    switch (type) {
        case AlertTypeCustom:
            break;
        case AlertTypeIKnown:
            list = @[@"我知道了"];
            break;
        case AlertTypeYes:
            list = @[@"是"];
            break;
        case AlertTypeSur:
            list = @[@"确定"];
            break;
        case AlertTypeYesNo:
            list = @[@"否", @"是"];
            break;
        case AlertTypeSurCan:
            list = @[@"取消", @"确定"];
            break;
        case AlertTypeDelCan:
            list = @[@"取消", @"删除"];
            break;
    }

    return list;
}

- (NSString *)titleByType:(AlertType)type {
    NSString *tt = nil;
    switch (type) {
        case AlertTypeCustom:
            break;
        case AlertTypeIKnown:
            tt = @"提示";
            break;
        case AlertTypeYes:
            tt = @"提示";
            break;
        case AlertTypeSur:
            tt = @"提示";
            break;
        case AlertTypeYesNo:
            tt = @"提示";
            break;
        case AlertTypeSurCan:
            tt = @"提示";
            break;
        case AlertTypeDelCan:
            tt = @"删除提示";
            break;
    }

    tt = nil;

    return tt;
}

#pragma mark - private funciton

- (YunAlertStyleModel *)item:(NSInteger)index count:(NSInteger)count {
    if ([self isYesItem:index count:count]) {
        return [self yesItem:index];
    }
    else {
        return [self noItem:index];
    }
}

- (YunAlertStyleModel *)yesItem:(NSInteger)index {
    return [YunAlertStyleModel modelWithIndex:index
                                        isYes:YES
                                   titleColor:YunAlertConfig.instance.yesTitleColor
                                      bgColor:YunAlertConfig.instance.yesBgColor];
}

- (YunAlertStyleModel *)noItem:(NSInteger)index {
    return [YunAlertStyleModel modelWithIndex:index
                                        isYes:NO
                                   titleColor:YunAlertConfig.instance.norTitleColor
                                      bgColor:YunAlertConfig.instance.norBgColor];
}

- (YunAlertStyleModel *)alertItem:(NSInteger)index {
    return [YunAlertStyleModel modelWithIndex:index
                                        isYes:YES
                                   titleColor:YunAlertConfig.instance.alertTitleColor
                                      bgColor:YunAlertConfig.instance.alertBgColor];
}

- (BOOL)isYesItem:(NSInteger)index count:(NSInteger)count {
    if (count == 1) {
        return YES;
    }

    if (count == 2) {
        return index == 1;
    }

    return NO;
}

#pragma mark - YunAlertViewDelegate

- (void)didItemOn:(UIButton *)btn index:(NSInteger)index {
    YunAlertStyleModel *item = _styleList[index];

    if (self.yesBlock) {
        self.yesBlock(item.isYes);

        //self.yesBlock = nil;
    }

    if (self.customBlock) {
        self.customBlock(item.index);

        //self.customBlock = nil;
    }
}

- (BOOL)shouldHideViewWhenBtnOn:(UIButton *)btn index:(NSInteger)index {
    return YES;
}

- (UIButton *)createButtonWithTitle:(NSString *)title index:(NSInteger)index {
    return nil;
}

- (UIButton *)buttonStype:(UIButton *)btn index:(NSInteger)index {
    YunAlertStyleModel *item = _styleList[index];

    btn.backgroundColor = item.bgColor;
    btn.titleLabel.textColor = item.titleColor;

    return btn;
}

@end