///
/// Created by yun on 2018/7/17.
/// Copyright (c) 2018 skkj. All rights reserved.
///

#import <Mantle/MTLModel.h>
#import <Mantle/Mantle.h>

@interface YunAccountModel : MTLModel <MTLJSONSerializing>

/// 用户数据
@property (nonatomic, strong) id user;

/// 用户名
@property (nonatomic, copy) NSString *userName;

/// 自定义数据-可将对象转换为 json 字符串
@property (nonatomic, copy) NSString *customData;

+ (instancetype)modelWithData:(id)data;

@end