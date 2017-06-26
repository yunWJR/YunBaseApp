//
//  YunDevice.h
//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunDevice : NSObject

+ (BOOL)isPhone4;

+ (BOOL)isPhone5;

// 包括6,6s,7
// 4.7英寸 750*1335
+ (BOOL)isPhone6;

// 包括6p,6sp,7p
// 5.5英寸 1080*1920
+ (BOOL)isPhone6Plus;

@end
