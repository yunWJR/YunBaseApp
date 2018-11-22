//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunAppBlankViewConfig : NSObject

@property (nonatomic, assign) BOOL isFullLoad;

@property (nonatomic, strong) UIColor *loadViewBgColor;

/// 默认：60
@property (nonatomic, assign) CGFloat nagItemW;
/// 默认：40
@property (nonatomic, assign) CGFloat nagItemH;
/// 默认：30
@property (nonatomic, assign) CGFloat nagItemIconW;
/// 默认：30
@property (nonatomic, assign) CGFloat nagItemIconH;
/// 默认：nagFontTitle高度
@property (nonatomic, assign) CGFloat nagItemIconNorH;

/// 默认的返回按钮图片名，默认：nag_back
@property (nonatomic, copy) NSString *defNagBackItemImg;

/// nagitem的图标名称列表。
@property (nonatomic, copy) NSArray<NSString *> *nagItemList;

+ (instancetype)instance;

- (NSString *)getNagItemByIndex:(NSInteger)index;

@end