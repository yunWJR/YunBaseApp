//
// Created by 王健 on 16/5/12.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PpmRqtMg.h"
#import "AFHTTPSessionManager.h"
#import "YunValueVerifier.h"
#import "YunLogHelper.h"
#import "YunRqtConfig.h"

@implementation PpmRqtMg

+ (PpmRqtMg *)request {
    return [(PpmRqtMg *) [[self class] alloc] initWithURLManager];
}

- (instancetype)initWithURLManager {
    self = [super init];
    if (!self) {
        return nil;
    }

    _rqMg = [AFHTTPSessionManager manager];
    //_rqMg.responseSerializer = [AFHTTPResponseSerializer serializer];//响应
    //_rqMg.requestSerializer = [AFHTTPRequestSerializer serializer];
    //[_rqMg.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //[_rqMg.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];

    return self;
}

- (void)GET:(NSString *_Nonnull)URLString
 parameters:(nullable id)parameters
   progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
    success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
    failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure {
    [_rqMg GET:URLString
    parameters:parameters
      progress:downloadProgress
       success:success
       failure:failure];
}

- (void)POST:(NSString *_Nonnull)URLString
  parameters:(nullable id)parameters
    progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
     success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
     failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure {

    // post 参数修改
    if (YunRqtConfig.instance.postParaMode) {
        NSString *paraStr = AFQueryStringFromParameters(parameters);
        if (![YunValueVerifier isNilOrEmptyStr:paraStr]) {
            URLString = [NSString stringWithFormat:@"%@?%@", URLString, paraStr];
        }
        parameters = [NSDictionary new];
    }

    [_rqMg POST:URLString
     parameters:parameters
       progress:downloadProgress
        success:success
        failure:failure];
}

- (void)DELETE:(NSString *_Nonnull)URLString
    parameters:(nullable id)parameters
       success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
       failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure {

    [_rqMg DELETE:URLString
       parameters:parameters
          success:success
          failure:failure];
}

- (void)setHeaderToken:(NSString *_Nonnull)token {
    //if ([YunValueVerifier isNilOrEmptyStr:token]) {return;}

    [_rqMg.requestSerializer setValue:token forHTTPHeaderField:YunRqtConfig.instance.tokenParaName];

    [YunLogHelper logMsg:[NSString stringWithFormat:@"requestSerializer--%@",
                                                    [_rqMg.requestSerializer HTTPRequestHeaders]]];
}

@end
