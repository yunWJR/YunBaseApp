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
        _imgViewLostImgName = @"img_def_lost";

        _imgViewAvrImgName = @"img_def_avr";
        _imgViewNoCtnImgName = @"img_def_no_ctn";
        _imgViewNoNetName = @"img_def_no_net";

        _imgViewDefCtnMode = UIViewContentModeScaleAspectFill;

        _isDebugMode = NO;

        _isApnsDevMode = NO;

        _isLogMode = NO;

        _nagVcPopGes = YES;

        _iconViewTagInImgView = 99999;

        _dateFmYm = @"yyyy-MM";
        _dateFmYmd = @"yyyy-MM-dd"; // DD - 今年的第几天
        _dateFmYmdHm = @"yyyy-MM-dd HH:mm"; // HH - 默认24小时制
        _dateFmHm = @"HH:mm";

        _dateFmYm_Server = @"yyyy-MM";
        _dateFmYmd_Server = @"yyyy-MM-dd";
        _dateFmYmdHm_Server = @"yyyy-MM-dd HH:mm";
        _dateFmHm_Server = @"HH:mm";

        _btnDefHlColor = [UIColor lightGrayColor];

        _imgViewBg = [UIColor clearColor];

        _ctnHlOff = 6;
        _ctnVtOff = 16;

        _fontBlankCoefficient = 0.4f;

        _nagItemWidth = 54;
    }

    return self;
}

@end