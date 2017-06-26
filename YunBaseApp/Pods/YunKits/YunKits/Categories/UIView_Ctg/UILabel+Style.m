//
// Created by 王健 on 2016/11/9.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "UILabel+Style.h"

@implementation UILabel (Style)

- (void)setText:(NSString *)text font:(UIFont *)font color:(UIColor *)color {
    if (self == nil) {
        return;
    }

    self.text = text;
    self.font = font;
    self.textColor = color;
}

- (void)setAlign:(NSTextAlignment)align lines:(NSInteger)lines adjust:(BOOL)adjust {
    if (self == nil) {
        return;
    }

    self.textAlignment = align;
    self.numberOfLines = lines;
    self.adjustsFontSizeToFitWidth = adjust;
}

- (void)setRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color {
    if (self == nil) {
        return;
    }

    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    [self.layer setBorderWidth:width];
    if (color) {
        [self.layer setBorderColor:color.CGColor];
    }
}

@end