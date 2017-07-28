//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUILabelFactory : NSObject

+ (UILabel *_Nonnull)label;

+ (UILabel *_Nonnull)labelWithText:(NSString *_Nullable)text
                              font:(UIFont *_Nullable)font
                             color:(UIColor *_Nullable)color;

+ (UILabel *_Nonnull)labelWithMulText:(NSString *_Nullable)text
                                 font:(UIFont *_Nullable)font
                                color:(UIColor *_Nullable)color;

+ (UILabel *_Nonnull)labelWithIcon:(NSString *_Nullable)icon
                          fontSize:(CGFloat)fontSize
                             color:(UIColor *_Nullable)color;

+ (UILabel *_Nonnull)labelWithText:(NSString *_Nullable)text
                              font:(UIFont *_Nullable)font
                             color:(UIColor *_Nullable)color
                             align:(NSTextAlignment)align
                             lines:(NSInteger)lines
                            adjust:(BOOL)adjust;

+ (UILabel *_Nonnull)labelWithText:(NSString *_Nullable)text
                              font:(UIFont *_Nullable)font
                             color:(UIColor *_Nullable)color
                             align:(NSTextAlignment)align
                             lines:(NSInteger)lines
                            adjust:(BOOL)adjust
                            radius:(CGFloat)radius
                             width:(CGFloat)width
                       borderColor:(UIColor *_Nullable)borderColor;

@end