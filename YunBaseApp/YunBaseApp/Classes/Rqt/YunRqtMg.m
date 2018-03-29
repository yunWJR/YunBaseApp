//
// Created by 王健 on 16/5/12.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunRqtMg.h"
#import <YunKits/YunGlobalDefine.h>
#import "AFHTTPSessionManager.h"
#import "YunValueVerifier.h"
#import "YunLogHelper.h"
#import "YunRqtConfig.h"

@implementation YunRqtMg

+ (YunRqtMg *)request {
    return [(YunRqtMg *) [[self class] alloc] initWithURLManager];
}

- (instancetype)initWithURLManager {
    self = [super init];
    if (!self) {
        return nil;
    }

    _rqMg = [AFHTTPSessionManager manager];

    if (YunRqtConfig.instance.responseSerializer) { //响应
        _rqMg.responseSerializer = YunRqtConfig.instance.responseSerializer;
    }

    if (YunRqtConfig.instance.requestSerializer) {
        _rqMg.requestSerializer = YunRqtConfig.instance.requestSerializer;

        //[_rqMg.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        //[_rqMg.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    }

    [self setHeaderPara:YunRqtConfig.instance.headerParas];

    return self;
}

- (NSURLSessionDataTask *)GET:(NSString *_Nonnull)URLString
                   parameters:(nullable id)parameters
                     progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
                      success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
                      failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure {

    [YunLogHelper logMsg:FORMAT(@"GET RQT--%@\n paras:%@", URLString, parameters)
                   force:YunRqtConfig.instance.logUrl];

    return [_rqMg GET:URLString
           parameters:parameters
             progress:downloadProgress
              success:success
              failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *_Nonnull)URLString
                    parameters:(nullable id)parameters
                      progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
                       success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
                       failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure {

    // post 参数修改
    if (YunRqtConfig.instance.queryMode) {
        NSString *paraStr = AFQueryStringFromParameters(parameters);
        if (![YunValueVerifier isNilOrEmptyStr:paraStr]) {
            URLString = [NSString stringWithFormat:@"%@?%@", URLString, paraStr];
        }
        parameters = [NSDictionary new];
    }

    [YunLogHelper logMsg:FORMAT(@"POST RQT--%@\n paras:%@", URLString, parameters)
                   force:YunRqtConfig.instance.logUrl];

    return [_rqMg POST:URLString
            parameters:parameters
              progress:downloadProgress
               success:success
               failure:failure];
}

- (NSURLSessionDataTask *)POST:(NSString *_Nonnull)URLString
                    parameters:(nullable id)parameters
                     queryMode:(BOOL)queryMode
                      progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
                       success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
                       failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure {

    // post 参数修改
    if (queryMode) {
        NSString *paraStr = AFQueryStringFromParameters(parameters);
        if (![YunValueVerifier isNilOrEmptyStr:paraStr]) {
            URLString = [NSString stringWithFormat:@"%@?%@", URLString, paraStr];
        }
        parameters = [NSDictionary new];
    }

    [YunLogHelper logMsg:FORMAT(@"POST RQT--%@\n paras:%@", URLString, parameters)
                   force:YunRqtConfig.instance.logUrl];

    return [_rqMg POST:URLString
            parameters:parameters
              progress:downloadProgress
               success:success
               failure:failure];
}

- (NSURLSessionDataTask *)DELETE:(NSString *_Nonnull)URLString
                      parameters:(nullable id)parameters
                         success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
                         failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure {

    [YunLogHelper logMsg:FORMAT(@"DELETE RQT--%@\n paras:%@", URLString, parameters)
                   force:YunRqtConfig.instance.logUrl];

    return [_rqMg DELETE:URLString
              parameters:parameters
                 success:success
                 failure:failure];
}

- (void)setHeaderPara:(NSDictionary *)paras {
    if (paras == nil || paras.count == 0) {return;}

    for (int i = 0; i < paras.allKeys.count; ++i) {
        NSString *keyStr = paras.allKeys[i];
        NSString *valueStr = paras[keyStr];

        if ([YunValueVerifier isValidStr:valueStr]) {
            [_rqMg.requestSerializer setValue:valueStr
                           forHTTPHeaderField:keyStr];
        }
        else {
            [_rqMg.requestSerializer setValue:@""
                           forHTTPHeaderField:keyStr];
        }
    }

    [YunLogHelper logMsg:FORMAT(@"HTTPRequestHeaders--%@", [_rqMg.requestSerializer HTTPRequestHeaders])
                   force:YunRqtConfig.instance.logUrl];
}

@end