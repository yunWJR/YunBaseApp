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
    UITableView *tvc = [[UITableView alloc] init];
    tvc.delegate = target;
    tvc.dataSource = target;
    tvc.backgroundColor = [UIColor clearColor];
    tvc.separatorStyle = UITableViewCellSeparatorStyleNone;

    for (int i = 0; i < classes.count; ++i) {
        [tvc registerClass:classes[i] forCellReuseIdentifier:ids[i]];
    }

    return tvc;
}

@end