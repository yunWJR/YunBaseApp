//
// Created by yun on 2017/9/5.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunLoadViewHelper.h"
#import "YunLoadView.h"
#import "YunRootViewHelper.h"

@interface YunLoadViewHelper () {
    UIView *_superView;
}

@end

@implementation YunLoadViewHelper

+ (YunLoadViewHelper *)instance {
    static YunLoadViewHelper *_instance = nil;

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
        _loadView = [YunLoadView new];
    }

    return self;
}

- (void)showLoadView:(BOOL)hasBg {
    if (_superView == nil) {
        _superView = YunRootViewHelper.instance.rootView;
    }

    [_loadView removeFromSuperview];

    [_superView addSubview:_loadView];

    [_loadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_superView);
        make.left.equalTo(_superView);
        make.size.equalTo(_superView);
    }];

    [_superView layoutIfNeeded];

    [_loadView showWithBg:hasBg];
}

- (void)hideLoadView {
    [_loadView removeFromSuperview];
}

@end