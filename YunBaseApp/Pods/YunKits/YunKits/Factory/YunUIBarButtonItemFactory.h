//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUIBarButtonItemFactory : NSObject

+ (UIBarButtonItem *_Nonnull)itemWithFrame:(CGRect)frame
                                     image:(NSString *_Nullable)image
                                    target:(id _Nullable)target
                                    action:(SEL _Nullable)action;

+ (UIBarButtonItem *_Nonnull)itemWithImage:(NSString *_Nullable)image
                                    target:(id _Nullable)target
                                    action:(SEL _Nullable)action;

@end