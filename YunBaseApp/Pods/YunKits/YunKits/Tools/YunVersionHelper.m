//
// Created by yun on 2017/11/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunVersionHelper.h"
#import "YunGlobalDefine.h"
#import "YunValueVerifier.h"
#import "YunConfig.h"
#import "YunAppItem.h"

@implementation YunVersionHelper

+ (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appVersionStr {
    return [[NSMutableString stringWithString:self.appVersion]
                             stringByReplacingOccurrencesOfString:@"."
                                                       withString:@""];
}

+ (NSArray<NSString *> *)versionArr:(NSString *)version {
    return [version componentsSeparatedByString:@"."];
}

+ (BOOL)shouldUpdate:(NSString *)serverVersion {
    NSArray<NSString *> *curA = [self versionArr:[self appVersion]];
    NSArray<NSString *> *srvA = [self versionArr:serverVersion];

    if (curA.count != srvA.count) {
        return NO;
    }

    for (int i = 0; i < curA.count; ++i) {
        if (![YunValueVerifier isPureInt:curA[i]] || ![YunValueVerifier isPureInt:srvA[i]]) {return NO;}

        NSInteger curV = [curA[i] integerValue];
        NSInteger serV = [srvA[i] integerValue];
        if (curV < serV) {
            return YES;
        }
        else if (curV == serV) {
            continue;
        }
        else {
            return NO;
        }
    }

    return NO;
}

+ (void)checkAppStUpdate:(YunVersionHelperBlock)block {
    [self checkAppStUpdateWithAppId:nil
                       withBundleId:nil
                              block:block];
}

+ (void)checkAppStUpdateWithAppId:(NSString *)appId
                     withBundleId:(NSString *)bundleId
                            block:(YunVersionHelperBlock)block {
    __block NSString *curVer = self.appVersion;

    NSURLRequest *rqt = [self getAppStRqtWithAppId:appId withBundleId:bundleId];

    NSURLSession *sess = [NSURLSession sharedSession];
    NSURLSessionDataTask *task =
            [sess dataTaskWithRequest:rqt
                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                        if (error) {
                            DP_MAIN_THREAD(^{
                                if (block) {
                                    block(curVer, @"", @"", NO);
                                }
                            })
                            return;
                        }

                        DP_MAIN_THREAD(^{
                            NSDictionary *appInfoDic =
                                    [NSJSONSerialization JSONObjectWithData:data
                                                                    options:NSJSONReadingMutableLeaves
                                                                      error:nil];

                            if ([appInfoDic[@"resultCount"] integerValue] == 0) {
                                if (block) {
                                    block(curVer, @"", @"", NO);
                                }
                                return;
                            }

                            if (YunConfig.instance.isLogMode) {
                                NSLog(@"【3】苹果服务器返回的检测结果：\n appId = %@ \n bundleId = %@ \n 开发账号名字 = %@ \n 商店版本号 = %@ \n 应用名称 = %@ \n 打开连接 = %@",
                                      appInfoDic[@"results"][0][@"artistId"],
                                      appInfoDic[@"results"][0][@"bundleId"],
                                      appInfoDic[@"results"][0][@"artistName"],
                                      appInfoDic[@"results"][0][@"version"],
                                      appInfoDic[@"results"][0][@"trackName"],
                                      appInfoDic[@"results"][0][@"trackViewUrl"]);
                            }

                            NSString *appStoreVer = appInfoDic[@"results"][0][@"version"];

                            BOOL sUpd = [self shouldUpdate:appStoreVer];
                            if (block) {
                                block(curVer, appStoreVer, YunAppItem.appStoreUrl, sUpd);
                            }

                            //curVer = [curVer stringByReplacingOccurrencesOfString:@"." withString:@""];
                            //if (curVer.length == 2) {
                            //    curVer = [curVer stringByAppendingString:@"0"];
                            //}
                            //else if (curVer.length == 1) {
                            //    curVer = [curVer stringByAppendingString:@"00"];
                            //}
                            //appStoreVer = [appStoreVer stringByReplacingOccurrencesOfString:@"." withString:@""];
                            //if (appStoreVer.length == 2) {
                            //    appStoreVer = [appStoreVer stringByAppendingString:@"0"];
                            //}
                            //else if (appStoreVer.length == 1) {
                            //    appStoreVer = [appStoreVer stringByAppendingString:@"00"];
                            //}
                            //if ([curVer floatValue] < [appStoreVer floatValue]) {
                            //    NSLog(@"【4】判断结果：当前版本号%@ < 商店版本号%@ 需要更新\n=========我是分割线========",
                            //          [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"],
                            //          appInfoDic[@"results"][0][@"version"]);
                            //    block(curVer,
                            //          appInfoDic[@"results"][0][@"version"],
                            //          [NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?ls=1&mt=8",
                            //                                     appId],
                            //          YES); // todo appId
                            //}
                            //else {
                            //    NSLog(@"【4】判断结果：当前版本号%@ > 商店版本号%@ 不需要更新\n========我是分割线========",
                            //          [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"],
                            //          appInfoDic[@"results"][0][@"version"]);
                            //    block(curVer,
                            //          appInfoDic[@"results"][0][@"version"],
                            //          [NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?ls=1&mt=8",
                            //                                     appId],
                            //          NO); // todo appId
                            //}
                        })
                    }];

    [task resume];
}

+ (NSURLRequest *)getAppStRqtWithAppId:(NSString *)appId
                          withBundleId:(NSString *)bundleId {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSURLRequest *request;
    if (appId != nil) {
        NSURL *rqtURL = [NSURL URLWithString:FORMAT(@"http://itunes.apple.com/cn/lookup?id=%@", appId)];

        request = [NSURLRequest requestWithURL:rqtURL];
    }
    else if (bundleId != nil) {
        NSURL *rqtURL =
                [NSURL URLWithString:FORMAT(@"http://itunes.apple.com/lookup?bundleId=%@&country=cn", bundleId)];

        request = [NSURLRequest requestWithURL:rqtURL];
    }
    else {
        NSString *curBdId = infoDic[@"CFBundleIdentifier"];

        NSURL *rqtURL =
                [NSURL URLWithString:FORMAT(@"http://itunes.apple.com/lookup?bundleId=%@&country=cn", curBdId)];
        request = [NSURLRequest requestWithURL:rqtURL];
    }

    return request;
}

@end