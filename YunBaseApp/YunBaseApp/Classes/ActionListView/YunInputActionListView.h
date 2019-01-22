//
// Created by yun on 2017/7/19.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunHudOnWindow.h"

@class YunActionListItemModel;

@interface YunInputActionListView : YunHudOnWindow {
}

// 0-默认（中间） 1-下方 2-上方
@property (nonatomic, assign) NSInteger locationType;

@property (nonatomic, assign) BOOL animation;

@property (nonatomic, assign) NSTimeInterval animationDur;

@property (nonatomic, copy) NSString *viewTitle;

@property (nonatomic, strong) NSArray<YunActionListItemModel *> *itemList;

@property (nonatomic, copy) void (^didSelectItem)(YunActionListItemModel *item);

@end
