//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAlertViewHelper.h"
#import "YunAppView.h"

@interface YunAppView (AlertView)

@property (nonatomic, strong) YunAlertViewHelper *alertView;

@property (nonatomic, strong) YunAlertViewHelper *rqtAlertView;

- (void)showRqtAlert:(NSString *)content sv:(UIView *)sv result:(void (^)(void))result;

@end