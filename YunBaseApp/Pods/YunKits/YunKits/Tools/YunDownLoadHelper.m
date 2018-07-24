//
// Created by yun on 2018/7/16.
// Copyright (c) 2018 yun. All rights reserved.
//

#import "YunDownLoadHelper.h"
#import <AFNetworking/AFHTTPSessionManager.h>

@interface YunDownLoadHelper () {
}

@end

@implementation YunDownLoadHelper

- (void)downLoadFile:(NSString *)urlStr result:(void (^)(NSURL *path))rst {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURLSessionDownloadTask *downTask =
            [manager downloadTaskWithRequest:request
                                    progress:^(NSProgress *progress) {
                                    }
                                 destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                                     //下载的目标路径
                                     NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(
                                             NSCachesDirectory,
                                             NSUserDomainMask,
                                             YES) lastObject];
                                     //path
                                     NSString *path = [cachesPath stringByAppendingPathComponent:response
                                             .suggestedFilename];

                                     return [NSURL fileURLWithPath:path];
                                 }
                           completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                               //文件存在filePath下，可以读出来放到其他文件中，后续文章会介绍
                               rst(filePath);
                           }];

    [downTask resume];
}

@end