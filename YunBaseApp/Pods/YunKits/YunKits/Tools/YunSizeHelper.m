//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunSizeHelper.h"

@implementation YunSizeHelper

// 该高度有可能有误差
+ (CGFloat)navigationBarHeight {
    return 44;
}

+ (CGFloat)tabBarHeight {
    return 49;
}

+ (CGFloat)statusBarHeight { //
    return [UIApplication sharedApplication].statusBarFrame.size.height;
}

+ (CGFloat)screenWith {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

@end
