//
// Created by 王健 on 16/9/19.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUIButtonFactory : NSObject

+ (UIButton *_Nonnull)btnWithTarget:(id _Nullable)target
                             action:(SEL _Nullable)action;

+ (UIButton *_Nonnull)btnWithBgImg:(NSString *_Nonnull)bgImg
                            target:(id _Nullable)target
                            action:(SEL _Nullable)action;

+ (UIButton *_Nonnull)btnWithImg:(NSString *_Nonnull)bgImg
                           scale:(CGFloat)scale
                          target:(id _Nullable)target
                          action:(SEL _Nullable)action;

+ (UIButton *_Nonnull)btnWithTitle:(NSString *_Nonnull)title
                        titleColor:(UIColor *_Nonnull)titleColor
                         titleFont:(UIFont *_Nonnull)titleFont
                           bgColor:(UIColor *_Nonnull)bgColor
                            radius:(CGFloat)radius
                            border:(CGFloat)border
                       borderColor:(UIColor *_Nullable)borderColor
                            target:(id _Nullable)target
                            action:(SEL _Nullable)action;

+ (UIButton *_Nonnull)btnWithTitle:(NSString *_Nonnull)title
                         titleFont:(UIFont *_Nonnull)titleFont
                        titleColor:(UIColor *_Nonnull)titleColor
                            target:(id _Nullable)target
                            action:(SEL _Nullable)action;

+ (UIButton *_Nonnull)btnWithIconName:(NSString *_Nonnull)icon
                             fontSize:(CGFloat)fontSize
                                color:(UIColor *_Nonnull)color
                               target:(id _Nullable)target
                               action:(SEL _Nullable)action;

+ (UIButton *_Nonnull)btnWithIconName:(NSString *_Nonnull)icon
                           hlIconName:(NSString *_Nonnull)hlIcon
                             fontSize:(CGFloat)fontSize
                                color:(UIColor *_Nonnull)color
                               target:(id _Nullable)target
                               action:(SEL _Nullable)action;

+ (UIButton *_Nonnull)btnWithIconName:(NSString *_Nonnull)icon
                             iconSize:(CGFloat)iconSize
                            iconColor:(UIColor *_Nonnull)iconColor
                                title:(NSString *_Nonnull)title
                        titleFontSize:(UIFont *_Nonnull)titleFont
                           titleColor:(UIColor *_Nonnull)titleColor
                               isHori:(BOOL)isHori
                               target:(id _Nullable)target
                               action:(SEL _Nullable)action;

@end