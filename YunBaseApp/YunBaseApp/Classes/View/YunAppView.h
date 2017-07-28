//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <YunKits/YunView.h>
#import <YunKits/YunFactory.h>
#import "YunBaseAppNorHeader.h"

@class YunBlankView;

@interface YunAppView : YunView

// 第一次加载标识符 // 默认YES
@property (nonatomic, assign) BOOL firstLoad;

// super view
@property (nonatomic, weak) UIViewController *superVC;

@property (nonatomic, strong) YunBlankView *noCtnView;

@property (nonatomic, strong) YunBlankView *noNetView;

@property (nonatomic, strong) YunBlankView *stateView;

#pragma mark - public functions

- (void)updateData:(BOOL)force;

@end