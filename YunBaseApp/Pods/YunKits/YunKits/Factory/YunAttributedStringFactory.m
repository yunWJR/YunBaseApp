//
// Created by 王健 on 16/9/19.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunAttributedStringFactory.h"
#import "YunConfig.h"

@implementation YunAttributedStringFactory

+ (NSMutableAttributedString *_Nonnull)aStrWithIcon:(NSString *_Nonnull)icon
                                           iconSize:(CGFloat)iconSize
                                              title:(NSString *_Nonnull)title
                                          titleFont:(UIFont *_Nonnull)titleFont
                                           forColor:(UIColor *_Nonnull)forColor
                                             isHori:(BOOL)isHori {
    NSString *str;
    if (isHori) {
        str = [NSString stringWithFormat:@"%@%@", icon, title];
    }
    else {
        str = [NSString stringWithFormat:@"%@\n%@", icon, title];
    }

    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc] initWithString:str];
    [atStr addAttribute:NSFontAttributeName
                  value:[UIFont fontWithName:YunConfig.instance.iconFontName size:iconSize]
                  range:NSMakeRange(0, str.length - title.length)];

    [atStr addAttribute:NSForegroundColorAttributeName
                  value:forColor
                  range:NSMakeRange(0, str.length - title.length)];

    [atStr addAttribute:NSFontAttributeName
                  value:titleFont
                  range:NSMakeRange(str.length - title.length, title.length)];

    [atStr addAttribute:NSForegroundColorAttributeName
                  value:forColor
                  range:NSMakeRange(str.length - title.length, title.length)];

    return atStr;
}

+ (NSMutableAttributedString *_Nonnull)aStrWithIcon:(NSString *_Nonnull)icon
                                          iconColor:(UIColor *_Nonnull)iconColor
                                           iconSize:(CGFloat)iconSize
                                              title:(NSString *_Nonnull)title
                                         titleColor:(UIColor *_Nonnull)titleColor
                                          titleFont:(UIFont *_Nonnull)titleFont
                                             isHori:(BOOL)isHori {
    NSString *str;
    if (isHori) {
        str = [NSString stringWithFormat:@"%@%@", icon, title];
    }
    else {
        str = [NSString stringWithFormat:@"%@\n%@", icon, title];
    }

    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc] initWithString:str];
    [atStr addAttribute:NSFontAttributeName
                  value:[UIFont fontWithName:YunConfig.instance.iconFontName size:iconSize]
                  range:NSMakeRange(0, str.length - title.length)];

    [atStr addAttribute:NSForegroundColorAttributeName
                  value:iconColor
                  range:NSMakeRange(0, str.length - title.length)];

    [atStr addAttribute:NSFontAttributeName
                  value:titleFont
                  range:NSMakeRange(str.length - title.length, title.length)];

    [atStr addAttribute:NSForegroundColorAttributeName
                  value:titleColor
                  range:NSMakeRange(str.length - title.length, title.length)];

    if (!isHori) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = NSTextAlignmentCenter;
        paragraphStyle.lineSpacing = 4;

        [atStr addAttribute:NSParagraphStyleAttributeName
                      value:paragraphStyle
                      range:NSMakeRange(0, str.length)];
    }

    return atStr;
}

+ (NSMutableAttributedString *_Nonnull)aStrWithTitle1:(NSString *_Nonnull)title1
                                           title1Font:(UIFont *_Nonnull)title1Font
                                          title1Color:(UIColor *_Nonnull)title1Color
                                               title2:(NSString *_Nonnull)title2
                                           title2Font:(UIFont *_Nonnull)title2Font
                                          title2Color:(UIColor *_Nonnull)title2Color
                                               isHori:(BOOL)isHori {
    NSString *str;
    if (isHori) {
        str = [NSString stringWithFormat:@"%@%@", title1, title2];
    }
    else {
        str = [NSString stringWithFormat:@"%@\n%@", title1, title2];
    }

    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc] initWithString:str];
    [atStr addAttribute:NSFontAttributeName
                  value:title1Font
                  range:NSMakeRange(0, str.length - title2.length)];

    [atStr addAttribute:NSForegroundColorAttributeName
                  value:title1Color
                  range:NSMakeRange(0, str.length - title2.length)];

    [atStr addAttribute:NSFontAttributeName
                  value:title2Font
                  range:NSMakeRange(str.length - title2.length, title2.length)];

    [atStr addAttribute:NSForegroundColorAttributeName
                  value:title2Color
                  range:NSMakeRange(str.length - title2.length, title2.length)];

    return atStr;
}

+ (NSMutableAttributedString *_Nonnull)aStrWithTitle:(NSString *_Nonnull)title
                                          titleColor:(UIColor *_Nonnull)titleColor
                                           titleFont:(UIFont *_Nonnull)titleFont
                                          hasDelLine:(BOOL)hasDelLine {
    if (title == nil) {
        return nil;
    }

    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc] initWithString:title];
    [atStr addAttribute:NSFontAttributeName
                  value:titleFont
                  range:NSMakeRange(0, title.length)];

    [atStr addAttribute:NSForegroundColorAttributeName
                  value:titleColor
                  range:NSMakeRange(0, title.length)];

    if (hasDelLine) {
        [atStr addAttribute:NSStrikethroughStyleAttributeName
                      value:@(NSUnderlineStyleSingle | NSUnderlinePatternSolid)
                      range:NSMakeRange(0, title.length)];

        // for 10.13
        [atStr addAttribute:NSBaselineOffsetAttributeName
                      value:@(0)
                      range:NSMakeRange(0, title.length)];
    }

    return atStr;
}

+ (NSMutableAttributedString *_Nonnull)aStrWithTitle:(NSString *_Nonnull)title
                                          titleColor:(UIColor *_Nonnull)titleColor
                                           titleFont:(UIFont *_Nonnull)titleFont
                                        hasUnderLine:(BOOL)hasUnderLine {
    if (title == nil) {
        return nil;
    }

    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc] initWithString:title];
    [atStr addAttribute:NSFontAttributeName
                  value:titleFont
                  range:NSMakeRange(0, title.length)];

    [atStr addAttribute:NSForegroundColorAttributeName
                  value:titleColor
                  range:NSMakeRange(0, title.length)];

    if (hasUnderLine) {
        [atStr addAttribute:NSUnderlineStyleAttributeName
                      value:@(NSUnderlineStyleSingle)
                      range:NSMakeRange(0, title.length)];

        // for 10.13
        [atStr addAttribute:NSBaselineOffsetAttributeName
                      value:@(0)
                      range:NSMakeRange(0, title.length)];
    }

    return atStr;
}

@end