//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YunErrorDefine.h"

@class YunErrorModel;

@protocol YunErrorDelegate <NSObject>

@optional

// YunErrorHelper的itemWithError方法前处理
- (NSError *)preHandleInItemWithError:(NSError *)error;

//- (void)didErrorOn:(YunErrorModel *)err hasHandle:(BOOL)hasHandle;

@end

@interface YunErrorCodeAndMsg : NSObject

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, copy) NSString *msg;

+ (instancetype)itemWithCode:(NSInteger)code msg:(NSString *)msg;

+ (instancetype)itemWithCode:(NSInteger)code;

@end

@interface YunErrorTypeToCode : NSObject

@property (nonatomic, assign) YunErrorType type;

@property (nonatomic, copy) NSString *defMsg;

@property (nonatomic, strong) NSArray<YunErrorCodeAndMsg *> *codes;

+ (instancetype)itemWithType:(YunErrorType)type
                      defMsg:(NSString *)defMsg
                       codes:(NSArray<YunErrorCodeAndMsg *> *)codes;

@end

@interface YunErrorConfig : NSObject

@property (nonatomic, strong) NSArray<YunErrorTypeToCode *> *errorMap;

@property (nonatomic, assign) BOOL debugMsg;

@property (nonatomic, weak) id <YunErrorDelegate> delegate;

@property (nonatomic, copy) NSString *unknownMsg;

// error block，通知由实际程序自己处理特定异常
@property (nonatomic, copy) void (^didErrorOn)(YunErrorModel *err, BOOL hasHandle);

+ (YunErrorConfig *)instance;

- (void)setItem:(YunErrorType)type defMsg:(NSString *)defMsg;

- (void)setItem:(YunErrorType)type codes:(NSArray<YunErrorCodeAndMsg *> *)codes;

- (void)addItem:(YunErrorType)type code:(YunErrorCodeAndMsg *)code;

- (YunErrorModel *)getErrorItem:(NSError *)error;

@end