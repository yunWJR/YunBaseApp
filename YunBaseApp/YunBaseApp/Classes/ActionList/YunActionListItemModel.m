//
// Created by yun on 2017/8/4.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunActionListItemModel.h"

@interface YunActionListItemModel () {
}

@end

@implementation YunActionListItemModel

- (instancetype)initWithItemId:(NSString *)itemId itemName:(NSString *)itemName item:(id)item {
    self = [super init];
    if (self) {
        self.itemId = itemId;
        self.itemName = itemName;
        self.item = item;
    }

    return self;
}

+ (instancetype)modelWithItemName:(NSString *)itemName index:(NSInteger)index {
    YunActionListItemModel *item = [YunActionListItemModel new];
    item.itemName = itemName;
    item.index = index;
    return item;
}

+ (instancetype)modelWithItemId:(NSString *)itemId itemName:(NSString *)itemName item:(id)item {
    return [[self alloc] initWithItemId:itemId itemName:itemName item:item];
}

@end