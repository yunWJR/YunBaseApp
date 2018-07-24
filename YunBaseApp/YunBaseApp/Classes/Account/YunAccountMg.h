//
// Created by yun on 2018/7/17.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YunAccountModel;

@interface YunAccountMg : NSObject

// 账户数据
@property (nonatomic, strong) YunAccountModel *acct;

// 账户文件名
@property (nonatomic, copy) NSString *acctFileName;

@property (nonatomic, copy) void (^didDataChanged)(YunAccountModel *data);

#pragma mark - public method

- (void)storeUser:(id)user name:(NSString *)name;

- (id)fetchUser;

- (NSString *)fetchUserName;

- (void)removeUser;

- (void)removeAcct;

#pragma mark - handle

- (void)handleAcctUpdated;

- (void)handleAcctRemoved;

#pragma mark - store

- (void)saveAcctData;

- (void)loadAcctData;

- (void)removeAcctData;

@end