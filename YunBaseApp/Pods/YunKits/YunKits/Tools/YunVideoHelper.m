//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunVideoHelper.h"

@implementation YunVideoHelper

// 获取一个视频的第一帧图片
//+ (UIImage *)getVideoImg:(NSString *)filepath {
//    NSURL *url = [NSURL URLWithString:filepath];
//    AVURLAsset *asset1 = [[AVURLAsset alloc] initWithURL:url options:nil];
//    AVAssetImageGenerator *generate1 = [[AVAssetImageGenerator alloc] initWithAsset:asset1];
//    generate1.appliesPreferredTrackTransform = YES;
//    NSError *err = NULL;
//    CMTime time = CMTimeMake(1, 2);
//    CGImageRef oneRef = [generate1 copyCGImageAtTime:time actualTime:NULL error:&err];
//    UIImage *one = [[UIImage alloc] initWithCGImage:oneRef];
//
//    return one;
//}

// 获取视频的时长
//+ (NSInteger)getVideoTimeByUrlString:(NSString *)urlString {
//    NSURL *videoUrl = [NSURL URLWithString:urlString];
//    AVURLAsset *avUrl = [AVURLAsset assetWithURL:videoUrl];
//    CMTime time = [avUrl duration];
//    int seconds = ceil(time.value/time.timescale);
//    return seconds;
//}

@end