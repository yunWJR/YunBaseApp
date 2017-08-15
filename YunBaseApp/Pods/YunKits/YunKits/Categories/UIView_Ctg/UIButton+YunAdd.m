//
//  Created by 王健 on 16/9/9.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "UIButton+YunAdd.h"
#import "UIImage+YunAdd.h"
#import "UILabel+YunAdd.h"

@implementation UIButton (YunAdd)

- (CGFloat)getOneLineHeight {
    return [UILabel calOneLineHeight:self.titleLabel.font];
}

- (CGFloat)getTitleWidth {
    return [UILabel calWidthWithText:[self titleForState:UIControlStateNormal] font:self.titleLabel.font];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];
    if (self.titleLabel.attributedText) {
        label.attributedText = self.titleLabel.attributedText;
    }
    else {
        label.text = [self titleForState:UIControlStateNormal];
        label.font = self.titleLabel.font;
    }

    [label sizeToFit];

    return label.frame.size.width;
}

- (void)disableHl {
    self.adjustsImageWhenHighlighted = NO;
}

- (void)setHlColor:(UIColor *)color {
    [self setBackgroundImage:[UIImage imgWithColor:color]
                    forState:UIControlStateHighlighted];
}


@end
