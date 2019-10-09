//
// Created by 王健 on 16/5/12.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface YunRqtMg : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *_Nonnull rqMg;

@property (nonatomic, copy) NSString * url;
@property (nonatomic, strong) id parameters;
@property (nonatomic, copy) NSString * requestUrlAndparameters;
@property (nonatomic, copy) NSString * httpRequestHeaders;

+ (YunRqtMg *_Nonnull)request;

- (NSURLSessionDataTask *_Nonnull)GET:(NSString *_Nonnull)URLString
                           parameters:(nullable id)parameters
                             progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
                              success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
                              failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure;

- (NSURLSessionDataTask *_Nonnull)POST:(NSString *_Nonnull)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
                               failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure;

- (NSURLSessionDataTask *_Nonnull)POST:(NSString *_Nonnull)URLString
                            parameters:(nullable id)parameters
                             queryMode:(BOOL)queryMode
                              progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
                               failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(nullable id)parameters
     constructingBodyWithBlock:(nullable void (^)(id<AFMultipartFormData> _Nonnull))block
                       success:(nullable void (^)(NSURLSessionDataTask * _Nonnull, id _Nullable))success
                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable, NSError * _Nonnull))failure;

- (NSURLSessionDataTask *)POST:(NSString *)URLString
                    parameters:(id)parameters
     constructingBodyWithBlock:(void (^)(id <AFMultipartFormData> formData))block
                      progress:(nullable void (^)(NSProgress * _Nonnull uploadProgress))uploadProgress
                       success:(void (^)(NSURLSessionDataTask *task, id responseObject))success
                       failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (NSURLSessionDataTask *_Nonnull)DELETE:(NSString *_Nonnull)URLString
                              parameters:(nullable id)parameters
                                 success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
                                 failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure;

- (void)setHeaderPara:(NSDictionary *_Nonnull)paras;

@end
