//
// Created by 王健 on 16/5/26.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunErrorHelper.h"
#import "YunGlobalDefine.h"
#import "YunLogHelper.h"
#import <YunKits/NSError+YunAdd.h>

@implementation YunErrorHelper

+ (instancetype)itemWithRpsError:(YunRqtRpsHelper *)rps {
    YunErrorHelper *item = [[YunErrorHelper alloc] initWithRpsError:rps];

    return item;
}

+ (instancetype)itemWithError:(NSError *)error {
    if (YunErrorConfig.instance.delegate &&
        [YunErrorConfig.instance.delegate respondsToSelector:@selector(preHandleInItemWithError:)]) {
        error = [YunErrorConfig.instance.delegate preHandleInItemWithError:error];
    }

    YunErrorHelper *item = [[YunErrorHelper alloc] initWithError:error];

    return item;
}

+ (instancetype)netWorkDownError {
    return [[YunErrorHelper alloc] initWithError:[NSError errorWithCustomCode:YunErrTypeNetWork]];
}

+ (instancetype)noCacheError {
    return [[YunErrorHelper alloc] initWithError:[NSError errorWithCustomMsg:@"没有缓存数据"
                                                                     andCode:YunErrTypeCustom]];
}

+ (instancetype)modelError {
    return [[YunErrorHelper alloc] initWithError:[NSError errorWithCustomMsg:@"数据解析错误"
                                                                     andCode:YunErrTypeCustom]];
}

+ (instancetype)upImgError {
    return [[YunErrorHelper alloc] initWithError:[NSError errorWithCustomMsg:@"上传图片失败"
                                                                     andCode:YunErrTypeCustom]];
}

- (instancetype)initWithRpsError:(YunRqtRpsHelper *)rps {
    self = [self initWithError:rps.rpsError];

    self.rps = rps;

    return self;
}

- (instancetype)initWithError:(NSError *)error {
    [YunLogHelper logMsg:FORMAT(@"Error: %@", error)];

    self = [super init];
    if (self) {
        _error = error;
    }

    return self;
}

#pragma mark - public functions

- (YunErrorModel *)getError {
    return [YunErrorConfig.instance getErrorItem:_error];
}

@end