//
// Created by yun on 16/12/1.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunView.h"

@implementation YunView {

}

- (instancetype)initWithAllOff:(CGFloat)off andInterval:(CGFloat)interval {
    self = [super init];
    if (self) {
        self.allOff = off;

        self.topOff = off;
        self.sideOff = off;
        self.leftOff = off;
        self.rightOff = off;
        self.bottomOff = off;

        self.allInterval = interval;

        self.ctnIntervalV = interval;
        self.ctnIntervalH = interval;
    }

    return self;
}

+ (instancetype)viewWithAllOff:(CGFloat)off andInterval:(CGFloat)interval {
    return [[self alloc] initWithAllOff:off andInterval:interval];
}

- (void)setOffTop:(CGFloat)top left:(CGFloat)left right:(CGFloat)right bottom:(CGFloat)bottom {
    self.topOff = top;
    self.leftOff = left;
    self.rightOff = right;
    self.bottomOff = bottom;
}

- (void)setIntervalV:(CGFloat)iV h:(CGFloat)iH {
    self.ctnIntervalV = iV;
    self.ctnIntervalH = iH;
}

@end