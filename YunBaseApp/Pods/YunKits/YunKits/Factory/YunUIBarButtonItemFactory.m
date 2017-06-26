//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunUIBarButtonItemFactory.h"

@implementation YunUIBarButtonItemFactory

+ (UIBarButtonItem *)itemWithFrame:(CGRect)frame
                             image:(NSString *_Nullable)image
                            target:(id _Nullable)target
                            action:(SEL _Nullable)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:button];

    return btnItem;
}

+ (UIBarButtonItem *)itemWithImage:(NSString *_Nullable)image
                            target:(id _Nullable)target
                            action:(SEL _Nullable)action {
    return [self itemWithFrame:CGRectMake(15, 12, 26, 26) image:image target:target action:action];
}

@end