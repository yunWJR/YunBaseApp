//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunAppView.h"
#import "YunAppConfig.h"

@implementation YunAppView {
    UIViewController *_superVc;
}

- (instancetype)init {
    if (self = [super init]) {
        _firstLoad = YES;
        _updateInterval = YunAppConfig.instance.viewUpdateInterval;

        _noCtnMsg = @"无内容";

        self.sideOff = YunAppConfig.instance.defViewSideOff;
    }
    return self;
}

#pragma mark - public funtions

- (void)updateData:(BOOL)force {
}

- (UIViewController *)superVC {
    if (_superVc == nil) {
        return [self superViewController];
    }
    else {
        return _superVc;
    }
}

- (void)setSuperVC:(UIViewController *)superVC {
    _superVc = superVC;
}

#pragma mark - request functions

- (void)rqtDataFromServer:(BOOL)force {
    if (force || self.canUpdate) {
        [self rqtDataFromServer];
    }
    else {
        return;
    }
}

- (void)rqtDataFromServer {
    [self setCurUpdateDate];
}

- (void)rqtMoreDataFromServer {
}

- (void)updateVcData {
    self.hasUpdated = YES;
    [self setCurUpdateDate];
}

#pragma mark - update date

- (void)setCurUpdateDate {
    _lastUpdateDate = [NSDate date];
}

- (BOOL)canUpdate {
    if (_lastUpdateDate == nil) {
        return YES;
    }

    NSTimeInterval time = [[NSDate date] timeIntervalSinceDate:_lastUpdateDate];
    return time > _updateInterval;
}

@end