//
// Created by 王健 on 2016/11/24.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunSystemInfo : NSObject

+ (NSString *)appVersion;

+ (NSString *)appVersionStr;

+ (BOOL)shouldUpdate:(NSString *)serverVersion;

+ (void)fontPrint;

@end