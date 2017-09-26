//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunUIBarButtonItemFactory.h"
#import "YunSizeHelper.h"
#import "YunUIImageViewFactory.h"
#import <Masonry/Masonry.h>

@implementation YunUIBarButtonItemFactory

+ (UIBarButtonItem *)barBtnWithFrame:(CGRect)btnFrame
                                 img:(NSString *_Nullable)image
                                imgH:(CGFloat)imgH
                              target:(id _Nullable)target
                              action:(SEL _Nullable)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = btnFrame;
    button.tag = 100;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    UIImageView *icon = [YunUIImageViewFactory imgViewWithImgNameIconMode:image];
    icon.tag = 101;
    [button addSubview:icon];

    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(button);
        make.centerY.equalTo(button);
        make.height.equalTo(@(imgH));
        make.width.equalTo(@(imgH));
    }];

    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    return btnItem;
}

+ (UIBarButtonItem *)barBtnWithImg:(NSString *_Nullable)image
                              imgH:(CGFloat)imgHeight
                            target:(id _Nullable)target
                            action:(SEL _Nullable)action {
    CGRect btn = CGRectMake(0, 0, YunSizeHelper.navigationBarHeight, YunSizeHelper.navigationBarHeight);

    return [self barBtnWithFrame:btn img:image imgH:imgHeight target:target action:action];
}

+ (BOOL)setBarItem:(UIBarButtonItem *_Nonnull)item img:(NSString *_Nonnull)img {
    if ([item.customView isKindOfClass:UIButton.class]) {
        UIButton *btn = item.customView;

        UIImageView *icon = [btn viewWithTag:101];
        if (icon) {
            icon.image = [UIImage imageNamed:img];

            return YES;
        }
    }

    return NO;
}

@end