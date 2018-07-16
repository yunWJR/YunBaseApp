//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <YunKits/YunConfig.h>
#import "YunRqtConfig.h"

@implementation YunRqtConfig

+ (YunRqtConfig *)instance {
    static YunRqtConfig *_instance = nil;

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
        [self initData];
    }

    return self;
}

- (void)initData {
    self.apiKeyParaName = @"api_key";
    self.devTypeParaName = @"type";
    self.tokenParaName = @"token";
    self.pageIndexParaName = @"pageNum";
    self.pageSizeParaName = @"pageSize";

    self.rspCodeName = @"code";
    self.rspDataName = @"data";
    self.rstErrName = @"errorMsg";
    self.rstSuccessName = @"success";

    self.rstSuccessCode = @"200";
    self.rstSuccessCodeInt = 200;

    self.queryMode = NO;
    self.logUrl = YunConfig.instance.isDebugMode;
}

@end