//
// Created by yun on 2018/7/24.
// Copyright (c) 2018 skkj. All rights reserved.
//

#import "YunAppView+AlertView.h"
#import "YunAppView+CoverView.h"
#import "YunAlertView.h"

@implementation YunAppView (AlertView)

- (YunAlertViewHelper *)alertView {
    return (YunAlertViewHelper *) [self getBlankView:ViewAlertView];
}

- (void)setAlertView:(YunAlertViewHelper *)YunAlertViewFactory {
    [self setItem:ViewAlertView view:YunAlertViewFactory];
}

- (YunAlertViewHelper *)rqtAlertView {
    return (YunAlertViewHelper *) [self getBlankView:ViewRqtAlertView];
}

- (void)setRqtAlertView:(YunAlertViewHelper *)rqtYunAlertViewFactory {
    [self setItem:ViewRqtAlertView view:rqtYunAlertViewFactory];
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
             superView:self];

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