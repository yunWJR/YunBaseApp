//
//  UILabel+YunAdd.m
//
// Created by yun on 16/5/8.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UILabel+YunAdd.h"
#import "YunConfig.h"
#import "YunValueVerifier.h"

@implementation UILabel (YunAdd)

+ (CGFloat)calHeightByWidth:(CGFloat)width text:(NSString *)text font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = text;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];

    return label.frame.size.height;
}

+ (CGFloat)calOneLineHeight:(UIFont *)font {
    return [self calHeightByWidth:100 text:@"字" font:font];
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

- (CGFloat)getTextHeightByWidth:(CGFloat)width {
    return [UILabel calHeightByWidth:width text:self.text font:self.font];
}

- (CGFloat)getOneLineHeight {
    return [UILabel calHeightByWidth:100 text:@"字" font:self.font];
}

- (CGFloat)getOneLineHeightOff {
    return self.getOneLineHeight + YunConfig.instance.ctnVtOff;
}

- (CGFloat)getTextWidth {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];
    if (self.attributedText) {
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

@end
