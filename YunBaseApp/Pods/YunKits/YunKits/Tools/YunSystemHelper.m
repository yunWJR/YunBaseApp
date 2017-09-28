//
// Created by yun on 2017/9/27.
// Copyright (c) 2017 yun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YunSystemHelper.h"

@interface YunSystemHelper () {
}

@end

@implementation YunSystemHelper

+ (void)printAllFont {
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily = 0; indFamily < [familyNames count]; ++indFamily) {
        NSLog(@"Family name: %@", familyNames[indFamily]);
        fontNames = [[NSArray alloc] initWithArray:
                [UIFont fontNamesForFamilyName:familyNames[indFamily]]];
        for (indFont = 0; indFont < [fontNames count]; ++indFont) {
            NSLog(@"    Font name: %@", fontNames[indFont]);
        }
    }
}

+ (BOOL)hasFont:(NSString *)name {
    NSArray *familyNames = [[NSArray alloc] initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for (indFamily = 0; indFamily < [familyNames count]; ++indFamily) {
        fontNames = [[NSArray alloc] initWithArray:
                [UIFont fontNamesForFamilyName:familyNames[indFamily]]];
        for (indFont = 0; indFont < [fontNames count]; ++indFont) {
            if ([fontNames[indFont] isEqualToString:name]) {
                return YES;
            }
        }
    }

    return NO;
}

+ (NSString *)sysVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (BOOL)sysVerEqual:(NSString *)ver {
    return ([self.sysVersion compare:ver options:NSNumericSearch] == NSOrderedSame);
}

+ (BOOL)sysVerGreater:(NSString *)ver {
    return ([self.sysVersion compare:ver options:NSNumericSearch] == NSOrderedDescending);
}

+ (BOOL)sysVerGreater_Equal:(NSString *)ver {
    return ([self.sysVersion compare:ver options:NSNumericSearch] != NSOrderedAscending);
}

+ (BOOL)sysVerLess:(NSString *)ver {
    return ([self.sysVersion compare:ver options:NSNumericSearch] == NSOrderedAscending);
}

+ (BOOL)sysVerLess_Equal:(NSString *)ver {
    return ([self.sysVersion compare:ver options:NSNumericSearch] != NSOrderedDescending);
}

@end