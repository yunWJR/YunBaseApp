//
// Created by 王健 on 16/5/12.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPSessionManager;

@interface YunRqtMg : NSObject

@property (nonatomic, strong) AFHTTPSessionManager *_Nonnull rqMg;

+ (YunRqtMg *_Nonnull)request;

- (void)GET:(NSString *_Nonnull)URLString
 parameters:(nullable id)parameters
   progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
    success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
    failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure;

- (void)POST:(NSString *_Nonnull)URLString
  parameters:(nullable id)parameters
    progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
     success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
     failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure;

- (void)POST:(NSString *_Nonnull)URLString
  parameters:(nullable id)parameters
    paraMode:(BOOL)paraMode
    progress:(nullable void (^)(NSProgress *_Nonnull))downloadProgress
     success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
     failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure;

- (void)DELETE:(NSString *_Nonnull)URLString
    parameters:(nullable id)parameters
       success:(nullable void (^)(NSURLSessionDataTask *_Nonnull, id _Nullable))success
       failure:(nullable void (^)(NSURLSessionDataTask *_Nullable, NSError *_Nonnull))failure;

- (void)setHeaderPara:(NSDictionary *_Nonnull)paras;

@end
