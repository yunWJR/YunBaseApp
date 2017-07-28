//
// Created by 王健 on 2016/11/14.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunUIImageViewFactory.h"
#import "YunValueVerifier.h"
#import "UIView+YunAdd.h"
#import "YunConfig.h"
#import "YunUILabelFactory.h"
#import "Masonry.h"

@implementation YunUIImageViewFactory

+ (UIImageView *)imgView {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = YunConfig.instance.imgViewDefCtnMode; // 默认的显示模式
    imgView.clipsToBounds = YES;

    imgView.backgroundColor = [UIColor clearColor];

    return imgView;
}

+ (UIImageView *)imgViewWithImgName:(NSString *)imgName mode:(UIViewContentMode)mode {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode = mode;
    imgView.clipsToBounds = YES;

    imgView.backgroundColor = [UIColor clearColor];

    if ([YunValueVerifier isValidStr:imgName]) {
        imgView.image = [UIImage imageNamed:imgName];
    }

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