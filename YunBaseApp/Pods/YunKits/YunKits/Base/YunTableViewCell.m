//
// Created by yun on 16/12/1.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunTableViewCell.h"

@interface YunTableViewCell () {
    CGFloat _allSideOff;
}

@end

@implementation YunTableViewCell {
}

- (CGFloat)allOff {
    return _allSideOff;
}

- (void)setAllOff:(CGFloat)allOff {
    _allSideOff = allOff;

    _topOff = _allSideOff;
    _leftOff = _allSideOff;
    _rightOff = _allSideOff;
    _bottomOff = _allSideOff;
    _ctnIntervalH = _allSideOff;
    _ctnIntervalV = _allSideOff;
}

@end