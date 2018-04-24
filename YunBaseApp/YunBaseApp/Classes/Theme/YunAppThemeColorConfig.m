//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppThemeColorConfig.h"

@implementation YunAppThemeColorConfig

#pragma - mark base

+ (YunAppThemeColorConfig *)instance {
    static YunAppThemeColorConfig *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initColors];
    }

    return self;
}

#pragma mark - public functions

- (UIColor *)colorCustomByKey:(NSString *)key {
    if (_colorCustomDic) {
        id tg = _colorCustomDic[key];
        if (tg && [tg isKindOfClass:UIColor.class]) {
            return (UIColor *) tg;
        }
    }

    return nil;
}

- (UIColor *)colorIn:(NSInteger)index {
    if (_colorList == nil || index > _colorList.count - 1) {
        return nil;
    }

    return _colorList[index];
}

#pragma mark - private funtions

- (void)initColors {
    // base
    self.colorBaseNor = [UIColor blackColor];
    self.colorBaseDark = [UIColor grayColor];
    self.colorBaseLight = [UIColor lightGrayColor];

    self.colorVcBg = [UIColor whiteColor];
    self.colorViewBg = [UIColor whiteColor];

    self.colorBaseDk1 = [UIColor grayColor];
    self.colorBaseDk2 = [UIColor grayColor];
    self.colorBaseDk3 = [UIColor grayColor];
    self.colorBaseDk4 = [UIColor grayColor];

    self.colorBaseLg1 = [UIColor lightGrayColor];
    self.colorBaseLg2 = [UIColor lightGrayColor];
    self.colorBaseLg3 = [UIColor lightGrayColor];
    self.colorBaseLg4 = [UIColor lightGrayColor];

    self.colorBaseHl = [UIColor blueColor];
    self.colorBaseAlert = [UIColor redColor];
    self.colorBaseCmp = [UIColor greenColor];
    self.colorBaseWhite = [UIColor whiteColor];
    self.colorBaseBlack = [UIColor blackColor];

    // bg
    self.colorBgNor = [UIColor blackColor];
    self.colorBgDark = [UIColor grayColor];
    self.colorBgLight = [UIColor lightGrayColor];

    // nag
    self.colorNagBg = [UIColor whiteColor];
    self.colorNagNor = [UIColor blackColor];
    self.colorNagDark = [UIColor grayColor];
    self.colorNagLight = [UIColor lightGrayColor];

    // Ctn
    self.colorCtnNor = [UIColor blackColor];
    self.colorCtnDark = [UIColor grayColor];
    self.colorCtnLight = [UIColor lightGrayColor];
}

@end