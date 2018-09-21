//
// Created by yun on 2018/7/17.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAccountMg.h"
#import "YunAccountModel.h"
#import "YunAccountMgHelper.h"
#import "YunCacheFileHelper.h"

@interface YunAccountMg () {
}

@end

@implementation YunAccountMg

- (instancetype)init {
    self = [super init];
    if (self) {
        _acctFileName = @"YunAccountData";

        YunAccountMgHelper.mg = self;
    }

    return self;
}

#pragma mark - public method

- (void)storeUser:(id)user name:(NSString *)name {
    if (_acct == nil) {
        _acct = [YunAccountModel new];
    }
    _acct.user = user;
    _acct.userName = name;

    [self saveAcctData];

    [self handleAcctUpdated];
}

- (void)storeUser:(id)user {
    if (_acct == nil) {
        _acct = [YunAccountModel new];
    }
    _acct.user = user;

    [self saveAcctData];

    [self handleAcctUpdated];
}

- (id)fetchUser {
    if (_acct == nil) {
        [self loadAcctData];
    }

    return _acct.user;
}

- (NSString *)fetchUserName {
    if (_acct == nil) {
        [self loadAcctData];
    }

    return _acct.userName;
}

- (NSString *)getUserToken {
    if (_delegate && [_delegate respondsToSelector:@selector(getUserToken:)]) {

        return [_delegate getUserToken:_acct];
    }

    return nil;
}

- (void)removeUser {
    if (_acct) {
        _acct.user = nil;

        [self saveAcctData];
    }

    [self handleAcctRemoved];
}

- (void)removeAcct {
    if (_acct) {
        _acct = nil;

        [self removeAcctData];
    }

    [self handleAcctRemoved];
}

#pragma mark - handle

- (void)handleAcctUpdated {
    if (_didDataChanged) {
        _didDataChanged(_acct);
    }

    if (_delegate && [_delegate respondsToSelector:@selector(didAcctUpdated:)]) {
        [_delegate didAcctUpdated:_acct];
    }
}

- (void)handleAcctRemoved {
    if (_didDataChanged) {
        _didDataChanged(_acct);
    }

    if (_delegate && [_delegate respondsToSelector:@selector(didAcctRemoved:)]) {
        [_delegate didAcctRemoved:_acct];
    }
}

#pragma mark - store

- (void)saveAcctData {
    [YunCacheFileHelper.instance saveItemTask:_acct fileName:_acctFileName];
}

- (void)loadAcctData {
    _acct = [YunCacheFileHelper.instance getItemTaskByName:_acctFileName];
}

- (void)removeAcctData {
    [YunCacheFileHelper.instance removeItemByName:_acctFileName];
}

@end