//
//  UIColor+YunAdd.h
//
//  Created by WangJianrong on 15/11/13.
//  Copyright (c) 2015年 爱多星球教育科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YunAdd)

+ (UIColor *)hexColor:(UInt32)hex;

+ (UIColor *)hexColor:(UInt32)hex alpha:(CGFloat)alpha;

+ (UIColor *)hexColorString:(NSString *)color alpha:(CGFloat)alpha;

+ (UIColor *)randomColor;

@end
