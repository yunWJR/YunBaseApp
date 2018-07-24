//
// Created by yun on 2017/11/15.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunAppViewController+AlertView.h"
#import "YunAppViewController+CoverView.h"
#import "YunAlertView.h"

@implementation YunAppViewController (AlertView)

- (YunAlertViewHelper *)alertView {
    return (YunAlertViewHelper *) [self getBlankView:VcAlertView];
}

- (void)setAlertView:(YunAlertViewHelper *)YunAlertViewFactory {
    [self setItem:VcAlertView view:YunAlertViewFactory];
}

- (YunAlertViewHelper *)rqtAlertView {
    return (YunAlertViewHelper *) [self getBlankView:VcRqtAlertView];
}

- (void)setRqtAlertView:(YunAlertViewHelper *)rqtYunAlertViewFactory {
    [self setItem:VcRqtAlertView view:rqtYunAlertViewFactory];
}

- (void)showRqtAlert:(NSString *)content
                  sv:(UIView *)sv
              result:(void (^)(void))result {
    if (self.alertView == nil) {
        YunAlertViewHelper *fct = YunAlertViewHelper.factory;
        fct.isCreat = YES;
        [fct showAlert:AlertTypeSur
               content:content
              yesBlock:nil
              cusBlock:nil
             superView:self.view];

        self.alertView = fct;
    }

    [self.alertView.alertView updateSuperView:sv];
    [self.alertView.alertView updateContent:content];

    self.alertView.yesBlock = ^(BOOL yes) {
        if (result) {
            result();
        }
    };

    [self.alertView.alertView showView];
}

@end