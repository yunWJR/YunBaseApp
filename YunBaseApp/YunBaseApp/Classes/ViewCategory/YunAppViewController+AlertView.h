//
// Created by yun on 2017/11/15.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAlertViewHelper.h"
#import "YunAppViewController.h"

@interface YunAppViewController (AlertView)

@property (nonatomic, strong) YunAlertViewHelper *alertView;

@property (nonatomic, strong) YunAlertViewHelper *rqtAlertView;

- (void)showRqtAlert:(NSString *)content sv:(UIView *)sv result:(void (^)(void))result;

@end