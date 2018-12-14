//
// Created by yun on 2017/7/19.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunHudOnWindow.h"

@class YunActionListItemModel;

@interface YunInputActionListView : YunHudOnWindow {
}

@property (nonatomic, copy) NSString *viewTitle;

@property (nonatomic, strong) NSArray<YunActionListItemModel *> *itemList;

@property (nonatomic, copy) void (^didSelectItem)(YunActionListItemModel *item);

@end
