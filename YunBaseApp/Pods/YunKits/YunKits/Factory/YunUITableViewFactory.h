//
// Created by yun on 2017/5/15.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunUITableViewFactory : NSObject

+ (UITableView *)tvWithTg:(id _Nullable)target
                  classes:(NSArray *_Nullable)classes
                      ids:(NSArray *_Nullable)ids;

+ (UITableView *)tvWithTg:(id _Nullable)target
                classItem:(Class _Nullable)cellClass
                      ids:(NSArray *_Nullable)ids;

@end