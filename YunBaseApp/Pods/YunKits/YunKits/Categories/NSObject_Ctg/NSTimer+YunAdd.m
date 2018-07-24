//
// Created by yun on 2018/4/24.
// Copyright (c) 2018 yun. All rights reserved.
//

#import "NSTimer+YunAdd.h"

@implementation NSTimer (YunAdd)

+ (NSTimer *)yun_timerWithInterval:(NSTimeInterval)interval
                          userInfo:(id)userInfo
                             block:(yun_timerBlock)block
                           repeats:(BOOL)repeats {
    NSMutableDictionary *para = [NSMutableDictionary new];
    if (userInfo) {
        para[@"userInfo"] = userInfo;
    }

    if (block) {
        para[@"block"] = [block copy];
    }

    return [self scheduledTimerWithTimeInterval:interval
                                         target:self
                                       selector:@selector(yun_blockInvoke:)
                                       userInfo:para
                                        repeats:repeats];
}

+ (NSTimer *)yun_timerWithInterval:(NSTimeInterval)interval
                             block:(yun_timerBlock)block
                           repeats:(BOOL)repeats {
    return [self yun_timerWithInterval:interval
                              userInfo:nil
                                 block:block
                               repeats:repeats];
}

+ (void)yun_blockInvoke:(NSTimer *)timer {
    id info = timer.userInfo;
    if ([info isKindOfClass:NSDictionary.class]) {
        NSDictionary *infoDic = info;

        yun_timerBlock block = infoDic[@"block"];
        if (block) {
            id userInfo = infoDic[@"userInfo"];

            block(userInfo);
        }
    }
}

@end