//
// Created by 王健 on 16/5/26.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunErrorModel.h"
#import "YunRqtRpsHelper.h"
#import <YunRqtMg.h>

@interface YunErrorHelper : NSObject

@property (nonatomic, strong) NSError *error;

@property (nonatomic, strong) YunRqtRpsHelper *rps;

+ (instancetype)itemWithRpsError:(YunRqtRpsHelper *)rps;

+ (instancetype)itemWithError:(NSError *)error;

+ (instancetype)netWorkDownError;

+ (instancetype)noCacheError;

+ (instancetype)modelError;

+ (instancetype)upImgError;

- (YunErrorModel *)getError;


//添加记录错误日志上传时 ，上传请求的数据
+ (instancetype)itemWithRpsError:(YunRqtRpsHelper *)rps rqtMg:(YunRqtMg *) rqtMg;

+ (instancetype)itemWithError:(NSError *)error rqtMg:(YunRqtMg *) rqtMg;

+ (instancetype)modelErrorWithRqtMg:(YunRqtMg *) rqtMg;


@end
