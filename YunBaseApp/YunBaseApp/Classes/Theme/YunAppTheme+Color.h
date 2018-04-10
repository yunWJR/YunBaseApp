//
// Created by yun on 2017/5/11.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppTheme.h"

@interface YunAppTheme (Color)

#pragma bg

+ (UIColor *)colorBgNor;

+ (UIColor *)colorBgDark;

+ (UIColor *)colorBgLight;

+ (UIColor *)colorVcBg;

+ (UIColor *)colorViewBg;

#pragma nag

+ (UIColor *)colorNagBg;

+ (UIColor *)colorNagNor;

+ (UIColor *)colorNagDark;

+ (UIColor *)colorNagLight;

#pragma Ctn

+ (UIColor *)colorCtnNor;

+ (UIColor *)colorCtnDark;

+ (UIColor *)colorCtnLight;

#pragma Base

+ (UIColor *)colorBaseNor;

+ (UIColor *)colorBaseDark;

+ (UIColor *)colorBaseLight;

+ (UIColor *)colorBaseDk1;

+ (UIColor *)colorBaseDk2;

+ (UIColor *)colorBaseDk3;

+ (UIColor *)colorBaseDk4;

+ (UIColor *)colorBaseLg1;

+ (UIColor *)colorBaseLg2;

+ (UIColor *)colorBaseLg3;

+ (UIColor *)colorBaseLg4;

+ (UIColor *)colorBaseHl;

+ (UIColor *)colorBaseAlert;

+ (UIColor *)colorBaseCmp;

+ (UIColor *)colorBaseWhite;

+ (UIColor *)colorBaseBlack;

+ (UIColor *)colorBaseClear;

+ (UIColor *)colorBaseHex:(UInt32)hex;

#pragma custom

+ (UIColor *)colorCustomByKey:(NSString *)key;

+ (UIColor *)colorIn:(NSInteger)index;

@end