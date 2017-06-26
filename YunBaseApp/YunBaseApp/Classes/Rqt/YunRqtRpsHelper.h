//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YunRqtRpsHelper : NSObject

@property (nonatomic, strong) id rspObj;

- (instancetype)initWithRsp:(id)rspObj;

- (BOOL)isSuccess;

- (id)data;

- (NSString *)errorMsg;

- (NSInteger)errorCode;

- (NSError *)rpsError;

@end
