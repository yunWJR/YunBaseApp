//
// Created by yun on 16/12/1.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface YunView : UIView

// 边距定义，都是属性变量，用于布局的时候。
@property (nonatomic, assign) CGFloat allOff;

@property (nonatomic, assign) CGFloat sideOff;

@property (nonatomic, assign) CGFloat topOff;

@property (nonatomic, assign) CGFloat leftOff;

@property (nonatomic, assign) CGFloat rightOff;

@property (nonatomic, assign) CGFloat bottomOff;

// 内容间距，都是属性变量，用于布局的时候。
@property (nonatomic, assign) CGFloat allInterval;

@property (nonatomic, assign) CGFloat ctnIntervalV;

@property (nonatomic, assign) CGFloat ctnIntervalH;

+ (instancetype)viewWithAllOff:(CGFloat)off andInterval:(CGFloat)interval;

- (instancetype)initWithAllOff:(CGFloat)off andInterval:(CGFloat)interval;

- (void)setOffTop:(CGFloat)top left:(CGFloat)left right:(CGFloat)right bottom:(CGFloat)bottom;

- (void)setIntervalV:(CGFloat)iV h:(CGFloat)iH;

- (CGFloat)twoSideOff;

@end