//
//  Created by 王健 on 16/6/23.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <YunKits/YunView.h>

@interface YunCoverView : YunView

@property (nonatomic, copy) void (^didBtnClick)(NSInteger btnTag);

@property (nonatomic, copy) void (^didSelfClick)(void);

@property (nonatomic, strong) UIImageView *imgView;

+ (instancetype)itemWithMsg:(NSString *)msg
                        img:(NSString *)img
                   btnTitle:(NSString *)btnTitle
                     btnTag:(NSInteger)btnTag;

+ (instancetype)itemWithMsg:(NSString *)msg img:(NSString *)img;

- (void)setMsg:(NSString *)msg img:(NSString *)img btnTitle:(NSString *)btnTitle btnTag:(NSInteger)btnTag;

- (void)updateMsg:(NSString *)msg;

- (void)setImageWithName:(NSString *)img;

- (void)setBgColor:(UIColor *)color;

- (void)setSelfBlock:(void (^)(void))block;

@end
