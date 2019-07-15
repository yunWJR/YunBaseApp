//
//  Created by 王健 on 16/6/23.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunBaseAppNorHeader.h"
#import "YunCoverView.h"
#import "YunSizeHelper.h"

@implementation YunCoverView {
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initSubView];
    }
    
    return self;
}

- (void)initSubView {
    self.backgroundColor = [UIColor clearColor];
    
    _bgView = [YunUIViewFactory viewWithBgColor:YunAppTheme.colorBgNor];
    
    _imgView = [YunUIImageViewFactory imgViewWithImgNameIconMode:@""];
    
    _msgLabel = [YunUILabelFactory labelWithText:@"说明信息"
                                            font:[YunAppTheme fontN:15]
                                           color:[YunAppTheme colorBaseHex:0xA4B4C1]
                                           align:NSTextAlignmentCenter
                                           lines:0 adjust:NO];
    
    _funcButton = [YunUIButtonFactory btnWithTitle:@"操作按钮"
                                         titleFont:YunAppTheme.fontB_N
                                        titleColor:YunAppTheme.colorBaseWhite
                                           bgColor:YunAppTheme.colorBaseHl
                                            radius:18
                                            border:0.f
                                       borderColor:nil
                                            target:self
                                            action:@selector(didClickBtn)];
    _funcButton.hidden = YES;
    
    UIView * lineView = [YunUIViewFactory viewWithBgColor:YunAppTheme.colorBaseHl];
    [_funcButton addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(_funcButton.titleLabel);
        make.height.mas_equalTo(1);
    }];
    
    [self addSubview:_bgView];
    [self addSubview:_imgView];
    [self addSubview:_msgLabel];
    [self addSubview:_funcButton];
    
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self);
        make.size.equalTo(self);
    }];
    
    CGFloat imgW = YunSizeHelper.screenWidth * 0.45f;
    CGFloat imgH = imgW * 272.0f / 340.0f;
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.centerY.equalTo(self).offset(-imgH * 0.6f);
        make.width.equalTo(@(imgW));
        make.height.equalTo(@(imgH));
    }];
    
    [_msgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_imgView.mas_bottom).offset(16);
        make.centerX.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.8f);
    }];
    
    CGFloat btnH = [_funcButton getOneLineHeight] + 15;
    [_funcButton setViewDiameter:btnH width:0.5 color:YunAppTheme.colorBaseHl];
    
    [_funcButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_msgLabel.mas_bottom).offset(20);
        make.centerX.equalTo(self);
        make.width.equalTo(@149);
        make.height.equalTo(@(btnH));
    }];
    
    // self
    _selButton = [YunUIButtonFactory btnWithTarget:self action:@selector(didClickSelf)];
    _selButton.hidden = YES;
    
    [self addSubview:_selButton];
    
    [_selButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self);
        make.left.equalTo(self);
        make.width.equalTo(self);
        make.bottom.equalTo(self);
    }];
}

#pragma mark - public functions

+ (instancetype)itemWithMsg:(NSString *)msg
                        img:(NSString *)img
                   btnTitle:(NSString *)btnTitle
                     btnTag:(NSInteger)btnTag {
    YunCoverView *item = [YunCoverView new];
    
    [item setMsg:msg img:img btnTitle:btnTitle btnTag:btnTag];
    
    return item;
}

+ (instancetype)itemWithMsg:(NSString *)msg img:(NSString *)img {
    YunCoverView *item = [YunCoverView new];
    
    [item setMsg:msg img:img btnTitle:nil btnTag:0];
    
    return item;
}

- (void)setMsg:(NSString *)msg
           img:(NSString *)img
      btnTitle:(NSString *)btnTitle
        btnTag:(NSInteger)btnTag {
    _msgLabel.text = msg;
    
    [self setImageWithName:img];
    
    if ([YunValueVerifier isValidStr:btnTitle]) {
        _funcButton.hidden = NO;
        
        [_funcButton setTitle:btnTitle forState:UIControlStateNormal];
        _funcButton.tag = btnTag;
        
        CGFloat btnW = [_funcButton getTitleWidth] + 100;
        if (btnW > YunSizeHelper.screenWidth * 0.8f) {
            btnW = YunSizeHelper.screenWidth * 0.8f;
        }
        
        [_funcButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(btnW));
        }];
    }
    else {
        _funcButton.hidden = YES;
    }
}

- (void)updateMsg:(NSString *)msg {
    _msgLabel.text = msg;
}

- (void)setImageWithName:(NSString *)img {
    _imgView.image = [UIImage imageNamed:img];
}

- (void)setBgColor:(UIColor *)color {
    _bgView.backgroundColor = color;
}

- (void)setSelfBlock:(void (^)(void))block {
    if (block) {
        _didSelfClick = block;
    }
    
    _selButton.hidden = _didSelfClick == nil;
}

#pragma mark - handle

- (void)didClickBtn {
    if (_didBtnClick) {
        _didBtnClick(_funcButton.tag);
    }
}

- (void)didClickSelf {
    if (_didSelfClick) {
        _didSelfClick();
    }
}

@end
