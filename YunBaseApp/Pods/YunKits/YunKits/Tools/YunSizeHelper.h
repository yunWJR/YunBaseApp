//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YunSizeHelper : NSObject

+ (CGFloat)navigationBarHeight;

+ (CGFloat)tabBarHeight;

+ (CGFloat)statusBarHeight;

+ (CGFloat)screenWidth;

+ (CGFloat)screenHeight;

+ (CGFloat)widthOn2x:(CGFloat)width;

+ (CGFloat)heightOn2x:(CGFloat)height;

@end