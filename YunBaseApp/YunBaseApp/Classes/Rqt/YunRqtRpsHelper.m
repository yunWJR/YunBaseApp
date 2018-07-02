//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunRqtRpsHelper.h"
#import "NSError+YunAdd.h"
#import "MTLModel.h"
#import "YunLogHelper.h"
#import "YunRqtConfig.h"
#import "YunValueVerifier.h"

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
    // code int
    if (YunRqtConfig.instance.rstSuccessCodeInt >= 0) {
        if ([YunValueVerifier isIntObj:self.rspObj[YunRqtConfig.instance.rspCodeName]]) {
            NSInteger code = [self.rspObj[YunRqtConfig.instance.rspCodeName] integerValue];

            return code == YunRqtConfig.instance.rstSuccessCodeInt;
        }
    }

    // code str
    if ([YunValueVerifier isValidStr:YunRqtConfig.instance.rstSuccessCode]) {
        if ([self.rspObj[YunRqtConfig.instance.rspCodeName] isEqual:YunRqtConfig.instance.rstSuccessCode]) {
            return YES;
        }
    }

    // 有success字段：0为成功，其他为错误
    if (self.rspObj[YunRqtConfig.instance.rstSuccessName]) {
        if ([YunValueVerifier isIntObj:self.rspObj[YunRqtConfig.instance.rstSuccessName]]) {
            NSInteger code = [self.rspObj[YunRqtConfig.instance.rstSuccessName] integerValue];

            return code == 0;
        }
    }

    // 无success字段：判断 errorMsg 字段
    if (self.rspObj[YunRqtConfig.instance.rstErrName]) {
        NSString *err = self.rspObj[YunRqtConfig.instance.rstErrName];
        if ([YunValueVerifier isInvalidStr:err]) {
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