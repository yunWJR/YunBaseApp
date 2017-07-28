//
// Created by yun on 2017/7/6.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUITextFieldFactory : NSObject {

}

+ (UITextField *)tfWithPh:(NSString *)ph
                     font:(UIFont *)font
                textColor:(UIColor *)textColor
                    isSec:(BOOL)isSec
                  rtnType:(UIReturnKeyType)rtnType
                   kbType:(UIKeyboardType)kbType;

@end