//
// Created by yun on 2017/5/11.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunAppTheme+Img.h"
#import "YunConfig.h"

@implementation YunAppTheme (Img)

+ (UIViewContentMode)defImgMode {
    return YunConfig.instance.imgViewDefCtnMode;
}

+ (UIImage *)defHolderImg {
    return [UIImage imageNamed:YunConfig.instance.imgViewHolderImgName];
}

+ (UIImage *)defFailedImg {
    return [UIImage imageNamed:YunConfig.instance.imgViewFailedImgName];
}

+ (UIImage *)defAvrImg {
    return [UIImage imageNamed:YunConfig.instance.imgViewAvrImgName];
}

+ (UIImage *)defNoCtnImg {
    return [UIImage imageNamed:YunConfig.instance.imgViewNoCtnImgName];
}

+ (UIImage *)defNoNetImg {
    return [UIImage imageNamed:YunConfig.instance.imgViewNoNetName];
}

@end