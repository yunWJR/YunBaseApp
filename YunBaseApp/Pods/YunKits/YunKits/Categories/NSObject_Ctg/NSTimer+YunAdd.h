//
// Created by yun on 2018/4/24.
// Copyright (c) 2018 yun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^yun_timerBlock)(id userInfo);

@interface NSTimer (YunAdd)

// 使用时，注意 block 不用引用强对象
+ (NSTimer *)yun_timerWithInterval:(NSTimeInterval)interval
                          userInfo:(id)userInfo
                             block:(yun_timerBlock)block
                           repeats:(BOOL)repeats;

+ (NSTimer *)yun_timerWithInterval:(NSTimeInterval)interval
                             block:(yun_timerBlock)block
                           repeats:(BOOL)repeats;

@end