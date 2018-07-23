//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunErrorConfig.h"

@interface YunErrorModel : NSObject

@property (nonatomic, strong) NSError *orgErr;

@property (nonatomic, assign) YunErrorType type;

@property (nonatomic, assign) NSInteger code;

// 无法获取确切 msg 时，为nil；
@property (nonatomic, copy) NSString *msg;

+ (instancetype)itemWithType:(YunErrorType)type code:(NSInteger)code msg:(NSString *)msg err:(NSError *)err;

+ (instancetype)itemWithType:(YunErrorType)type code:(NSInteger)code msg:(NSString *)msg;

- (NSString *)getMsgByMode;

- (NSString *)getNorMsg;

- (NSString *)getDetailMsg;

@end