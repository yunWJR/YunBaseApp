//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YunSizeHelper : NSObject

+ (CGFloat)statusBarHeight;

+ (CGFloat)navigationBarHeight;

+ (CGFloat)statusAndNagBarHeight;

+ (CGFloat)tabBarHeight;

+ (CGFloat)screenWidth;

+ (CGFloat)screenHeight;

+ (CGFloat)widthOn2x:(CGFloat)width;

+ (CGFloat)heightOn2x:(CGFloat)height;

+ (CGFloat)btmSafeOff;

+ (BOOL)isIPhoneX;

@end