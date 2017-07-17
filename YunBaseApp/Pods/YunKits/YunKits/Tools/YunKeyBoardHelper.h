//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol YunKeyBoardDelegate <NSObject>

- (void)kbWillShow:(CGSize)size antDur:(double)antDur;

- (void)kbWillHide:(double)antDur;

@end

@interface YunKeyBoardHelper : NSObject

@property (nonatomic, weak) id <YunKeyBoardDelegate> delegate;

@property (nonatomic, assign) BOOL kbIsOn;

+ (instancetype)kbHelper:(id)target;

- (void)addKbNtf;

- (void)removeKbNtf;

@end