//
// Created by yun on 2017/5/15.
// Copyright (c) 2017 skkj. All rights reserved.
//

#import "YunUITableViewFactory.h"

@implementation YunUITableViewFactory {

}

+ (UITableView *)tvWithTg:(id)target
                  classes:(NSArray *)classes
                      ids:(NSArray *)ids {
    if (classes.count != ids.count) {return nil;}

    UITableView *tvc = [[UITableView alloc] init];
    tvc.delegate = target;
    tvc.dataSource = target;
    tvc.backgroundColor = [UIColor clearColor];
    tvc.separatorStyle = UITableViewCellSeparatorStyleNone;
    // tvc.estimatedRowHeight = 40; // 防止数据过多加载缓慢 造成乱跳

    for (int i = 0; i < classes.count; ++i) {
        [tvc registerClass:classes[i] forCellReuseIdentifier:ids[i]];
    }

    return tvc;
}

+ (UITableView *)tvWithTg:(id)target
                classItem:(Class)cellClass
                      ids:(NSArray *)ids {
    UITableView *tvc = [[UITableView alloc] init];
    tvc.delegate = target;
    tvc.dataSource = target;
    tvc.backgroundColor = [UIColor clearColor];
    tvc.separatorStyle = UITableViewCellSeparatorStyleNone;
    // tvc.estimatedRowHeight = 40; // 防止数据过多加载缓慢 造成乱跳

    for (int i = 0; i < ids.count; ++i) {
        [tvc registerClass:cellClass forCellReuseIdentifier:ids[i]];
    }

    return tvc;
}

@end