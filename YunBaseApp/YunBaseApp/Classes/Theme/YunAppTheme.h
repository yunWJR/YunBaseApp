//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YunTheme;

@interface YunAppTheme : NSObject

@property (nonatomic, strong) NSString *fontLName;

@property (nonatomic, strong) NSString *fontNName;

@property (nonatomic, strong) NSString *fontBName;

@property (nonatomic, strong) NSString *fontNumName;

@property (nonatomic, assign) CGFloat sizeSM;

@property (nonatomic, assign) CGFloat sizeS;

@property (nonatomic, assign) CGFloat sizeN;

@property (nonatomic, assign) CGFloat sizeL;

@property (nonatomic, assign) CGFloat sizeLM;

// nag
@property (nonatomic, strong) NSString *fontNagTitle;

@property (nonatomic, strong) NSString *fontNagItem;

@property (nonatomic, assign) CGFloat sizeNagTitle;

@property (nonatomic, assign) CGFloat sizeNagItem;

@property (nonatomic, assign) BOOL scaleIsOn;

@property (nonatomic, assign) CGFloat lineHL;

@property (nonatomic, assign) CGFloat lineH;

@property (nonatomic, assign) CGFloat lineHB;

+ (YunAppTheme *)instance;

- (CGFloat)sSize:(CGFloat)size;

- (YunTheme *)curYunTheme;

@end