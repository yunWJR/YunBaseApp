//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunErrorModel.h"
#import "YunValueHelper.h"
#import <YunKits/YunGlobalDefine.h>

@implementation YunErrorModel

- (instancetype)initWithType:(YunErrorType)type code:(NSInteger)code msg:(NSString *)msg err:(NSError *)err {
    self = [super init];
    if (self) {
        self.orgErr = err;
        self.type = type;
        self.code = code;
        self.msg = msg;
    }

    return self;
}

+ (instancetype)itemWithType:(YunErrorType)type code:(NSInteger)code msg:(NSString *)msg err:(NSError *)err {
    return [[self alloc] initWithType:type code:code msg:msg err:err];
}

+ (instancetype)itemWithType:(YunErrorType)type code:(NSInteger)code msg:(NSString *)msg {
    return [[self alloc] initWithType:type code:code msg:msg err:nil];
}

- (NSString *)getMsgByMode {
    if (YunErrorConfig.instance.debugMsg) {
        return self.getDetailMsg;
    }
    else {
        return self.getNorMsg;
    }
}

- (NSString *)getNorMsg {
    if (_msg == nil) {
        return YunErrorConfig.instance.unknownMsg;
    }

    return _msg;
}

- (NSString *)getDetailMsg {
    if (_msg == nil) {
        return FORMAT(@"详细错误信息：%@", _orgErr.userInfo);
    }

    return FORMAT(@"错误码：%@\n错误信息：%@", [YunValueHelper intStr:_code], _msg);
}

@end