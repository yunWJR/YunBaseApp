//
// Created by yun on 2017/9/8.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UIFont+YunAdd.h"

@implementation UIFont (YunAdd)

- (CGFloat)lineItv {
    return (self.lineHeight - self.pointSize);
}

- (CGFloat)lineTopOff {
    return self.lineItv * 0.5f;
}

@end