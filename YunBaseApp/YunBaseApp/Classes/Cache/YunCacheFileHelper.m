//
// Created by yun on 2017/7/31.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <YunKits/YunGlobalDefine.h>
#import "YunCacheFileHelper.h"
#import "NSObject+YunAdd.h"

@interface YunCacheFileHelper () {
    NSLock *_lc;
}

@end

@implementation YunCacheFileHelper

+ (YunCacheFileHelper *)instance {
    static YunCacheFileHelper *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }

    return _instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _dataKey = @"DataKey";
        _lc = [NSLock new];
    }

    return self;
}

// save
- (BOOL)saveItem:(id)item index:(NSInteger)index {
    return [self saveItem:item
                    index:index
                   isAsyn:NO
                      rst:nil];
}

- (BOOL)saveItem:(id)item index:(NSInteger)index rst:(void (^)(BOOL suc))rst {
    return [self saveItem:item
                    index:index
                   isAsyn:YES
                      rst:rst];
}

- (BOOL)saveItem:(id)item index:(NSInteger)index isAsyn:(BOOL)isAsyn rst:(void (^)(BOOL suc))rst {
    [_lc lock];

    if ([self isInvalidIndex:index]) {
        if (rst) {
            rst(NO);
        }

        [_lc unlock];
        return NO;
    }

    if (isAsyn) {
        [self saveItemAsyn:[item yunDeepCopy] index:index rst:^(BOOL suc) {
            if (rst) {
                rst(suc);
            }

        }];

        [_lc unlock];
        return YES;
    }
    else {
        BOOL rstSuc = [self saveItemTask:item index:index];
        if (rst) {
            rst(rstSuc);
        }

        [_lc unlock];

        return rstSuc;
    }
}

- (void)saveItemAsyn:(id)item index:(NSInteger)index rst:(void (^)(BOOL suc))rst {
    DP_GLOBLE_QUEUE_LOW(^{
        BOOL sucRst = [self saveItemTask:item index:index];
        DP_MAIN_THREAD(^{
            if (rst) {rst(sucRst);}
        })
    })
}

- (BOOL)saveItemTask:(id)item index:(NSInteger)index {
    [[self getItemLock:index] lock];

    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:item forKey:_dataKey];
    [archiver finishEncoding];

    NSError *error;
    [data writeToFile:[self getFilePath:index]
              options:NSAtomicWrite
                error:&error];

    [[self getItemLock:index] unlock];

    if (error) {
        [self removeItemByIndex:index];
    }

    return error == nil;
}

// get
- (id)getItem:(NSInteger)index {
    return [self getItem:index isAsyn:NO rst:nil];
}

- (id)getItem:(NSInteger)index rst:(void (^)(id data))rst {
    return [self getItem:index isAsyn:YES rst:rst];
}

- (id)getItem:(NSInteger)index isAsyn:(BOOL)isAsyn rst:(void (^)(id data))rst {
    [_lc lock];

    if ([self isInvalidIndex:index]) {
        if (rst)rst(nil);

        [_lc unlock];
        return nil;
    }

    if (isAsyn) {
        [self getItemAsyn:index rst:^(id data) {
            if (rst) {
                rst(data);
            }
        }];

        [_lc unlock];
        return nil;
    }
    else {
        id rstData = [self getItemTask:index];
        if (rst) {
            rst(rstData);
        }

        [_lc unlock];
        return rstData;
    }
}

- (void)getItemAsyn:(NSInteger)index rst:(void (^)(id data))rst {
    DP_GLOBLE_QUEUE_LOW(^{
        id rstData = [self getItemTask:index];
        DP_MAIN_THREAD(^{
            if (rst) {rst(rstData);}
        })
    })
}

- (id)getItemTask:(NSInteger)index {
    [[self getItemLock:index] lock];

    NSFileManager *fileManager = [NSFileManager defaultManager];
    id item = nil;

    NSError *error;
    if ([fileManager fileExistsAtPath:[self getFilePath:index]]) {
        //如果归档文件存在，则读取其中内容
        NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self getFilePath:index]
                                                             options:NSDataReadingMappedIfSafe
                                                               error:&error];

        if (data) {
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];

            @try {
                item = [unarchiver decodeObjectForKey:_dataKey];
            }
            @catch (NSException *exception) {
                error = [NSError new];
            }
            @finally {
                [unarchiver finishDecoding];
            }
        }
    }
    else {
    }

    [[self getItemLock:index] unlock];

    if (error) {
        [self removeItemByIndex:index];
    }

    return item;
}

- (BOOL)removeItemByIndex:(NSInteger)index {
    [[self getItemLock:index] lock];

    NSString *FileFullPath = [self getFilePath:index];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    BOOL bRet = [fileMgr fileExistsAtPath:FileFullPath];
    if (bRet) {
        NSError *err;
        [fileMgr removeItemAtPath:FileFullPath error:&err];
    }

    [[self getItemLock:index] unlock];

    return YES;
}

// file

- (NSString *)getFilePath:(NSInteger)index {
    NSString *fileName = [self getFileName:index];
    if (!fileName) {return nil;}

    NSString *path = [[self docDic] stringByAppendingPathComponent:fileName];

    return path;
}

- (NSString *)getFileName:(NSInteger)index {
    if (index < 0 || index > _fileList.count - 1) {return nil;}

    NSString *fileN = _fileList[index];
    if (_delegate && [_delegate respondsToSelector:@selector(getFileName:index:)]) {
        return [_delegate getFileName:fileN index:index];
    }
    else {
        return fileN;
    }
}

- (NSString *)docDic {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths lastObject];

    return documentsDirectory;
}

- (NSLock *)getItemLock:(NSInteger)index {
    if (index < 0 || index > _fileList.count - 1) {return nil;}

    return _lockList[index];
}

- (BOOL)isInvalidIndex:(NSInteger)index {
    return !(index >= 0 && index < _fileList.count);
}

- (void)checkAllFiles {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray<NSString *> *fileArr = [fileManager contentsOfDirectoryAtPath:[self docDic] error:nil];
    for (int i = 0; i < fileArr.count; ++i) {
        NSLog(@"%@", fileArr[i]);
    }
}

@end