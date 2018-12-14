//
// Created by yun on 2017/8/4.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunActionListItemModel : NSObject

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, copy) NSString *itemId;

@property (nonatomic, copy) NSString *itemName;

@property (nonatomic, strong) id item;

+ (instancetype)modelWithItemName:(NSString *)itemName index:(NSInteger)index;

+ (instancetype)modelWithItemId:(NSString *)itemId itemName:(NSString *)itemName item:(id)item;

@end