//
// Created by yun on 2018/7/23.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YunAlertStyleModel;
@class YunAlertView;

typedef NS_ENUM(NSInteger, AlertType) {
    AlertTypeCustom = 0,
    AlertTypeIKnown,
    AlertTypeYes,
    AlertTypeSur,
    AlertTypeYesNo,
    AlertTypeSurCan,
    AlertTypeDelCan,
};

typedef void(^AlertYesBlock)(BOOL yes);

typedef void(^AlertCustomBlock)(NSInteger index);

@interface YunAlertViewHelper : NSObject

@property (nonatomic, copy) AlertYesBlock yesBlock;

@property (nonatomic, copy) AlertCustomBlock customBlock;

@property (nonatomic, strong) YunAlertView *alertView;

@property (nonatomic, assign) BOOL isCreat;

+ (instancetype)factory;

+ (instancetype)instance;

- (void)showDelete:(NSString *)content result:(AlertYesBlock)result;

- (void)showYes:(NSString *)content;

- (void)showYes:(NSString *)content result:(AlertYesBlock)result;

- (void)showYesNo:(NSString *)content result:(AlertYesBlock)result;

- (void)showAlert:(AlertType)type
          content:(NSString *)content
         yesBlock:(AlertYesBlock)yesBlock
         cusBlock:(AlertCustomBlock)cusBlock
        superView:(UIView *)superView;

- (void)showAlert:(NSString *)title
          content:(NSString *)content
        btnTitles:(NSArray *)btnTitles
         yesBlock:(AlertYesBlock)yesBlock
         cusBlock:(AlertCustomBlock)cusBlock
        superView:(UIView *)superView;

- (void)showAlert:(NSString *)title
          content:(NSString *)content
        btnTitles:(NSArray *)btnTitles
        btnStyles:(NSArray<YunAlertStyleModel *> *)btnStyles
         yesBlock:(AlertYesBlock)yesBlock
         cusBlock:(AlertCustomBlock)cusBlock
        superView:(UIView *)superView;

@end