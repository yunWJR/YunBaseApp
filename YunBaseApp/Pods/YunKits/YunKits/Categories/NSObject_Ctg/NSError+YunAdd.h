//
//  NSError+YunAdd.h
//
//  Created by 王健 on 16/5/26.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CUSTOM_MSG_KEY @"custom_error"

@interface NSError (YunAdd)

+ (instancetype)errorWithCustomMsg:(NSString *)msg;

+ (instancetype)errorWithCustomMsg:(NSString *)msg andCode:(NSInteger)code;

+ (instancetype)errorWithCustomCode:(NSInteger)code;

@end
