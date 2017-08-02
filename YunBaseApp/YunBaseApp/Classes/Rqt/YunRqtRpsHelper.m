//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunRqtRpsHelper.h"
#import "NSError+YunAdd.h"
#import "MTLModel.h"
#import "YunLogHelper.h"
#import "YunRqtConfig.h"

@interface YunRqtRpsHelper ()

@end

@implementation YunRqtRpsHelper

- (instancetype)initWithRsp:(id)rspObj {
    [YunLogHelper logMsg:[NSString stringWithFormat:@"RspObj: %@", rspObj]];

    self = [super init];
    if (self) {
        self.rspObj = rspObj;
    }

    return self;
}

- (BOOL)isSuccess {
    if ([self.rspObj[YunRqtConfig.instance.rspCodeName] isEqual:YunRqtConfig.instance.rstSuccessCode]) {
        return YES;
    }

    if (self.rspObj[YunRqtConfig.instance.rstSuccessName]) {
        return ((NSNumber *) self.rspObj[YunRqtConfig.instance.rstSuccessName]).integerValue == 0;
    } // 有success字段：0为成功，其他为错误

    if (self.rspObj[YunRqtConfig.instance.rstErrName]) { // 无success字段：判断 errorMsg 字段
        NSString *err = self.rspObj[YunRqtConfig.instance.rstErrName];
        if (err.length == 0) {
            return YES;
        }
    }

    return NO;
}

- (id)data {
    if (self.rspObj[YunRqtConfig.instance.rspDataName]) {
        return self.rspObj[YunRqtConfig.instance.rspDataName];
    }

    return nil;
}

- (NSString *)errorMsg {
    if (self.rspObj[YunRqtConfig.instance.rstErrName]) {
        return self.rspObj[YunRqtConfig.instance.rstErrName];
    }

    return nil;
}

- (NSInteger)errorCode {
    if (self.rspObj[YunRqtConfig.instance.rspCodeName]) {
        NSInteger codeObj = [self.rspObj[YunRqtConfig.instance.rspCodeName] intValue];

        return codeObj;
    }

    return -1;
}

- (NSError *)rpsError {
    return [NSError errorWithCustomMsg:[self errorMsg] andCode:[self errorCode]];
}

@end