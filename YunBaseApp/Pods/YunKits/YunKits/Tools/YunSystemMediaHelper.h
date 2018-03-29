//
// Created by yun on 16/10/11.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunSystemMediaHelper : NSObject

+ (void)openSms:(NSString *__nonnull)phoneNo;

+ (void)openPhone:(NSString *__nonnull)phoneNo;

+ (void)openPhone:(NSString *__nonnull)phoneNo cmp:(void (^ __nullable)(BOOL success))cmp;

+ (void)openURL:(NSString *__nonnull)url;

+ (void)openURL:(NSString *__nonnull)url cmp:(void (^ __nullable)(BOOL success))cmp;

+ (BOOL)canOpenURL:(NSString *__nonnull)url;

@end