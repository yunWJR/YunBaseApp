//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAlertConfig.h"
#import <YunKits/UIColor+YunAdd.h>
#import "YunAppThemeHeader.h"

@interface YunAlertConfig () {
}

@end

@implementation YunAlertConfig

+ (instancetype)instance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.yesTitleColor = UIColor.whiteColor;
        self.yesBgColor = YunAppTheme.colorBaseHl;

        self.norTitleColor = UIColor.whiteColor;
        self.norBgColor = [UIColor hexColor:0x6F737C];

        self.alertTitleColor = YunAppTheme.colorBaseAlert;
        self.alertBgColor = YunAppTheme.colorBaseHl;
    }

    return self;
}

@end