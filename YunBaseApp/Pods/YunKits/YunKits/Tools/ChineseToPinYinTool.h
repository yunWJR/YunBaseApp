//
//  ChineseToPinYinTool.h
//  ChineseToPinYinDemo
//
//  Created by Will on 14-6-23.
//  Copyright (c) 2014年 Will. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChineseToPinYinTool : NSObject

+ (NSString *)pinYinStringFromChinese:(NSString *)chinese hasSoundMark:(BOOL)hasOrNot;

@end
