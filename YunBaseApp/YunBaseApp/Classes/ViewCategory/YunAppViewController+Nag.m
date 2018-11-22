//
// Created by yun on 2017/7/6.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <YunKits/YunSizeHelper.h>
#import "YunAppViewController+Nag.h"
#import "YunAppBlankViewConfig.h"

@implementation YunAppViewController (Nag)

- (UIView *)createTitleView {
    UIView *tV = [UIView new];

    CGFloat tW = YunSizeHelper.screenWidth - YunAppBlankViewConfig.instance.nagItemW * 2;
    CGFloat tH = YunSizeHelper.navigationBarHeight;

    tV.frame = CGRectMake(0, 0, tW, tH);

    float sysV = [UIDevice currentDevice].systemVersion.floatValue;
    if (sysV >= 10.0 && (sysV != 10.3f)) {
        [tV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(tW));
            make.height.equalTo(@(tH));
        }];
    }
    else { //iOS10以下
    }

    self.navigationItem.titleView = tV;

    return tV;
}

- (void)setNagItemIsLeft:(BOOL)isLeft type:(NSInteger)type {
    NSString *imgName = [self imgByNagType:type];

    [self setNagItemIsLeft:isLeft imgName:imgName];
}

- (void)setNagItemIsLeft:(BOOL)isLeft imgName:(NSString *)imgName {
    if ([YunValueVerifier isInvalidStr:imgName]) {
        return;
    }

    UIBarButtonItem *item = [YunAppViewController nagItemWithImg:imgName
                                                          target:self
                                                          isLeft:isLeft
                                                          action:isLeft ?
                                                                 @selector(didClickNagLeftItem) :
                                                                 @selector(didClickNagRightItem)];

    if (isLeft) {
        [self setLeftBarItemBtn:item];
    }
    else {
        [self setRightBarItemBtn:item];
    }
}

- (void)setNagItemIsLeft:(BOOL)isLeft cl:(UIColor *)cl ft:(UIFont *)ft {
    UIBarButtonItem *item = isLeft ? self.leftNagItem : self.rightNagItem;

    if (cl == nil) {
        cl = YunAppTheme.colorBaseDark;
    }

    if (ft == nil) {
        ft = YunAppTheme.nagFontItem;
    }

    [item setTitleTextAttributes:@{
             NSFontAttributeName            : ft,
             NSForegroundColorAttributeName : cl
     }
                        forState:UIControlStateNormal];
}

- (void)setNagBackItem {
    [self setNagItemIsLeft:YES imgName:YunAppBlankViewConfig.instance.defNagBackItemImg];
}

- (NSString *)imgByNagType:(NSInteger)type {
    return [YunAppBlankViewConfig.instance getNagItemByIndex:type];
}

+ (UIBarButtonItem *)nagItemWithImg:(NSString *_Nullable)image
                             target:(id _Nullable)target
                             isLeft:(BOOL)isLeft
                             action:(SEL _Nullable)action {
    CGFloat imgH = YunAppTheme.nagFontTitle.lineHeight - 2;

    CGRect btn = CGRectMake(0, 0, YunSizeHelper.navigationBarHeight, YunSizeHelper.navigationBarHeight);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = btn;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    UIImageView *icon = [YunUIImageViewFactory imgViewWithImgNameIconMode:image];
    [button addSubview:icon];

    if (isLeft) {
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(button);
            make.centerY.equalTo(button);
            make.height.equalTo(@(imgH));
            make.width.equalTo(@(imgH));
        }];
    }
    else {
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(button);
            make.centerY.equalTo(button);
            make.height.equalTo(@(imgH));
            make.width.equalTo(@(imgH));
        }];
    }

    //UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:v];

    UIImage *itemImg = [UIImage imageNamed:image];
    itemImg = [itemImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc]
                                                 initWithImage:itemImg
                                                         style:UIBarButtonItemStylePlain
                                                        target:target
                                                        action:action];

    return btnItem;
}

@end