//
// Created by 王健 on 16/9/19.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunAttributedStringFactory : NSObject

+ (NSMutableAttributedString *_Nonnull)aStrWithIcon:(NSString *_Nonnull)icon
                                           iconSize:(CGFloat)iconSize
                                              title:(NSString *_Nonnull)title
                                          titleFont:(UIFont *_Nonnull)titleFont
                                           forColor:(UIColor *_Nonnull)forColor
                                             isHori:(BOOL)isHori;

+ (NSMutableAttributedString *_Nonnull)aStrWithIcon:(NSString *_Nonnull)icon
                                          iconColor:(UIColor *_Nonnull)iconColor
                                           iconSize:(CGFloat)iconSize
                                              title:(NSString *_Nonnull)title
                                         titleColor:(UIColor *_Nonnull)titleColor
                                          titleFont:(UIFont *_Nonnull)titleFont
                                             isHori:(BOOL)isHori;

+ (NSMutableAttributedString *_Nonnull)aStrWithTitle1:(NSString *_Nonnull)title1
                                           title1Font:(UIFont *_Nonnull)title1Font
                                          title1Color:(UIColor *_Nonnull)title1Color
                                               title2:(NSString *_Nonnull)title2
                                           title2Font:(UIFont *_Nonnull)title2Font
                                          title2Color:(UIColor *_Nonnull)title2Color
                                               isHori:(BOOL)isHori;

+ (NSMutableAttributedString *_Nonnull)aStrWithTitle:(NSString *_Nonnull)title
                                          titleColor:(UIColor *_Nonnull)titleColor
                                           titleFont:(UIFont *_Nonnull)titleFont
                                          hasDelLine:(BOOL)hasDelLine;

+ (NSMutableAttributedString *_Nonnull)aStrWithTitle:(NSString *_Nonnull)title
                                          titleColor:(UIColor *_Nonnull)titleColor
                                           titleFont:(UIFont *_Nonnull)titleFont
                                        hasUnderLine:(BOOL)hasUnderLine;

@end