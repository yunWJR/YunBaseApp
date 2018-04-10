//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunAppThemeColorConfig : NSObject

#pragma bg

@property (nonatomic, strong) UIColor *colorBgNor;

@property (nonatomic, strong) UIColor *colorBgDark;

@property (nonatomic, strong) UIColor *colorBgLight;

@property (nonatomic, strong) UIColor *colorVcBg;

@property (nonatomic, strong) UIColor *colorViewBg;

#pragma nag

@property (nonatomic, strong) UIColor *colorNagBg;

@property (nonatomic, strong) UIColor *colorNagNor;

@property (nonatomic, strong) UIColor *colorNagDark;

@property (nonatomic, strong) UIColor *colorNagLight;

#pragma Ctn

@property (nonatomic, strong) UIColor *colorCtnNor;

@property (nonatomic, strong) UIColor *colorCtnDark;

@property (nonatomic, strong) UIColor *colorCtnLight;

#pragma Base

@property (nonatomic, strong) UIColor *colorBaseNor;

@property (nonatomic, strong) UIColor *colorBaseDark;

@property (nonatomic, strong) UIColor *colorBaseLight;

@property (nonatomic, strong) UIColor *colorBaseDk1;

@property (nonatomic, strong) UIColor *colorBaseDk2;

@property (nonatomic, strong) UIColor *colorBaseDk3;

@property (nonatomic, strong) UIColor *colorBaseDk4;

@property (nonatomic, strong) UIColor *colorBaseLg1;

@property (nonatomic, strong) UIColor *colorBaseLg2;

@property (nonatomic, strong) UIColor *colorBaseLg3;

@property (nonatomic, strong) UIColor *colorBaseLg4;

@property (nonatomic, strong) UIColor *colorBaseHl;

@property (nonatomic, strong) UIColor *colorBaseAlert;

@property (nonatomic, strong) UIColor *colorBaseCmp;

@property (nonatomic, strong) UIColor *colorBaseWhite;

@property (nonatomic, strong) UIColor *colorBaseBlack;

#pragma custom

@property (nonatomic, strong) NSDictionary *colorCustomDic;

+ (YunAppThemeColorConfig *)instance;

- (UIColor *)colorCustomByKey:(NSString *)key;

#pragma custom color list

@property (nonatomic, strong) NSArray<UIColor *> *colorList;

- (UIColor *)colorIn:(NSInteger)index;

@end