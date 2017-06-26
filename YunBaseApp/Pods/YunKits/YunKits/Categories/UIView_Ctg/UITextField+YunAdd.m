//
//  Created by 王健 on 16/4/19.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "UITextField+YunAdd.h"

@implementation UITextField (YunAdd)

- (void)setTextLeftPadding:(CGFloat)leftPadding {
    CGRect frame = self.frame;
    frame.size.width = leftPadding;
    UIView *leftView = [[UIView alloc] initWithFrame:frame];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftView;
}

- (void)setRadius:(CGFloat)radius color:(UIColor *)color width:(CGFloat)width {
    self.borderStyle = UITextBorderStyleNone;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = width;
    self.layer.cornerRadius = radius;
}

@end
