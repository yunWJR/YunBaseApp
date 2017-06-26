//
// Created by 王健 on 16/9/19.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Masonry/Masonry.h>
#import "YunUIButtonFactory.h"
#import "YunAttributedStringFactory.h"
#import "YunUIImageViewFactory.h"
#import "YunConfig.h"

@implementation YunUIButtonFactory

#pragma mark button

+ (UIButton *_Nonnull)btnWithTarget:(id _Nullable)target
                             action:(SEL _Nullable)action {
    UIButton *btn = [UIButton new];

    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }

    return btn;
}

+ (UIButton *_Nonnull)btnWithBgImg:(NSString *)bgImg
                            target:(id _Nullable)target
                            action:(SEL _Nullable)action {
    UIButton *btn = [self btnWithTarget:target action:action];

    [btn setBackgroundImage:[UIImage imageNamed:bgImg] forState:UIControlStateNormal];

    return btn;
}

+ (UIButton *_Nonnull)btnWithImg:(NSString *)bgImg
                           scale:(CGFloat)scale
                          target:(id _Nullable)target
                          action:(SEL _Nullable)action {
    UIButton *btn = [self btnWithTarget:target action:action];

    UIImageView *imgView = [YunUIImageViewFactory imgViewWithImgName:bgImg];
    [btn addSubview:imgView];

    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(btn);
        make.centerY.equalTo(btn);
        make.size.equalTo(btn).multipliedBy(scale);
    }];

    return btn;
}

+ (UIButton *)btnWithTitle:(NSString *_Nonnull)title
                titleColor:(UIColor *_Nonnull)titleColor
                 titleFont:(UIFont *_Nonnull)titleFont
                   bgColor:(UIColor *_Nonnull)bgColor
                    radius:(CGFloat)radius
                    border:(CGFloat)border
               borderColor:(UIColor *_Nullable)borderColor
                    target:(id _Nullable)target
                    action:(SEL _Nullable)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    btn.backgroundColor = bgColor;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = titleFont;
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:radius];
    [btn.layer setBorderWidth:border];
    if (borderColor) {
        [btn.layer setBorderColor:borderColor.CGColor];
    }

    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }

    return btn;
}

+ (UIButton *)btnWithTitle:(NSString *_Nonnull)title
                 titleFont:(UIFont *_Nonnull)titleFont
                titleColor:(UIColor *_Nonnull)titleColor
                    target:(id _Nullable)target
                    action:(SEL _Nullable)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];

    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = titleFont;

    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }

    return btn;
}

+ (UIButton *)btnWithIconName:(NSString *_Nonnull)icon
                     fontSize:(CGFloat)fontSize
                        color:(UIColor *_Nonnull)color
                       target:(id _Nullable)target
                       action:(SEL _Nullable)action {
    UIButton *btn = [UIButton new];
    [btn setTitle:icon forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont fontWithName:YunConfig.instance.iconFontName size:fontSize];

    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }

    return btn;
}

+ (UIButton *)btnWithIconName:(NSString *_Nonnull)icon
                   hlIconName:(NSString *_Nonnull)hlIcon
                     fontSize:(CGFloat)fontSize
                        color:(UIColor *_Nonnull)color
                       target:(id _Nullable)target
                       action:(SEL _Nullable)action {
    UIButton *btn = [UIButton new];
    [btn setTitle:icon forState:UIControlStateNormal];
    [btn setTitle:hlIcon forState:UIControlStateHighlighted];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont fontWithName:YunConfig.instance.iconFontName size:fontSize];

    if (target && action) {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }

    return btn;
}

+ (UIButton *)btnWithIconName:(NSString *_Nonnull)icon
                     iconSize:(CGFloat)iconSize
                    iconColor:(UIColor *_Nonnull)iconColor
                        title:(NSString *_Nonnull)title
                titleFontSize:(UIFont *_Nonnull)titleFont
                   titleColor:(UIColor *_Nonnull)titleColor
                       isHori:(BOOL)isHori
                       target:(id _Nullable)target
                       action:(SEL _Nullable)action {
    UIButton *funBtn = [UIButton new];

    NSMutableAttributedString *atStr = [YunAttributedStringFactory aStrWithIcon:icon
                                                                      iconColor:iconColor
                                                                       iconSize:iconSize
                                                                          title:title
                                                                     titleColor:titleColor
                                                                      titleFont:titleFont
                                                                         isHori:isHori];

    [funBtn setAttributedTitle:atStr forState:UIControlStateNormal];

    funBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    funBtn.titleLabel.numberOfLines = isHori ? 1 : 2;
    funBtn.titleLabel.adjustsFontSizeToFitWidth = YES;

    if (target && action) {
        [funBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }

    return funBtn;
}

@end