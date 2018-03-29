//
// Created by yun on 2017/5/22.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunLogHelper.h"
#import "YunConfig.h"

@implementation YunLogHelper {
}

+ (void)logMsg:(NSString *)msg {
    [self logMsg:msg force:NO];
}

+ (void)logMsg:(NSString *)msg force:(BOOL)force {
    if (YunConfig.instance.isLogMode || force) {
        if (msg == nil) {
            NSLog(@"Log: NO Msg");
            return;
        }

        NSLog(@"%@", msg);
    }
}

@end