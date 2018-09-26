//
// Created by yun on 2018/9/26.
// Copyright (c) 2018 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YunErrorType) {
    YunErrTypeUnknown = 0,
    YunErrTypeNetWork,
    YunErrTypeServer,
    YunErrTypeRqtTimeOut,
    YunErrTypeLocal,
    YunErrTypeOutOfLogin,
    YunErrTypeUserDataError,
    YunErrTypeMustUpdate,
    YunErrTypeNoCtnAndGoBack,
    YunErrTypeCustom,
    YunErrTypeMax,
};