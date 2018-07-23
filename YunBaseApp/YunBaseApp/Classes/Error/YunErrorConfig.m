//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunErrorConfig.h"
#import "YunErrorModel.h"
#import "YunValueVerifier.h"
#import <YunKits/NSError+YunAdd.h>
#import <YunKits/YunGlobalDefine.h>

@implementation YunErrorCodeAndMsg

- (instancetype)initWithCode:(NSInteger)code msg:(NSString *)msg {
    self = [super init];
    if (self) {
        self.code = code;
        self.msg = msg;
    }

    return self;
}

+ (instancetype)itemWithCode:(NSInteger)code msg:(NSString *)msg {
    return [[self alloc] initWithCode:code msg:msg];
}

+ (instancetype)itemWithCode:(NSInteger)code {
    return [[self alloc] initWithCode:code msg:nil];
}

@end

@implementation YunErrorTypeToCode

- (instancetype)initWithType:(YunErrorType)type
                      defMsg:(NSString *)defMsg
                        code:(NSArray<YunErrorCodeAndMsg *> *)code {
    self = [super init];
    if (self) {
        self.type = type;
        self.defMsg = defMsg;
        self.codes = code;
    }

    return self;
}

+ (instancetype)itemWithType:(YunErrorType)type
                      defMsg:(NSString *)defMsg
                       codes:(NSArray<YunErrorCodeAndMsg *> *)codes {
    return [[self alloc] initWithType:type defMsg:defMsg code:codes];
}

@end

@implementation YunErrorConfig

+ (YunErrorConfig *)instance {
    static YunErrorConfig *_instance = nil;

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
    NSMutableArray *data = [NSMutableArray new];

    for (int i = 0; i < YunErrTypeMax; ++i) {
        [data addObject:[YunErrorTypeToCode itemWithType:(YunErrorType) i
                                                  defMsg:nil
                                                   codes:nil]];
    }

    self.errorMap = data;

    _unknownMsg = @"操作失败，请检查后重试！";
}

- (void)setItem:(YunErrorType)type
         defMsg:(NSString *)defMsg {
    YunErrorTypeToCode *item = [self getItemByType:type];

    item.defMsg = defMsg;
}

- (void)setItem:(YunErrorType)type
          codes:(NSArray<YunErrorCodeAndMsg *> *)codes {
    YunErrorTypeToCode *item = [self getItemByType:type];

    item.codes = codes;
}

- (void)addItem:(YunErrorType)type
           code:(YunErrorCodeAndMsg *)code {
    YunErrorTypeToCode *item = [self getItemByType:type];

    NSMutableArray *codes = [NSMutableArray arrayWithArray:item.codes];
    [codes addObject:code];

    item.codes = codes;
}

- (YunErrorTypeToCode *)getItemByType:(YunErrorType)type {
    if (type < self.errorMap.count) {
        return self.errorMap[type];
    }
    else {
        return nil;
    }
}

- (YunErrorModel *)getErrorItem:(NSError *)error {
    NSInteger code = error.code;

    for (int i = 0; i < self.errorMap.count; ++i) {
        for (int j = 0; j < self.errorMap[i].codes.count; ++j) {
            if (self.errorMap[i].codes[j].code == code) {
                YunErrorModel *item =
                        [YunErrorModel itemWithType:self.errorMap[i].type
                                               code:code
                                                msg:self.errorMap[i].codes[j].msg == nil ?
                                                    self.errorMap[i].defMsg :
                                                    self.errorMap[i].codes[j].msg
                                                err:error];

                return item;
            }
        }
    }

    NSString *errMsg = [error.userInfo valueForKey:yun_error_custom_msg_key];
    NSString *msg = nil;

    if ([YunValueVerifier isValidStr:errMsg]) {
        msg = FORMAT(@"%@", errMsg);
    }
    else {
        msg = nil; // 无法获取确切 msg 时，为nil；
    }

    return [YunErrorModel itemWithType:YunErrTypeUnknown code:error.code msg:msg err:error];
}

@end