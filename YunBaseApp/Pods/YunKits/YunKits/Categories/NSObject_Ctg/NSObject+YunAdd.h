//
// Created by yun on 16/5/15.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YunAdd)

// 深度复制
- (id)yunDeepCopy;

// 获取对象的所有属性
- (NSDictionary *)getAllProperties;

// 对象的所有方法
- (void)printAllMethods;

@end
