//
// Created by yun on 2017/4/25.
// Copyright (c) 2017 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YunAppItem.h"
#import "YunSystemMediaHelper.h"
#import "SDImageCache.h"
#import "sys/utsname.h"
#import "YunConfig.h"
#import "YunValueVerifier.h"
#import "YunGlobalDefine.h"

@implementation YunAppItem {
}

+ (UIWindow *)appWindow {
    return [[UIApplication sharedApplication].delegate window];
}

+ (UIWindow *)getCurWindow {
    UIWindow *win = nil;

    //[UIApplication sharedApplication].keyWindow;
    for (id item in [UIApplication sharedApplication].windows) {
        if ([item class] == [UIWindow class]) {
            if (!((UIWindow *) item).hidden) {
                win = item;
                break;
            }
        }
    }
    return win;
}

+ (void)stopIdle {
    [UIApplication sharedApplication].idleTimerDisabled = YES;
}

+ (void)gotoSettingView {
    if (UIApplicationOpenSettingsURLString != NULL) {
        [YunSystemMediaHelper openURL:UIApplicationOpenSettingsURLString];
    }
}

+ (void)hideKb {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

+ (CGFloat)getCacheSize {
    NSUInteger imageCacheSize = [[SDImageCache sharedImageCache] getSize];
    //获取自定义缓存大小
    //用枚举器遍历 一个文件夹的内容
    //1.获取 文件夹枚举器
    NSString *myCachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    NSDirectoryEnumerator *enumerator = [[NSFileManager defaultManager] enumeratorAtPath:myCachePath];
    __block NSUInteger count = 0;
    //2.遍历
    for (NSString *fileName in enumerator) {
        NSString *path = [myCachePath stringByAppendingPathComponent:fileName];
        NSDictionary *fileDict = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        count += fileDict.fileSize;//自定义所有缓存大小
    }
    // 得到是字节  转化为M
    CGFloat totalSize = ((CGFloat) imageCacheSize + count) / 1024 / 1024;
    return totalSize;
}

- (void)clearCache {
    //删除两部分
    //1.删除 sd 图片缓存
    //先清除内存中的图片缓存
    [[SDImageCache sharedImageCache] clearMemory];
    //清除磁盘的缓存
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:nil];
    //2.删除自己缓存
    NSString *myCachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    [[NSFileManager defaultManager] removeItemAtPath:myCachePath error:nil];
}

