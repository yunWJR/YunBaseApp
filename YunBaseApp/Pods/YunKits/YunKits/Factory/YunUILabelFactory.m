//
// Created by yun on 16/9/18.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunUILabelFactory.h"
#import "UILabel+Style.h"
#import "YunConfig.h"
#import "UIView+YunAdd.h"

@implementation YunUILabelFactory

+ (UILabel *)label {
    UILabel *lbl = [UILabel new];
    lbl.lineBreakMode = NSLineBreakByTruncatingTail;

    return lbl;
}

+ (UILabel *)labelWithText:(NSString *)text
                      font:(UIFont *)font
                     color:(UIColor *)color {
    return [self labelWithText:text font:font color:color align:NSTextAlignmentLeft lines:1 adjust:NO];
}

+ (UILabel *)labelWithMulText:(NSString *)text
                         font:(UIFont *)font
                        color:(UIColor *)color {
    return [self labelWithText:text font:font color:color align:NSTextAlignmentLeft lines:0 adjust:NO];
}

+ (UILabel *)labelWithText:(NSString *)text
                      font:(UIFont *)font
                     color:(UIColor *)color
                     align:(NSTextAlignment)align lines:(NSInteger)lines adjust:(BOOL)adjust {
    UILabel *lbl = [self label];
    [lbl setText:text font:font color:color];
    [lbl setAlign:align lines:lines adjust:adjust];

    return lbl;
}

+ (UILabel *)labelWithText:(NSString *)text
                      font:(UIFont *)font
                     color:(UIColor *)color
                     align:(NSTextAlignment)align
                     lines:(NSInteger)lines
                    adjust:(BOOL)adjust
                    radius:(CGFloat)radius
                     width:(CGFloat)width
               borderColor:(UIColor *)borderColor {
    UILabel *lbl = [self labelWithText:text font:font color:color
                                 align:align lines:lines adjust:adjust];
    [lbl setViewRadius:radius width:width color:borderColor];

    return lbl;
}

+ (UILabel *)labelWithIcon:(NSString *_Nullable)icon
                  fontSize:(CGFloat)fontSize
                     color:(UIColor *_Nullable)color {
    UILabel *iconLbl = [UILabel new];
    iconLbl.font = [UIFont fontWithName:YunConfig.instance.iconFontName size:fontSize];
    iconLbl.text = icon;
    iconLbl.textColor = color;
    iconLbl.textAlignment = NSTextAlignmentCenter;
    iconLbl.numberOfLines = 1;
    iconLbl.adjustsFontSizeToFitWidth = YES;

    return iconLbl;
}

@end