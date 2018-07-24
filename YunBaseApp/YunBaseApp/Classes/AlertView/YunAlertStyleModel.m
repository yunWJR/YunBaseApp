//
// Created by yun on 2018/7/23.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAlertStyleModel.h"

@interface YunAlertStyleModel () {
}

@end

@implementation YunAlertStyleModel

- (instancetype)initWithIndex:(NSInteger)index
                        isYes:(BOOL)isYes
                   titleColor:(UIColor *)titleColor
                      bgColor:(UIColor *)bgColor {
    self = [super init];
    if (self) {
        self.index = index;
        self.isYes = isYes;
        self.titleColor = titleColor;
        self.bgColor = bgColor;
    }

    return self;
}

+ (instancetype)modelWithIndex:(NSInteger)index
                         isYes:(BOOL)isYes
                    titleColor:(UIColor *)titleColor
                       bgColor:(UIColor *)bgColor {
    return [[YunAlertStyleModel alloc] initWithIndex:index isYes:isYes titleColor:titleColor bgColor:bgColor];
}

@end