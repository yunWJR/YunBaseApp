//
// Created by 王健 on 16/5/26.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunErrorHelper.h"
#import "YunRqtRpsHelper.h"

@implementation YunErrorHelper

+ (instancetype)itemWithRpsError:(YunRqtRpsHelper *)rps {
    YunErrorHelper *item = [[YunErrorHelper alloc] initWithRpsError:rps];

    return item;
}

- (instancetype)initWithRpsError:(YunRqtRpsHelper *)rps {
    self = [self initWithError:rps.rpsError];

    return self;
}

- (instancetype)initWithError:(NSError *)error {
    NSLog(@"Error: %@", error);

    self = [super init];
    if (self) {
        _error = error;
    }

    return self;
}

#pragma mark - public functions

- (YunErrorModel *)getError {
    return [YunErrorConfig.instance getErrorItem:_error.code];
}

@end