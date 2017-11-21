//
// Created by yun on 2017/11/14.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunVersionCheck.h"
#import "YunGlobalDefine.h"

@implementation YunVersionCheck

+ (void)checkAppStUpdateWithAppId:(NSString *)appId withBundleId:(NSString *)bundleId block:(UpdateBlock)block {
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    __block NSString *currentVersion = infoDic[@"CFBundleShortVersionString"];
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

    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *task =
            [session dataTaskWithRequest:request
                       completionHandler:^(NSData *_Nullable data,
                                           NSURLResponse *_Nullable response,
                                           NSError *_Nullable error) {
                           if (error) {
                               DP_MAIN_THREAD(^{
                                   block(currentVersion, @"", @"", NO);
                               })
                               return;
                           }

                           DP_MAIN_THREAD(^{
                               NSDictionary *appInfoDic =
                                       [NSJSONSerialization JSONObjectWithData:data
                                                                       options:NSJSONReadingMutableLeaves
                                                                         error:nil];

                               if ([appInfoDic[@"resultCount"] integerValue] == 0) {
                                   block(currentVersion, @"", @"", NO);
                                   return;
                               }

                               NSLog(@"【3】苹果服务器返回的检测结果：\n appId = %@ \n bundleId = %@ \n 开发账号名字 = %@ \n 商店版本号 = %@ \n 应用名称 = %@ \n 打开连接 = %@",
                                     appInfoDic[@"results"][0][@"artistId"],
                                     appInfoDic[@"results"][0][@"bundleId"],
                                     appInfoDic[@"results"][0][@"artistName"],
                                     appInfoDic[@"results"][0][@"version"],
                                     appInfoDic[@"results"][0][@"trackName"],
                                     appInfoDic[@"results"][0][@"trackViewUrl"]);

                               NSString *appStoreVersion = appInfoDic[@"results"][0][@"version"];
                               currentVersion =
                                       [currentVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
                               if (currentVersion.length == 2) {
                                   currentVersion = [currentVersion stringByAppendingString:@"0"];
                               }
                               else if (currentVersion.length == 1) {
                                   currentVersion = [currentVersion stringByAppendingString:@"00"];
                               }
                               appStoreVersion =
                                       [appStoreVersion stringByReplacingOccurrencesOfString:@"." withString:@""];
                               if (appStoreVersion.length == 2) {
                                   appStoreVersion = [appStoreVersion stringByAppendingString:@"0"];
                               }
                               else if (appStoreVersion.length == 1) {
                                   appStoreVersion = [appStoreVersion stringByAppendingString:@"00"];
                               }
                               if ([currentVersion floatValue] < [appStoreVersion floatValue]) {
                                   NSLog(@"【4】判断结果：当前版本号%@ < 商店版本号%@ 需要更新\n=========我是分割线========",
                                         [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"],
                                         appInfoDic[@"results"][0][@"version"]);
                                   block(currentVersion,
                                         appInfoDic[@"results"][0][@"version"],
                                         [NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?ls=1&mt=8",
                                                                    appId],
                                         YES);
                               }
                               else {
                                   NSLog(@"【4】判断结果：当前版本号%@ > 商店版本号%@ 不需要更新\n========我是分割线========",
                                         [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"],
                                         appInfoDic[@"results"][0][@"version"]);
                                   block(currentVersion,
                                         appInfoDic[@"results"][0][@"version"],
                                         [NSString stringWithFormat:@"https://itunes.apple.com/us/app/id%@?ls=1&mt=8",
                                                                    appId],
                                         NO);
                               }
                           })
                       }];
    [task resume];
}

@end
