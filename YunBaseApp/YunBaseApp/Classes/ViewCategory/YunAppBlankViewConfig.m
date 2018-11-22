//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAppBlankViewConfig.h"
#import "YunAppTheme.h"
#import "YunAppTheme+Font.h"

@interface YunAppBlankViewConfig () {
}

@end

@implementation YunAppBlankViewConfig

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
        _nagItemW = 60;
        _nagItemH = 40;
        _nagItemIconW = 60;
        _nagItemIconH = 30;
        _nagItemIconNorH = YunAppTheme.nagFontTitle.lineHeight - 2;

        _defNagBackItemImg = @"nag_back";
    }

    return self;
}

- (NSString *)getNagItemByIndex:(NSInteger)index {
    if (_nagItemList == nil) {
        return nil;
    }

    if (index < 0 || index > _nagItemList.count - 1) {return nil;}

    return _nagItemList[index];
}

@end