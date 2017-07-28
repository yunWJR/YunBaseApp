//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunAppView.h"
#import "UIView+YunAdd.h"

@implementation YunAppView {
    UIViewController *_superVc;
}

- (instancetype)init {
    if (self = [super init]) {
        _firstLoad = YES;
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

@end