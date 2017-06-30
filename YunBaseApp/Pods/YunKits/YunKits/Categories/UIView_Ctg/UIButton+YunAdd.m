//
//  Created by 王健 on 16/9/9.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "UIButton+YunAdd.h"

@implementation UIButton (YunAdd)

- (CGFloat)getOneLineHeight {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 0)];
    label.text = @"A";
    label.font = self.titleLabel.font;
    label.numberOfLines = 0;
    [label sizeToFit];

    return label.frame.size.height;
}

- (CGFloat)getTitleWidth {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGFLOAT_MAX, 0)];
    label.text = [self titleForState:UIControlStateNormal];
    label.font = self.titleLabel.font;
    label.numberOfLines = 0;
    [label sizeToFit];

    return label.frame.size.width;
}

- (void)disableHl {
    self.adjustsImageWhenHighlighted = NO;
}

@end
