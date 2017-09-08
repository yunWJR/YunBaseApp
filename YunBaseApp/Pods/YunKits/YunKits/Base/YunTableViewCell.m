//
// Created by yun on 16/12/1.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunTableViewCell.h"
#import "YunValueVerifier.h"

@interface YunTableViewCell () {
    CGFloat _allSideOff;
}

@end

@implementation YunTableViewCell {
}

+ (instancetype)instance {
    static YunTableViewCell *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] initWithConfig];
        }
    }

    return _instance;
}

- (instancetype)initWithConfig {
    //self = [super init];
    if (self) {
        _heightDic = [NSMutableDictionary new];
    }

    return self;
}

- (CGFloat)allOff {
    return _allSideOff;
}

- (void)setAllOff:(CGFloat)allOff {
    _allSideOff = allOff;

    _sideOff = _allSideOff;
    _topOff = _allSideOff;
    _leftOff = _allSideOff;
    _rightOff = _allSideOff;
    _bottomOff = _allSideOff;
    _ctnIntervalH = _allSideOff;
    _ctnIntervalV = _allSideOff;
}

- (void)setItemHeight:(NSString *)itemId height:(CGFloat)height {
    if ([YunValueVerifier isInvalidStr:itemId]) {return;}

    [_heightDic setValue:@(height) forKey:itemId];
}

- (CGFloat)getItemHeight:(NSString *)itemId {
    if ([YunValueVerifier isInvalidStr:itemId]) {return 0;}

    NSNumber *h = [_heightDic valueForKey:itemId];
    if (h) {
        return h.floatValue;
    }

    return 0;
}

@end