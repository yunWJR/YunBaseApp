//
// Created by yun on 2017/6/23.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunConfig.h"

@implementation YunConfig {

}

+ (YunConfig *)instance {
    static YunConfig *_instance = nil;

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
        _iconFontName = @"iconfont";

        _imgViewHolderImgName = @"img_def_holder";
        _imgViewFailedImgName = @"img_def_failed";
        _imgViewAvrImgName = @"img_def_avr";
        _imgViewNoCtnImgName = @"img_def_no_ctn";
        _imgViewNoNetName = @"img_def_no_net";

        _imgViewDefCtnMode = UIViewContentModeScaleAspectFill;

        _isDebugMode = NO;

        _isApnsDevMode = NO;
    }

    return self;
}

@end