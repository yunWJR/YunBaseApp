//
// Created by yun on 2017/6/23.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunConfig : NSObject

+ (YunConfig *)instance;

// icon font
@property (nonatomic, copy) NSString *iconFontName;

// img_def_holder
@property (nonatomic, copy) NSString *imgViewHolderImgName;

// img_def_failed
@property (nonatomic, copy) NSString *imgViewFailedImgName;

// img_def_avr
@property (nonatomic, copy) NSString *imgViewAvrImgName;

// img_def_no_ctn
@property (nonatomic, copy) NSString *imgViewNoCtnImgName;

// img_def_no_net
@property (nonatomic, copy) NSString *imgViewNoNetName;

// UIViewContentModeScaleAspectFill
@property (nonatomic, assign) UIViewContentMode imgViewDefCtnMode;

//
@property (nonatomic, assign) NSInteger iconViewTagInImgView;

// btn def hl color  nil=none
@property (nonatomic, strong) UIColor *btnDefHlColor;

// NO
@property (nonatomic, assign) BOOL btnHasHlColor;

// NO
@property (nonatomic, assign) BOOL isDebugMode;

// NO
@property (nonatomic, assign) BOOL isApnsDevMode;

// yyyy-MM
@property (nonatomic, copy) NSString *dateFmYm;

// yyyy-MM-dd
@property (nonatomic, copy) NSString *dateFmYmd;

// yyyy-MM-dd hh:mm
@property (nonatomic, copy) NSString *dateFmYmdHm;

// hh:mm
@property (nonatomic, copy) NSString *dateFmHm;

@end