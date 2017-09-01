//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunBaseAppNorHeader.h"
#import <YunKits/YunViewController.h>

@class YunBlankView;

@interface YunAppViewController : YunViewController

@property (nonatomic, assign) BOOL changed;

@property (nonatomic, copy) void (^didPopSuperView)(YunAppViewController *vc);

// YES
@property (nonatomic, assign) BOOL updateItem;

@property (nonatomic, copy) NSArray *blankViewList;

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

- (void)setNagBg:(UIColor *)color;

- (void)setNagTitle:(UIColor *)color font:(UIFont *)font;

- (void)setLeftBarItemName:(NSString *)name;

- (void)setLeftBarItemBtn:(UIBarButtonItem *)btn;

- (void)setLeftBarItemName:(NSString *)name color:(UIColor *)color;

- (void)setRightBarItemBtn:(UIBarButtonItem *)btn;

- (void)setRightBarItemName:(NSString *)name;

- (void)setRightBarItemName:(NSString *)name color:(UIColor *)color;

- (void)setNavTitle:(NSString *)title;

#pragma mark - request

- (void)rqtDataFromServer:(BOOL)force;

- (void)rqtDataFromServer;

- (void)rqtMoreDataFromServer;

- (void)updateVcData;

#pragma mark - update date

- (void)setCurUpdateDate;

- (BOOL)canUpdate;

@end