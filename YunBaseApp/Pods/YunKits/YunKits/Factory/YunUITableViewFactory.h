//
// Created by yun on 2017/5/15.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUITableViewFactory : NSObject

+ (UITableView *)tvWithTg:(id)target
                  classes:(NSArray *)classes
                      ids:(NSArray *)ids;

@end