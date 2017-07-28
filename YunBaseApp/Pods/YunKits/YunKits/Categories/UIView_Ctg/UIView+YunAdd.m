//
//  UIView+YunAdd.m
//
//  Created by 王健 on 16/5/4.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "UIView+YunAdd.h"
#import "YunValueVerifier.h"

@implementation UIView (YunAdd)

- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;

    frame.origin.x = x;

    self.frame = frame;
}

- (CGFloat)x {
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y {
    CGRect frame = self.frame;

    frame.origin.y = y;

    self.frame = frame;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;

    frame.size.width = width;

    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;

    frame.size.height = height;

    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setViewRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = width;

    if (color) {
        self.layer.borderColor = color.CGColor;
    }
}

- (void)setViewRadius:(CGFloat)radius {
    [self setViewRadius:radius width:0 color:nil];
}

- (void)setViewDiameter:(CGFloat)dia width:(CGFloat)width color:(UIColor *)color {
    [self setViewRadius:dia * 0.5f width:width color:color];
}

- (void)setViewDiameter:(CGFloat)dia {
    [self setViewRadius:dia * 0.5f width:0 color:nil];
}

- (UIViewController *)superViewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder *nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *) nextResponder;
        }
    }

    return nil;
}

- (void)setShadow:(CGFloat)opacity color:(UIColor *)color radius:(CGFloat)radius offset:(CGSize)offset {
    self.layer.shadowOpacity = opacity;// 阴影透明度
    self.layer.shadowColor = color.CGColor;// 阴影的颜色
    self.layer.shadowRadius = radius;// 阴影扩散的范围控制
    self.layer.shadowOffset = offset;// 阴影偏移的范围

    self.layer.masksToBounds = NO;
}

- (UIView *)subViewOfClassName:(NSString *)className {
    if ([YunValueVerifier isNilOrEmptyOrSpaceStr:className]) {return nil;}

    for (UIView *subView in self.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            return subView;
        }

        UIView *resultFound = [subView subViewOfClassName:className];
        if (resultFound) {
            return resultFound;
        }
    }

    return nil;
}

- (void)removeAllSubView {
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }

    //[[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

- (void)stopAnm {
    [self.layer removeAllAnimations];
}

@end
