//
// Created by 王健 on 2016/11/9.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UILabel (Style)

- (void)setText:(NSString *)text font:(UIFont *)font color:(UIColor *)color;

- (void)setAlign:(NSTextAlignment)align lines:(NSInteger)lines adjust:(BOOL)adjust;

- (void)setRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color;

@end