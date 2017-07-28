//
//  Created by 王健 on 16/4/19.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "UITextField+YunAdd.h"
#import "UIView+YunAdd.h"

@implementation UITextField (YunAdd)

- (void)setTextLeftPadding:(CGFloat)leftPadding {
    CGRect frame = self.frame;
    frame.size.width = leftPadding;
    UIView *leftView = [[UIView alloc] initWithFrame:frame];
    self.leftViewMode = UITextFieldViewModeAlways;
    self.leftView = leftView;
}

- (void)setRadius:(CGFloat)radius color:(UIColor *)color width:(CGFloat)width {
    [self setViewRadius:radius width:width color:color];
}

- (void)setPhColor:(UIColor *)phColor phFont:(UIFont *)phFont {
    if (phColor) {
        [self setValue:phColor forKeyPath:@"_placeholderLabel.textColor"];
    }

    if (phFont) {
        [self setValue:phFont forKeyPath:@"_placeholderLabel.font"];
    }
}

- (void)setPhText:(NSString *)text
              tAl:(NSTextAlignment)tAl
             font:(UIFont *)font
            color:(UIColor *)color {
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = tAl;

    NSAttributedString *at =
            [[NSAttributedString alloc] initWithString:text
                                            attributes:@{
                                                    NSForegroundColorAttributeName : color,
                                                    NSFontAttributeName            : font,
                                                    NSParagraphStyleAttributeName  : style
                                            }];
    self.attributedPlaceholder = at;
}

- (void)addTextChangedNoti:(id)tg action:(SEL)action {
    [self addTarget:tg action:action forControlEvents:UIControlEventEditingChanged];
}

@end
