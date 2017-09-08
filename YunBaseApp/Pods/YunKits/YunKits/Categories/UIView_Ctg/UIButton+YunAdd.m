//
//  Created by 王健 on 16/9/9.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "UIButton+YunAdd.h"
#import "UIImage+YunAdd.h"
#import "UILabel+YunAdd.h"
#import "YunConfig.h"

@implementation UIButton (YunAdd)

- (CGFloat)getOneLineHeight {
    return [UILabel calOneLineHeight:self.titleLabel.font];
}

- (CGFloat)getOneLineHeightOff {
    return self.getOneLineHeight + YunConfig.instance.ctnVtOff;
}

- (CGFloat)getTitleWidth {
    return [UILabel calWidthWithText:[self titleForState:UIControlStateNormal] font:self.titleLabel.font];
}

- (CGFloat)getTitleWidthOff {
    return self.getTitleWidth + YunConfig.instance.ctnHlOff;
}

- (void)disableHl {
    self.adjustsImageWhenHighlighted = NO;
}

- (void)setHlColor:(UIColor *)color {
    [self setBackgroundImage:[UIImage imgWithColor:color]
                    forState:UIControlStateHighlighted];
}

@end