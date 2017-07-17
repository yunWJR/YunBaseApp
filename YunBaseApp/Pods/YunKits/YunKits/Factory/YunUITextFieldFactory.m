//
// Created by yun on 2017/7/6.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunUITextFieldFactory.h"

@implementation YunUITextFieldFactory

- (UITextField *)tfWithPh:(NSString *)ph
                     font:(UIFont *)font
                textColor:(UIColor *)textColor
                    isSec:(BOOL)isSec
                  rtnType:(UIReturnKeyType)rtnType
                   kbType:(UIKeyboardType)kbType {
    UITextField *tf = [UITextField new];
    tf.textColor = textColor;
    tf.font = font;

    tf.placeholder = ph;
    tf.secureTextEntry = isSec;
    tf.returnKeyType = rtnType;
    tf.keyboardType = kbType;

    return tf;
}

@end