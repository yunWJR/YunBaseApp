//
//  UILabel+YunAdd.m
//
// Created by yun on 16/5/8.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UILabel+YunAdd.h"
#import "YunConfig.h"
#import "YunValueVerifier.h"
#import "UIFont+YunAdd.h"

@implementation UILabel (YunAdd)

#pragma mark - 类方法

+ (CGFloat)calHeightByWidth:(CGFloat)width text:(NSString *)text font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = text;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];

    return label.frame.size.height;
}

+ (CGFloat)calOneLineHeight:(UIFont *)font {
    return font.lineHeight;
}

+ (CGFloat)calWidthWithText:(NSString *)text font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];
    label.text = text;
    label.font = font;

    return [label getTextWidth];
}

+ (CGFloat)calWidthWithTextAt:(NSAttributedString *)at {
    UILabel *label = [UILabel new];
    label.attributedText = at;

    return [label getTextWidth];
}

#pragma mark - 实例方法

- (CGFloat)getTextHeightByWidth:(CGFloat)width {
    if (self.hasAt) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
        label.attributedText = self.attributedText;
        label.numberOfLines = 0;
        [label sizeToFit];

        return label.frame.size.height;
    }

    return [UILabel calHeightByWidth:width text:self.text font:self.font];
}

- (CGFloat)getOneLineHeight {
    if (self.hasAt) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];
        label.attributedText = self.attributedText;

        // 修正无内容时，高度为0
        if (self.text.length == 0) {
            label.text = @"一";
        }
        label.numberOfLines = 1;

        [label sizeToFit];

        return label.frame.size.height;
    }

    return self.font.lineHeight;
}

- (CGFloat)getOneLineHeightWithoutOffV {
    return self.getOneLineHeight - self.font.lineItv;
}

- (CGFloat)getTextWidth {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];
    if (self.hasAt) {
        label.attributedText = self.attributedText;
    }
    else {
        label.text = self.text;
        label.font = self.font;
    }

    [label sizeToFit];

    return label.frame.size.width;
}

- (CGFloat)getTitleWidthOff {
    return self.getTextWidth + YunConfig.instance.ctnHlOff;
}

- (CGFloat)getWidthByWordCount:(NSInteger)count {
    return [self getOneWordWidth] * count;
}

- (CGFloat)getOneWordWidth {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];
    label.text = @"字";
    label.font = self.font;
    [label sizeToFit];

    return label.frame.size.width;
}

- (void)setText:(NSString *)text lineInner:(CGFloat)inner {
    if ([YunValueVerifier isInvalidStr:text]) {
        return;
    }

    NSMutableAttributedString *atStr = [[NSMutableAttributedString alloc] initWithString:text];
    [atStr addAttribute:NSFontAttributeName
                  value:self.font
                  range:NSMakeRange(0, text.length)];

    [atStr addAttribute:NSForegroundColorAttributeName
                  value:self.textColor
                  range:NSMakeRange(0, text.length)];

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = self.textAlignment;
    paragraphStyle.lineSpacing = inner;

    [atStr addAttribute:NSParagraphStyleAttributeName
                  value:paragraphStyle
                  range:NSMakeRange(0, text.length)];

    self.attributedText = atStr;
}

- (BOOL)hasAt {
    if (self.attributedText.length > 0 &&
        self.attributedText.length > self.attributedText.string.length) {
        return YES;
    }

    return NO;
}

@end