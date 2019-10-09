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
    return [self itemWithRpsError:rps rqtMg:nil];
}

+ (instancetype)itemWithRpsError:(YunRqtRpsHelper *)rps rqtMg:(YunRqtMg *) rqtMg {
    YunErrorHelper *item = [[YunErrorHelper alloc] initWithRpsError:rps rqtMg:rqtMg];
    
    return item;
}

+ (instancetype)itemWithError:(NSError *)error {
    return [self itemWithError:error rqtMg:nil];
}

+ (instancetype)itemWithError:(NSError *)error rqtMg:(YunRqtMg *) rqtMg {
    if (YunErrorConfig.instance.delegate &&
        [YunErrorConfig.instance.delegate respondsToSelector:@selector(preHandleInItemWithError:)]) {
        error = [YunErrorConfig.instance.delegate preHandleInItemWithError:error];
    }

    YunErrorHelper *item = [[YunErrorHelper alloc] initWithError:error rqtMg:rqtMg];

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
    return [self modelErrorWithRqtMg:nil];
}

+ (instancetype)modelErrorWithRqtMg:(YunRqtMg *)rqtMg {
    return [[YunErrorHelper alloc] initWithError:[NSError errorWithCustomMsg:@"数据解析错误"
                                                                     andCode:YunErrTypeCustom]
                                     rqtMg:rqtMg];
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

- (instancetype)initWithRpsError:(YunRqtRpsHelper *)rps rqtMg:(YunRqtMg *) rqtMg {
    self = [self initWithError:rps.rpsError rqtMg:rqtMg];
    
    self.rps = rps;
    
    return self;
}

- (instancetype)initWithError:(NSError *)error rqtMg:(YunRqtMg *) rqtMg {
    [YunLogHelper logMsg:FORMAT(@"Error: %@", error)];
    
    NSString * requestData = nil;
    if (rqtMg) {
        requestData = FORMAT(@"%@\n**********\n%@", rqtMg.requestUrlAndparameters, rqtMg.httpRequestHeaders);
    }
    
    if (YunErrorConfig.instance.delegate &&
        [YunErrorConfig.instance.delegate respondsToSelector:@selector(didInitWithError:requestData:)]) {
        [YunErrorConfig.instance.delegate didInitWithError:error requestData:requestData];
    }
    
    self = [super init];
    if (self) {
        _error = error;
    }
    
    return self;
}

- (instancetype)initWithError:(NSError *)error {
    return [self initWithError:error rqtMg:nil];
}

#pragma mark - public functions

- (YunErrorModel *)getError {
    return [YunErrorConfig.instance getErrorItem:_error];
}

@end
