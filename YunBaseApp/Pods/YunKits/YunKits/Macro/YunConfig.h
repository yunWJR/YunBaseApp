//
// Created by yun on 2017/6/23.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunConfig : NSObject

+ (YunConfig *)instance;

// iconfont
@property (nonatomic, copy) NSString *iconFontName;

// img_def_holder
@property (nonatomic, copy) NSString *imgViewHolderImgName;

// img_def_failed
@property (nonatomic, copy) NSString *imgViewFailedImgName;

// img_def_avr
@property (nonatomic, copy) NSString *imgViewAvrImgName;

// UIViewContentModeScaleAspectFill
@property (nonatomic, assign) UIViewContentMode imgViewDefCtnMode;

// NO
@property (nonatomic, assign) BOOL isDebugMode;

// NO
@property (nonatomic, assign) BOOL isApnsDevMode;

@end