//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunTheme.h"
#import "YunAppTheme.h"

@interface YunAppTheme () {
    YunTheme *_yunTm;
}

@end

@implementation YunAppTheme

+ (YunAppTheme *)instance {
    static YunAppTheme *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _yunTm = [YunTheme instance];

        [self initData];
    }

    return self;
}

- (void)initData {
    // 默认系统字体
    self.fontLName = [UIFont systemFontOfSize:14].fontName;
    self.fontNName = self.fontLName;
    self.fontBName = self.fontLName;
    self.fontNumName = self.fontLName;

    self.sizeSM = 10;
    self.sizeS = 12;
    self.sizeN = 14;
    self.sizeL = 16;
    self.sizeLM = 18;

    self.scaleIsOn = YES;

    self.lineH = 0.5f;
    self.lineHB = 1.0f;

    self.sizeNagTitle = 17.0f;
    self.sizeNagItem = 14.0f;
}

- (CGFloat)sSize:(CGFloat)size {
    if (_scaleIsOn) {
        return size * _yunTm.screenScale;
    }
    else {
        return size;
    }
}

- (YunTheme *)curYunTheme {
    return _yunTm;
}

@end