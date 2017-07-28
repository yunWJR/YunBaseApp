//
//  Created by 王健 on 16/9/18.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface YunViewController : UIViewController

// 返回视图,nil则返回上一级视图 // 默认nil
@property (nonatomic, weak) UIViewController *backVC;

// 导航栏隐藏属性 // 默认NO
@property (nonatomic, assign) BOOL hideNagBar;

// 导航栏返回按钮隐藏属性 // 默认NO
@property (nonatomic, assign) BOOL hideNagBarBackItem;

// 导航栏底部线条隐藏属性 // 默认NO
@property (nonatomic, assign) BOOL hideNagBarBtmLine;

// bottom bar隐藏属性 // 默认YES
@property (nonatomic, assign) BOOL hideBottomBar;

// 控件间距 // 默认0
@property (nonatomic, assign) CGFloat topOff;

// 控件间距 // 默认0
@property (nonatomic, assign) CGFloat sideOff;

// 第一次加载标识符 // 默认YES
@property (nonatomic, assign) BOOL firstLoad;

// 有数据需要更新 // 默认NO
@property (nonatomic, assign) BOOL needUpdateData; // 使用后设为NO

// 有数据需要更新 // 默认NO
@property (nonatomic, assign) BOOL forceNoUpdate;

@property (nonatomic, strong) UIBarButtonItem *leftNagItem;

@property (nonatomic, strong) UIBarButtonItem *rightNagItem;

#pragma mark - nag

- (void)setRightBarItemByNormalImg:(NSString *)norImg highLightImg:(NSString *)highImg;

- (void)setRightBarItemName:(NSString *)name font:(UIFont *)font color:(UIColor *)color;

- (void)setLeftBarItemByNormalImg:(NSString *)norImg highLightImg:(NSString *)highImg;

- (void)setLeftBarItemName:(NSString *)name font:(UIFont *)font color:(UIColor *)color;

- (void)didClickNagLeftItem;

- (void)didClickNagRightItem;

@end
