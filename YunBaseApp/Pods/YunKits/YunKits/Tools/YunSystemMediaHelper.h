//
// Created by 王健 on 16/10/11.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Accelerate/Accelerate.h>

@interface YunSystemMediaHelper : NSObject

+ (void)openSms:(NSString *__nonnull)phoneNo;

+ (void)openPhone:(NSString *__nonnull)phoneNo;

+ (void)openPhone:(NSString *__nonnull)phoneNo cmp:(void (^ __nullable)(BOOL success))cmp;

+ (void)openURL:(NSString *__nonnull)url;

+ (void)openURL:(NSString *)url cmp:(void (^ __nullable)(BOOL success))cmp;

@end