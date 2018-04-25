//
// Created by yun on 16/12/1.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface YunTableViewCell : UITableViewCell

// 边距定义，都是属性变量，用于布局的时候。
@property (nonatomic, assign) CGFloat allOff;

@property (nonatomic, assign) CGFloat topOff;

@property (nonatomic, assign) CGFloat sideOff;

@property (nonatomic, assign) CGFloat leftOff;

@property (nonatomic, assign) CGFloat rightOff;

@property (nonatomic, assign) CGFloat bottomOff;

// 内容间距，都是属性变量，用于布局的时候。
@property (nonatomic, assign) CGFloat ctnIntervalV;

@property (nonatomic, assign) CGFloat ctnIntervalH;

// 根据 cellID 存储 cell 的高度，适用于高度固定的 cell。
// 0-默认值，表示该 cell为动态高度
@property (nonatomic, strong) NSMutableDictionary *heightDic;

+ (instancetype)instance;

- (void)setCellHeight:(NSString *)cellId height:(CGFloat)height;

- (void)setItemHeight:(NSString *)itemId height:(CGFloat)height
__deprecated_msg("已过期, 请使用setCellHeight:height:");

- (CGFloat)getCellHeight:(NSString *)cellId;

- (CGFloat)getItemHeight:(NSString *)itemId
__deprecated_msg("已过期, 请使用getCellHeight:");

@end