//
// Created by yun on 16/9/18.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UISearchBar+YunAdd.h"
#import "UIImage+YunAdd.h"

@implementation UISearchBar (YunAdd)

- (void)setIconByImgName:(NSString *)imgName {
    [self setImage:[UIImage imageNamed:imgName] forSearchBarIcon:UISearchBarIconSearch
             state:UIControlStateNormal];
}

- (void)setRadius:(CGFloat)rd bgColor:(UIColor *)bgColor {
    [self setRadius:rd bgColor:bgColor borderColor:nil borderWidth:0];
}

- (void)setRadius:(CGFloat)rd
          bgColor:(UIColor *)bgColor
      borderColor:(UIColor *)borderColor
      borderWidth:(CGFloat)borderWidth {
    UITextField *searchField = [self valueForKey:@"searchField"];

    if (searchField) {
        [searchField setBackgroundColor:bgColor];
        searchField.layer.cornerRadius = rd;
        searchField.layer.borderColor = borderColor.CGColor;
        searchField.layer.borderWidth = borderWidth;
        searchField.layer.masksToBounds = YES;
    }
}

- (void)setBg:(UIColor *)color {
    [self setBg:color height:0];
}

- (void)setBg:(UIColor *)color height:(CGFloat)height {
    [self setBg:color height:height fieldImg:nil];
}

- (void)setBg:(UIColor *)color height:(CGFloat)height fieldImg:(NSString *)img {
    // 设置背景图片
    UIImage *bgImg = height <= 0 ?
                     [UIImage imgWithColor:color] :
                     [UIImage imgWithColor:color height:height];
    [self setBackgroundImage:bgImg];   //这里图片的颜色和导航栏一样

    // 设置背景图片
    [self setBackgroundColor:color];

    // 设置文本框背景
    if (img) {
        UIImage *fBg = [UIImage imageNamed:img];
        if (fBg) {
            [self setSearchFieldBackgroundImage:fBg forState:UIControlStateNormal];
        }
    }
}

- (UIView *)schBgView {
    UIView *backgroundView = [self valueForKey:@"_background"];
    if (backgroundView) {
        return backgroundView;
    }

    for (UIView *v1 in self.subviews) {
        for (id v2 in v1.subviews) {
            if ([v2 isKindOfClass:UIView.class] && ![v2 isKindOfClass:UITextField.class]) {
                UIView *bg = v2;
                return bg;
            }
        }
    }

    return nil;
}

- (UITextField *)schTfView {
    UITextField *searchField = [self valueForKey:@"_searchField"];
    if (searchField) {
        return searchField;
    }

    for (UIView *v1 in self.subviews) {
        for (id v2 in v1.subviews) {
            if ([v2 isKindOfClass:UITextField.class]) {
                UITextField *tf = v2;
                return tf;
            }
        }
    }

    return nil;
}

@end