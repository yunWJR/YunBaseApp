//
// Created by yun on 2018/7/17.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YunAccountModel;
@class YunAccountMg;

@protocol YunAccountMgDelegate <NSObject>

@optional

- (void)didAcctUpdated:(YunAccountModel *)acct;

- (void)didAcctRemoved:(YunAccountModel *)acct;

- (NSString *)getUserToken:(YunAccountModel *)acct;

@end

@interface YunAccountMg : NSObject

// delegate
@property (nonatomic, weak) id <YunAccountMgDelegate> delegate;

// 账户数据
@property (nonatomic, strong) YunAccountModel *acct;

// 账户文件名
@property (nonatomic, copy) NSString *acctFileName;

// 数据改变
@property (nonatomic, copy) void (^didDataChanged)(YunAccountModel *data);

#pragma mark - public method

- (void)storeUser:(id)user name:(NSString *)name;

- (void)storeUser:(id)user;

- (id)fetchUser;

- (NSString *)fetchUserName;

- (NSString *)getUserToken;

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