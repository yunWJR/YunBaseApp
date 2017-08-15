//
// Created by 王健 on 16/10/11.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunSystemMediaHelper.h"
#import <UIKit/UIKit.h>

@implementation YunSystemMediaHelper {

}

+ (void)openSms:(NSString *)phoneNo {
    [self openScheme:[NSString stringWithFormat:@"sms://%@", phoneNo] cmp:nil];
}

+ (void)openPhone:(NSString *)phoneNo {
    [self openScheme:[NSString stringWithFormat:@"tel://%@", phoneNo] cmp:nil];
}

+ (void)openPhone:(NSString *)phoneNo cmp:(void (^ __nullable)(BOOL success))cmp {
    [self openScheme:[NSString stringWithFormat:@"tel://%@", phoneNo] cmp:cmp];
}

+ (void)openURL:(NSString *)url {
    [self openScheme:url cmp:nil];
}

+ (void)openURL:(NSString *)url cmp:(void (^ __nullable)(BOOL success))cmp {
    [self openScheme:url cmp:cmp];
}

+ (void)openScheme:(NSString *)scheme cmp:(void (^ __nullable)(BOOL success))cmp {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:scheme];

    if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
        [application openURL:URL options:@{}
           completionHandler:cmp];
    }
    else {
        BOOL success = [application openURL:URL];

        if (cmp) {
            cmp(success);
        }
    }
}

@end