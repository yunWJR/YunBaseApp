//
// Created by yun on 2016/11/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunUIImageViewFactory.h"
#import "YunValueVerifier.h"
#import "UIView+YunAdd.h"
#import "YunConfig.h"
#import "YunUILabelFactory.h"
#import "Masonry.h"

@implementation YunUIImageViewFactory

+ (UIImageView *)imgViewWithImgName:(NSString *)imgName mode:(UIViewContentMode)mode {
    UIImageView *imgView = [UIImageView new];
    imgView.contentMode = mode;
    imgView.clipsToBounds = YES;

    imgView.backgroundColor = YunConfig.instance.imgViewBg;

    if ([YunValueVerifier isValidStr:imgName]) {
        imgView.image = [UIImage imageNamed:imgName];
    }

    return imgView;
}

+ (UIImageView *)imgView {
    UIImageView *imgView = [YunUIImageViewFactory imgViewWithImgName:nil
                                                                mode:YunConfig.instance.imgViewDefCtnMode];

    return imgView;
}

+ (UIImageView *)imgViewWithImgNameIconMode:(NSString *)imgName {
    return [self imgViewWithImgName:imgName mode:UIViewContentModeScaleAspectFit];
}

+ (UIImageView *)imgViewWithImgName:(NSString *)imgName {
    UIImageView *imgView = [self imgView];

    if ([YunValueVerifier isValidStr:imgName]) {
        imgView.image = [UIImage imageNamed:imgName];
    }

    return imgView;
}

+ (UIImageView *)imgViewWithImgName:(NSString *)imgName
                             radius:(CGFloat)radius
                              width:(CGFloat)width
                        borderColor:(UIColor *)borderColor {
    UIImageView *imgView = [self imgViewWithImgName:imgName];

    [imgView setViewRadius:radius width:width color:borderColor];

    return imgView;
}

+ (UIImageView *)imgViewWithIconName:(NSString *)iconName size:(CGFloat)size color:(UIColor *)color {
    UIImageView *imgView = [self imgView];

    UILabel *iconLbl = [YunUILabelFactory labelWithIcon:iconName
                                               fontSize:size
                                                  color:color];
    iconLbl.tag = YunConfig.instance.iconViewTagInImgView;

    [imgView addSubview:iconLbl];

    [iconLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(imgView);
        make.top.equalTo(imgView);
        make.left.equalTo(imgView);
    }];

    return imgView;
}

@end