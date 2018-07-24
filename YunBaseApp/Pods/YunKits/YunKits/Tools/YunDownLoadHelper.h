//
// Created by yun on 2018/7/16.
// Copyright (c) 2018 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunDownLoadHelper : NSObject

- (void)downLoadFile:(NSString *)urlStr result:(void (^)(NSURL *path))rst;

@end