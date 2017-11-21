//
// Created by yun on 2017/10/27.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunURLHelper : NSObject

+ (NSDictionary *)dicFromQuery:(NSString *)query;

+ (NSDictionary *)dicFromQuery:(NSString *)query eCode:(NSStringEncoding)encoding ignoreNil:(BOOL)ignoreNil;

+ (BOOL)fineQuery:(NSURL *)url lastItem:(NSString *)itemKey rst:(void (^)(NSString *itemV, NSString *retainQuery))rst;

@end