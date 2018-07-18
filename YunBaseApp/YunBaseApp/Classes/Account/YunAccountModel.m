//
// Created by yun on 2018/7/17.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAccountModel.h"
#import <YunKits/YunGlobalDefine.h>
#import "YunLogHelper.h"

@implementation YunAccountModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    NSMutableDictionary *mapping = [[NSDictionary mtl_identityPropertyMapWithModel:self] mutableCopy];
    return mapping;
}

+ (instancetype)modelWithData:(id)data {
    NSError *modelErr;
    YunAccountModel *model = [MTLJSONAdapter modelOfClass:YunAccountModel.class
                                       fromJSONDictionary:data
                                                    error:&modelErr];

    if (modelErr) {
        [YunLogHelper logMsg:FORMAT(@"model_error:%@", modelErr)];
        return nil;
    }
    else {return model;}
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError **)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (self == nil) return nil;

    return self;
}

@end