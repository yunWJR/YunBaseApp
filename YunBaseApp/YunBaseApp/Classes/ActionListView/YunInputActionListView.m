//
// Created by yun on 2017/7/19.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunSizeHelper.h"
#import "YunInputActionListView.h"
#import "YunActionListItemModel.h"

@interface YunInputActionListView () {
    UIView *_lastView;

    CGFloat _maxH;
    CGFloat _itemH;
}

@end

@implementation YunInputActionListView {
    UILabel *_tlLbl;

    UIScrollView *_scV;
}

#pragma mark - main

- (instancetype)init {
    self = [super init];
    if (self) {
        _maxH = YunSizeHelper.screenHeight - 250;
        _animationDur = 0.3f;
    }

    return self;
}

- (void)initSubClass {
    self.leftOff = 15;
    if (_animation) {
        self.amt = NO;
    }

    UIView *ctnView = [self createCtnView];
    ctnView.userInteractionEnabled = YES;

    self.contentView = ctnView;

    [self addSubview:ctnView];

    [ctnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.width.equalTo(self).offset(-self.leftOff * 2);
    }];

    if (_locationType == 1) {
        [ctnView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-self.leftOff + (_animation ? YunSizeHelper.screenHeight : 0));
        }];
    }
    else if (_locationType == 2) {
        [ctnView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(self.leftOff - (_animation ? YunSizeHelper.screenHeight : 0));
        }];
    }
    else {
        [ctnView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
        }];
    }
}

#pragma mark - request functions

#pragma mark - handles

- (void)didClickCloseBtn {
    [super hideView];
}

- (void)didClickItem:(UIButton *)sender {
    if (_didSelectItem) {
        _didSelectItem(_itemList[sender.tag]);
    }

    [super hideView];
}

#pragma mark - public functions

- (void)showView {
    [super showView:^(BOOL finished) {
        [self layoutIfNeeded];

        CGFloat ctnH = _lastView.y + _lastView.height;
        CGFloat scH = ctnH;
        if (scH > _maxH) {
            scH = _maxH;
        }

        [_scV mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(scH));
        }];

        [_scV setContentSize:CGSizeMake(_scV.width, ctnH)];

        [self layoutIfNeeded];

        if (_animation) {
            if (_locationType == 1) {
                [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self).offset(-self.leftOff);
                }];
            }
            else if (_locationType == 2) {
                [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.top.equalTo(self).offset(self.leftOff);
                }];
            }
            else {
                [self.contentView mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self);
                }];
            }

            [UIView animateWithDuration:_animationDur
                             animations:^{
                                 [self layoutIfNeeded];
                             }];
        }
    }];
}

#pragma mark - private functions

- (UIView *)createCtnView {
    if (_itemList == nil) {return [UIView new];}

    self.topOff = 40;
    self.sideOff = 15;

    UIView *v = [UIView new];

    v.backgroundColor = [UIColor whiteColor];
    [v setViewRadius:10 width:0 color:nil];

    _tlLbl = [YunUILabelFactory labelWithText:_viewTitle
                                         font:[YunAppTheme fontB:18]
                                        color:YunAppTheme.colorBaseDark
                                        align:NSTextAlignmentCenter lines:0 adjust:NO];
    _scV = [UIScrollView new];

    [v addSubview:_tlLbl];
    [v addSubview:_scV];

    [_tlLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(v).offset(self.topOff);
        make.centerX.equalTo(v);
        make.width.equalTo(v).offset(-self.sideOff * 2);
    }];

    [_scV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tlLbl.mas_bottom).offset(18);
        make.centerX.equalTo(v);
        make.width.equalTo(v);
        make.bottom.offset(0);
    }];

    UIView *lastV = nil;
    for (int i = 0; i < _itemList.count; ++i) {
        UIView *itemView = [self createItemView:_itemList[i] tag:i hasBtn:i != _itemList.count - 1];

        [_scV addSubview:itemView];

        if (lastV == nil) {
            [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(_scV).offset(0);
                make.centerX.equalTo(_scV);
                make.width.equalTo(_scV).offset(-self.sideOff * 2);
            }];
        }
        else {
            [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(lastV.mas_bottom).offset(0);
                make.centerX.equalTo(_scV);
                make.width.equalTo(_scV).offset(-self.sideOff * 2);
            }];
        }

        lastV = itemView;
    }

    _lastView = lastV;

    CGFloat itemH = _itemH;
    CGFloat ctnH = _itemList.count * itemH;
    CGFloat vH = ctnH;
    if (vH > _maxH) {
        vH = _maxH;
    }
    [_scV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(vH));
    }];
    [_scV setContentSize:CGSizeMake(_scV.width, ctnH)];

    //[super layoutIfNeeded];
    //[self layoutIfNeeded];

    return v;
}

- (UIView *)createItemView:(YunActionListItemModel *)itemData tag:(NSInteger)tag hasBtn:(BOOL)hasBtn {
    NSString *name = itemData.itemName;

    UIView *item = [UIView new];

    UILabel *ctn = [YunUILabelFactory labelWithText:name
                                               font:[YunAppTheme fontN:18]
                                              color:YunAppTheme.colorBaseClear
                                              align:NSTextAlignmentCenter
                                              lines:0
                                             adjust:NO];
    UIButton *btn = [YunUIButtonFactory btnWithTitle:name
                                           titleFont:[YunAppTheme fontN:18]
                                          titleColor:YunAppTheme.colorBaseDark
                                              target:self
                                              action:@selector(didClickItem:)];
    btn.tag = tag;

    CGFloat topOff = 18;

    [item addSubview:ctn];
    [item addSubview:btn];

    [ctn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(item).offset(topOff);
        make.centerX.equalTo(item);
        make.bottom.offset(-topOff);
    }];

    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(item);
        make.left.equalTo(item);
        make.height.equalTo(item);
        make.width.equalTo(item);
    }];

    if (hasBtn) {
        UIView *btnLine = [YunUIViewFactory viewWithBgColor:UIColor.lightGrayColor];
        [item addSubview:btnLine];
        [btnLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(item);
            make.centerX.equalTo(item);
            make.height.equalTo(@0.5);
            make.width.equalTo(item);
        }];
    }

    _itemH = topOff * 2 + ctn.getOneLineHeight;

    return item;
}

#pragma mark - protocol

@end