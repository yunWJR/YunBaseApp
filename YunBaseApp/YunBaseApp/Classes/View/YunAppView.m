//
//  Created by 王健 on 16/8/25.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunAppView.h"

@implementation YunAppView

- (instancetype)initWithSideOff:(CGFloat)sideOff superVC:(UIViewController *)superVC {
    self = [super init];
    if (self) {
        self.sideOff = sideOff;
        self.superVC = superVC;
        self.firstLoad = YES;
    }

    return self;
}

+ (instancetype)viewWithSideOff:(CGFloat)sideOff superVC:(UIViewController *)superVC {
    return [[self alloc] initWithSideOff:sideOff superVC:superVC];
}

- (instancetype)init {
    if (self = [super init]) {
        _sideOff = 10;
        _firstLoad = YES;
    }
    return self;
}

#pragma mark - public funtions

- (void)updateData:(BOOL)force {

}

@end