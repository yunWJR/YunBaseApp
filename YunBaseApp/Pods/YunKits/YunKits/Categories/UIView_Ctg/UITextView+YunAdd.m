//
// Created by yun on 2017/5/22.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "UITextView+YunAdd.h"

@implementation UITextView (YunAdd)

- (CGFloat)heightByWidth:(CGFloat)width {
    CGSize sizeToFit = [self sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

- (CGFloat)getCtnHeight {
    CGSize sizeToFit = [self sizeThatFits:CGSizeMake(self.frame.size.width, MAXFLOAT)];
    return sizeToFit.height;
}

@end