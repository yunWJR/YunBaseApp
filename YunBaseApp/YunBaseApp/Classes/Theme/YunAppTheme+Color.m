//
// Created by yun on 2017/5/11.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppTheme+Color.h"
#import "YunAppThemeColorConfig.h"
#import "UIColor+YunAdd.h"

@implementation YunAppTheme (Color)

#pragma bg

+ (UIColor *)colorBgNor {
    return YunAppThemeColorConfig.instance.colorBgNor;
}

+ (UIColor *)colorBgDark {
    return YunAppThemeColorConfig.instance.colorBgDark;
}

+ (UIColor *)colorBgLight {
    return YunAppThemeColorConfig.instance.colorBgLight;
}

+ (UIColor *)colorVcBg {
    return YunAppThemeColorConfig.instance.colorVcBg;
}

+ (UIColor *)colorViewBg {
    return YunAppThemeColorConfig.instance.colorViewBg;
}

#pragma nag

+ (UIColor *)colorNagBg {
    return YunAppThemeColorConfig.instance.colorNagBg;
}

+ (UIColor *)colorNagNor {
    return YunAppThemeColorConfig.instance.colorNagNor;
}

+ (UIColor *)colorNagDark {
    return YunAppThemeColorConfig.instance.colorNagDark;
}

+ (UIColor *)colorNagLight {
    return YunAppThemeColorConfig.instance.colorNagLight;
}

#pragma Ctn

+ (UIColor *)colorCtnNor {
    return YunAppThemeColorConfig.instance.colorCtnNor;
}

+ (UIColor *)colorCtnDark {
    return YunAppThemeColorConfig.instance.colorCtnDark;
}

+ (UIColor *)colorCtnLight {
    return YunAppThemeColorConfig.instance.colorCtnLight;
}

#pragma Base

+ (UIColor *)colorBaseNor {
    return YunAppThemeColorConfig.instance.colorBaseNor;
}

+ (UIColor *)colorBaseDark {
    return YunAppThemeColorConfig.instance.colorBaseDark;
}

+ (UIColor *)colorBaseLight {
    return YunAppThemeColorConfig.instance.colorBaseLight;
}

+ (UIColor *)colorBaseDk1 {
    return YunAppThemeColorConfig.instance.colorBaseDk1;
}

+ (UIColor *)colorBaseDk2 {
    return YunAppThemeColorConfig.instance.colorBaseDk2;
}

+ (UIColor *)colorBaseDk3 {
    return YunAppThemeColorConfig.instance.colorBaseDk3;
}

+ (UIColor *)colorBaseDk4 {
    return YunAppThemeColorConfig.instance.colorBaseDk4;
}

+ (UIColor *)colorBaseLg1 {
    return YunAppThemeColorConfig.instance.colorBaseLg1;
}

+ (UIColor *)colorBaseLg2 {
    return YunAppThemeColorConfig.instance.colorBaseLg2;
}

+ (UIColor *)colorBaseLg3 {
    return YunAppThemeColorConfig.instance.colorBaseLg3;
}

+ (UIColor *)colorBaseLg4 {
    return YunAppThemeColorConfig.instance.colorBaseLg4;
}

+ (UIColor *)colorBaseHl {
    return YunAppThemeColorConfig.instance.colorBaseHl;
}

+ (UIColor *)colorBaseAlert {
    return YunAppThemeColorConfig.instance.colorBaseAlert;
}

+ (UIColor *)colorBaseCmp {
    return YunAppThemeColorConfig.instance.colorBaseCmp;
}

+ (UIColor *)colorBaseWhite {
    return YunAppThemeColorConfig.instance.colorBaseWhite;
}

+ (UIColor *)colorBaseBlack {
    return YunAppThemeColorConfig.instance.colorBaseBlack;
}

+ (UIColor *)colorBaseClear {
    return [UIColor clearColor];
}

+ (UIColor *)colorBaseHex:(UInt32)hex {
    return [UIColor hexColor:hex];
}

#pragma custom

+ (UIColor *)colorCustomByKey:(NSString *)key {
    return [YunAppThemeColorConfig.instance colorCustomByKey:key];
}

+ (UIColor *)colorIn:(NSInteger)index {
    return [YunAppThemeColorConfig.instance colorIn:index];
}

@end