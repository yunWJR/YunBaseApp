//
// Created by 王健 on 16/5/26.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YunErrorModel.h"
#import "YunErrorConfig.h"

@class YunRqtRpsHelper;

@interface YunErrorHelper : NSObject

@property (nonatomic, strong) NSError *error;

+ (instancetype)itemWithRpsError:(YunRqtRpsHelper *)rps;

- (YunErrorModel *)getError;

@end