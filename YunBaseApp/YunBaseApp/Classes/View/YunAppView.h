//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunView.h"
#import "YunBaseAppNorHeader.h"

@class YunBlankView;

@interface YunAppView : YunView

// 控件间距 // 默认10
@property (nonatomic, assign) CGFloat sideOff;

// 第一次加载标识符 // 默认YES
@property (nonatomic, assign) BOOL firstLoad;

// super view
@property (nonatomic, weak) UIViewController *superVC;

@property (nonatomic, strong) YunBlankView *noCtnView;

@property (nonatomic, strong) YunBlankView *noNetView;

@property (nonatomic, strong) YunBlankView *stateView;

- (instancetype)initWithSideOff:(CGFloat)sideOff superVC:(UIViewController *)superVC;

+ (instancetype)viewWithSideOff:(CGFloat)sideOff superVC:(UIViewController *)superVC;

#pragma mark - public functions

- (void)updateData:(BOOL)force;

@end