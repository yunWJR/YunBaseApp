//
// Created by yun on 2016/11/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUIImageViewFactory : NSObject

+ (UIImageView *)imgView;

+ (UIImageView *)imgViewWithImgName:(NSString *)imgName mode:(UIViewContentMode)mode;

+ (UIImageView *)imgViewWithImgNameIconMode:(NSString *)imgName;

+ (UIImageView *)imgViewWithImgName:(NSString *)imgName;

+ (UIImageView *)imgViewWithImgName:(NSString *)imgName
                             radius:(CGFloat)radius
                              width:(CGFloat)width
                        borderColor:(UIColor *)borderColor;

+ (UIImageView *)imgViewWithIconName:(NSString *)iconName
                                size:(CGFloat)size
                               color:(UIColor *)color;

@end