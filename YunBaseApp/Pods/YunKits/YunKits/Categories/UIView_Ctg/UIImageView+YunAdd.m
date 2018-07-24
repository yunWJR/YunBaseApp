//
// Created by yun on 16/10/8.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <SDWebImage/SDImageCache.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImageView+YunAdd.h"
#import "YunConfig.h"
#import "YunValueVerifier.h"
#import "NSURL+YunAdd.h"

@implementation UIImageView (YunAdd)

- (void)setImgUrlStrWithoutDefImg:(NSString *)urlStr {
    UIImage *phImg = nil;
    if (self.image != nil) {
        phImg = self.image;
    }
    else {
        phImg = [UIImage imageNamed:YunConfig.instance.imgViewHolderImgName];
    }

    [self setImgUrlStr:urlStr holderImg:phImg];
}

- (void)setImgUrlStr:(NSString *)urlStr {
    UIImage *phImg = [UIImage imageNamed:YunConfig.instance.imgViewHolderImgName];

    [self setImgUrlStr:urlStr holderImg:phImg];
}

- (void)setImgUrlStr:(NSString *)urlStr holderImg:(UIImage *)phImg {
    if (self.image == nil) {
        self.image = phImg;
    }

    if ([YunValueVerifier isNilOrEmptyStr:urlStr]) {
        self.image = phImg;
        return;
    }

    [self sd_setImageWithURL:[NSURL urlWithStr:urlStr]
            placeholderImage:self.image
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (error || !image) {
                           UIImage *fImg = nil;

                           if (error.code == -999) {
                               // 资源丢失
                               fImg = [UIImage imageNamed:YunConfig.instance.imgViewLostImgName];
                           }

                           if (!fImg) {
                               fImg = [UIImage imageNamed:YunConfig.instance.imgViewFailedImgName];
                           }

                           if (fImg) {
                               self.image = fImg;
                           }
                       }
                   }];
}

- (void)setAvrImgUrlStr:(NSString *)urlStr {
    UIImage *phImg = [UIImage imageNamed:YunConfig.instance.imgViewAvrImgName];
    if (self.image == nil) {
        self.image = phImg;
    }

    if ([YunValueVerifier isNilOrEmptyStr:urlStr]) {
        self.image = phImg;
        return;
    }

    [self sd_setImageWithURL:[NSURL urlWithStr:urlStr]
            placeholderImage:self.image
                   completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                       if (!image) {
                           self.image = [UIImage imageNamed:YunConfig.instance.imgViewAvrImgName];
                       }
                   }];
}

- (BOOL)setIconName:(NSString *)iconName size:(CGFloat)size color:(UIColor *)color {
    UILabel *iconLbl = [self viewWithTag:YunConfig.instance.iconViewTagInImgView];
    if (iconLbl) {
        iconLbl.font = [UIFont fontWithName:YunConfig.instance.iconFontName size:size];
        iconLbl.text = iconName;
        iconLbl.textColor = color;

        return YES;
    }

    return NO;
}

@end