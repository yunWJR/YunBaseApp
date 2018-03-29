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

@property (nonatomic, strong) NSMutableDictionary *heightDic;

+ (instancetype)instance;

- (void)setItemHeight:(NSString *)itemId height:(CGFloat)height;

- (CGFloat)getItemHeight:(NSString *)itemId;

@end