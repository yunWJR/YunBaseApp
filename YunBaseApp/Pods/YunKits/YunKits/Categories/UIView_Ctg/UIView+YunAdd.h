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

- (UIView *)setViewRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color;

- (UIViewController *)superViewController;

- (void)setShadow:(CGFloat)opacity color:(UIColor *)color radius:(CGFloat)radius offset:(CGSize)offset;

- (UIView *)subViewOfClassName:(NSString *)className;

- (void)removeAllSubView;

- (void)stopAnm;

@end
