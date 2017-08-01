//
// Created by yun on 2017/5/22.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunLogHelper.h"
#import "YunConfig.h"

@implementation YunLogHelper {

}

+ (void)logMsg:(NSString *)msg {
    if (msg == nil) {return;}
    
    if (YunConfig.instance.isDebugMode) {
        NSLog(msg, nil);
    }
}

@end