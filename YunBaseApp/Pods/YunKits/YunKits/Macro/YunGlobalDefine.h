//
// Created by 王健 on 16/8/4.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#ifndef YunMacro_YunGlobalDefine_h
#define YunMacro_YunGlobalDefine_h

// weak self
#define WEAK_SELF typeof(self) __weak weakSelf = self;

// weak obj
#define WEAK_OBJ(type)  __weak typeof(type) weak##type = type;

// strong obj
#define STRONG_OBJ(type)  __strong typeof(type) str##type = weak##type;


// 执行一次
#define DP_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

// 在主线程上运行
#define DP_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

// 开启异步线程 GLOBLE
#define DP_GLOBLE_QUEUE_DEF(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

// 延迟执行 GLOBLE
#define DP_AFTER_GLOBLE_QUEUE_DEF(interval, cmpBlock) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, interval * NSEC_PER_SEC),dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),cmpBlock);

// 延迟执行 主线程
#define DP_AFTER_MAIN_QUEUE(interval, cmpBlock) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, interval * NSEC_PER_SEC),dispatch_get_main_queue(),cmpBlock);

// 通知
#define NOTIF_ADD(n, f)   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(f) name:n object:nil]
#define NOTIF_POST(n, o)  [[NSNotificationCenter defaultCenter] postNotificationName:n object:o]
#define NOTIF_REMV()      [[NSNotificationCenter defaultCenter] removeObserver:self]

// format
#define FORMAT(f, ...)    [NSString stringWithFormat:f, ## __VA_ARGS__]

#define FORMAT_DT(f, ...) FORMAT(@"\n[文件名: %s]\n" "[函数名: %s]\n" "[行 号: %d] \n" "[内 容: %@]", __FILE__, __FUNCTION__, __LINE__, [NSString stringWithFormat:f, ## __VA_ARGS__])

#endif