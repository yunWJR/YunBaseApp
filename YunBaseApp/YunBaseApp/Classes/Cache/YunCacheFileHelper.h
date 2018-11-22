///
/// Created by yun on 2017/7/31.
/// Copyright (c) 2017 yun. All rights reserved.
///

#import <Foundation/Foundation.h>

@protocol YunCacheFileHelperDelegate <NSObject>

@optional
- (NSString *)getFileName:(NSString *)fileName index:(NSInteger)index;

@end

@interface YunCacheFileHelper : NSObject

@property (nonatomic, copy) NSString *dataKey;

@property (nonatomic, copy) NSArray<NSString *> *fileList;

@property (nonatomic, copy) NSArray<NSLock *> *lockList;

@property (nonatomic, weak) id <YunCacheFileHelperDelegate> delegate;

/// 新实例
+ (instancetype)helper;

/// 静态实例
+ (YunCacheFileHelper *)instance;

- (BOOL)saveItem:(id)item index:(NSInteger)index;

- (BOOL)saveItem:(id)item index:(NSInteger)index rst:(void (^)(BOOL suc))rst;

- (BOOL)saveItem:(id)item index:(NSInteger)index isAsyn:(BOOL)isAsyn rst:(void (^)(BOOL suc))rst;

- (BOOL)saveItemTask:(id)item fileName:(NSString *)fileName;

- (id)getItem:(NSInteger)index;

- (id)getItem:(NSInteger)index rst:(void (^)(id data))rst;

- (id)getItem:(NSInteger)index isAsyn:(BOOL)isAsyn rst:(void (^)(id data))rst;

- (id)getItemTaskByName:(NSString *)fileName;

- (BOOL)removeItemByIndex:(NSInteger)index;

- (BOOL)removeItemByName:(NSString *)fileName;

- (BOOL)isInvalidIndex:(NSInteger)index;

- (void)checkAllFiles;

@end