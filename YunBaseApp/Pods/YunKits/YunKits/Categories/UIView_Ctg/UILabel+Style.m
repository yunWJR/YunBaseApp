//
// Created by 王健 on 2016/11/9.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "UILabel+Style.h"
#import "UIView+YunAdd.h"

@implementation UILabel (Style)

- (void)setText:(NSString *)text font:(UIFont *)font color:(UIColor *)color {
    self.text = text;

    if (font) {
        self.font = font;
    }

    if (color) {
        self.textColor = color;
    }
}

- (void)setAlign:(NSTextAlignment)align lines:(NSInteger)lines adjust:(BOOL)adjust {
    self.textAlignment = align;
    self.numberOfLines = lines;
    self.adjustsFontSizeToFitWidth = adjust;
}

- (void)setRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color {
    [self setViewRadius:radius width:width color:color];
}

@end