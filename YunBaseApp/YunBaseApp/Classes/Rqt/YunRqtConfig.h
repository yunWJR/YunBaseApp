//
// Created by yun on 2017/6/26.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface YunRqtConfig : NSObject

#pragma mark - url

@property (nonatomic, copy) NSURL *baseURL;

@property (nonatomic, copy) NSURL *baseApiURL;

@property (nonatomic, copy) NSString *apiKey;

@property (nonatomic, copy) NSString *devType;

@property (nonatomic, copy) NSString *apiKeyParaName;

@property (nonatomic, copy) NSString *devTypeParaName;

@property (nonatomic, copy) NSString *tokenParaName;

@property (nonatomic, copy) NSString *pageIndexParaName;

@property (nonatomic, copy) NSString *pageSizeParaName;

@property (nonatomic, strong) NSMutableDictionary *baseParas;

#pragma mark - rps

@property (nonatomic, copy) NSString *rspCodeName;

@property (nonatomic, copy) NSString *rspDataName;

@property (nonatomic, copy) NSString *rstErrName;

@property (nonatomic, copy) NSString *rstSuccessName;

@property (nonatomic, copy) NSString *rstSuccessCode;

@property (nonatomic, assign) NSInteger rstSuccessCodeInt;

#pragma mark - rqt mg

@property (nonatomic, assign) BOOL queryMode;

@property (nonatomic, assign) BOOL logUrl;

@property (nonatomic, strong) NSMutableDictionary *headerParas;

@property (nonatomic, strong) AFHTTPRequestSerializer <AFURLRequestSerialization> *requestSerializer;

@property (nonatomic, strong) AFHTTPResponseSerializer <AFURLResponseSerialization> *responseSerializer;

+ (YunRqtConfig *)instance;

@end