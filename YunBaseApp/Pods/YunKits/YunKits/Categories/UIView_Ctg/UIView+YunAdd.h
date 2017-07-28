//
//  UIView+YunAdd.h
//
//  Created by 王健 on 16/5/4.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YunAdd)

@property (nonatomic, assign) CGFloat x;

@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat width;

@property (nonatomic, assign) CGFloat height;

- (void)setViewRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color;

- (void)setViewRadius:(CGFloat)radius;

- (void)setViewDiameter:(CGFloat)dia width:(CGFloat)width color:(UIColor *)color;

- (void)setViewDiameter:(CGFloat)dia;

- (void)setShadow:(CGFloat)opacity color:(UIColor *)color radius:(CGFloat)radius offset:(CGSize)offset;

- (void)removeAllSubView;

- (void)stopAnm;

- (UIView *)subViewOfClassName:(NSString *)className;

- (UIViewController *)superViewController;

@end
