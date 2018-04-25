//
// Created by yun on 16/12/1.
// Copyright (c) 2017 yun. All rights reserved.
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
    //self = [super init]; // 不需调用[super init];
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

- (void)setCellHeight:(NSString *)cellId height:(CGFloat)height {
    if ([YunValueVerifier isInvalidStr:cellId]) {return;}

    [_heightDic setValue:@(height) forKey:cellId];
}

// cell 高度设置
- (void)setItemHeight:(NSString *)itemId height:(CGFloat)height {
    [self setCellHeight:itemId height:height];
}

- (CGFloat)getCellHeight:(NSString *)cellId {
    if ([YunValueVerifier isInvalidStr:cellId]) {return 0;}

    NSNumber *h = [_heightDic valueForKey:cellId];
    if (h != nil) {
        return h.floatValue;
    }

    return 0;
}

- (CGFloat)getItemHeight:(NSString *)itemId {
    return [self getCellHeight:itemId];
}

@end