+ (NSString *)getDeviceInfo {
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"iPhone1,1"]) {return @"iPhone 2G";}
    if ([platform isEqualToString:@"iPhone1,2"]) {return @"iPhone 3G";}
    if ([platform isEqualToString:@"iPhone2,1"]) {return @"iPhone 3GS";}
    if ([platform isEqualToString:@"iPhone3,1"]) {return @"iPhone 4";}
    if ([platform isEqualToString:@"iPhone3,2"]) {return @"iPhone 4";}
    if ([platform isEqualToString:@"iPhone3,3"]) {return @"iPhone 4";}
    if ([platform isEqualToString:@"iPhone4,1"]) {return @"iPhone 4S";}
    if ([platform isEqualToString:@"iPhone5,1"]) {return @"iPhone 5";}
    if ([platform isEqualToString:@"iPhone5,2"]) {return @"iPhone 5";}
    if ([platform isEqualToString:@"iPhone5,3"]) {return @"iPhone 5c";}
    if ([platform isEqualToString:@"iPhone5,4"]) {return @"iPhone 5c";}
    if ([platform isEqualToString:@"iPhone6,1"]) {return @"iPhone 5s";}
    if ([platform isEqualToString:@"iPhone6,2"]) {return @"iPhone 5s";}
    if ([platform isEqualToString:@"iPhone7,1"]) {return @"iPhone 6 Plus";}
    if ([platform isEqualToString:@"iPhone7,2"]) {return @"iPhone 6";}
    if ([platform isEqualToString:@"iPhone8,1"]) {return @"iPhone 6s";}
    if ([platform isEqualToString:@"iPhone8,2"]) {return @"iPhone 6s Plus";}
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([platform isEqualToString:@"iPhone9,1"]) {return @"国行、日版、港行iPhone 7";}
    if ([platform isEqualToString:@"iPhone9,2"]) {return @"港行、国行iPhone 7 Plus";}
    if ([platform isEqualToString:@"iPhone9,3"]) {return @"美版、台版iPhone 7";}
    if ([platform isEqualToString:@"iPhone9,4"]) {return @"美版、台版iPhone 7 Plus";}
    if ([platform isEqualToString:@"iPhone8,4"]) {return @"iPhone SE";}
    if ([platform isEqualToString:@"iPod1,1"]) {return @"iPod Touch 1G";}
    if ([platform isEqualToString:@"iPod2,1"]) {return @"iPod Touch 2G";}
    if ([platform isEqualToString:@"iPod3,1"]) {return @"iPod Touch 3G";}
    if ([platform isEqualToString:@"iPod4,1"]) {return @"iPod Touch 4G";}
    if ([platform isEqualToString:@"iPod5,1"]) {return @"iPod Touch 5G";}
    if ([platform isEqualToString:@"iPad1,1"]) {return @"iPad 1G";}
    if ([platform isEqualToString:@"iPad2,1"]) {return @"iPad 2";}
    if ([platform isEqualToString:@"iPad2,2"]) {return @"iPad 2";}
    if ([platform isEqualToString:@"iPad2,3"]) {return @"iPad 2";}
    if ([platform isEqualToString:@"iPad2,4"]) {return @"iPad 2";}
    if ([platform isEqualToString:@"iPad2,5"]) {return @"iPad Mini 1G";}
    if ([platform isEqualToString:@"iPad2,6"]) {return @"iPad Mini 1G";}
    if ([platform isEqualToString:@"iPad2,7"]) {return @"iPad Mini 1G";}
    if ([platform isEqualToString:@"iPad3,1"]) {return @"iPad 3";}
    if ([platform isEqualToString:@"iPad3,2"]) {return @"iPad 3";}
    if ([platform isEqualToString:@"iPad3,3"]) {return @"iPad 3";}
    if ([platform isEqualToString:@"iPad3,4"]) {return @"iPad 4";}
    if ([platform isEqualToString:@"iPad3,5"]) {return @"iPad 4";}
    if ([platform isEqualToString:@"iPad3,6"]) {return @"iPad 4";}
    if ([platform isEqualToString:@"iPad4,1"]) {return @"iPad Air";}
    if ([platform isEqualToString:@"iPad4,2"]) {return @"iPad Air";}
    if ([platform isEqualToString:@"iPad4,3"]) {return @"iPad Air";}
    if ([platform isEqualToString:@"iPad4,4"]) {return @"iPad Mini 2G";}
    if ([platform isEqualToString:@"iPad4,5"]) {return @"iPad Mini 2G";}
    if ([platform isEqualToString:@"iPad4,6"]) {return @"iPad Mini 2G";}
    if ([platform isEqualToString:@"i386"]) {return @"iPhone Simulator";}
    if ([platform isEqualToString:@"x86_64"]) {return @"iPhone Simulator";}

    return platform;
}

+ (UIViewController *)getVisibleVcFrom:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self getVisibleVcFrom:[((UINavigationController *) vc) visibleViewController]];
    }
    else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self getVisibleVcFrom:[((UITabBarController *) vc) selectedViewController]];
    }
    else {
        if (vc.presentedViewController) {
            return [self getVisibleVcFrom:vc.presentedViewController];
        }
        else {
            return vc;
        }
    }
}

+ (BOOL)gotoAppStoreComment {
    if ([YunValueVerifier isInvalidStr:YunConfig.instance.appId]) {
        return NO;
    }

    NSString *urlStr =
            FORMAT(@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@&pageNumber=0&sortOrdering=2&mt=8",
                   YunConfig.instance.appId);

    [YunSystemMediaHelper openURL:urlStr];

    return YES;
}

+ (BOOL)gotoAppStore {
    if ([YunValueVerifier isInvalidStr:YunConfig.instance.appId]) {
        return NO;
    }

    NSString *urlStr = FORMAT(@"itms-apps://itunes.apple.com/app/id%@", YunConfig.instance.appId);

    [YunSystemMediaHelper openURL:urlStr];

    return YES;
}

@end