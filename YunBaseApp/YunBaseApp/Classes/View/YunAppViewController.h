//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <YunKits/YunViewController.h>
#import "YunBaseAppNorHeader.h"

@class YunBlankView;

@interface YunAppViewController : YunViewController

// YES
@property (nonatomic, assign) BOOL updateItem;

@property (nonatomic, strong) YunBlankView *noCtnView;

@property (nonatomic, strong) YunBlankView *noNetView;

@property (nonatomic, strong) YunBlankView *stateView;

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

- (void)rqtDataFromServer;

- (void)updateVcData;

@end