//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUISearchBarFactory : NSObject

+ (UISearchBar *_Nonnull)barWithTarget:(id _Nullable)target;

+ (UISearchBar *_Nonnull)barWithPhText:(NSString *_Nullable)phText
                                target:(id _Nullable)target;

+ (UISearchBar *_Nonnull)barWithFrame:(CGRect)frame
                               target:(id _Nullable)target;

+ (UISearchBar *_Nonnull)barWithFrame:(CGRect)frame
                            bgImgName:(NSString *_Nullable)bgImgName
                               phText:(NSString *_Nullable)phText
                               target:(id _Nullable)target;

+ (UIView *_Nonnull)viewWithFrame:(CGRect)frame
                           phText:(NSString *_Nullable)phText
                           target:(id _Nullable)target;

@end