//
// Created by 王健 on 16/9/18.
// Copyright (c) 2016 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunUISearchBarFactory.h"
#import "YunValueVerifier.h"

@implementation YunUISearchBarFactory

+ (UISearchBar *)barWithTarget:(id _Nullable)target {
    CGFloat screenWide = [UIScreen mainScreen].bounds.size.width;
    return [self barWithFrame:CGRectMake(0.0f, 2.0f, screenWide - 15 * 4 - 26 * 2, 26.0f) bgImgName:nil phText:@"搜索" target:target];
}

+ (UISearchBar *)barWithPhText:(NSString *_Nullable)phText
                        target:(id _Nullable)target {
    CGFloat screenWide = [UIScreen mainScreen].bounds.size.width;
    return [self barWithFrame:CGRectMake(0.0f, 2.0f, screenWide - 15 * 4 - 26 * 2, 26.0f) bgImgName:nil phText:phText target:target];
}

+ (UISearchBar *)barWithFrame:(CGRect)frame
                       target:(id _Nullable)target {
    return [self barWithFrame:frame bgImgName:nil phText:@"搜索" target:target];
}

+ (UISearchBar *)barWithFrame:(CGRect)frame
                    bgImgName:(NSString *_Nullable)bgImgName
                       phText:(NSString *_Nullable)phText
                       target:(id _Nullable)target {
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:frame];
    searchBar.layer.cornerRadius = 3;
    searchBar.layer.borderWidth = 0;
    searchBar.layer.masksToBounds = YES;
    searchBar.delegate = target;
    [searchBar setTintColor:[UIColor blackColor]];
    [searchBar setPlaceholder:phText];

    if (![YunValueVerifier isNilOrEmptyOrSpaceStr:bgImgName]) {
        [searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:bgImgName] forState:UIControlStateNormal];
    }

    return searchBar;
}

+ (UIView *)viewWithFrame:(CGRect)frame
                   phText:(NSString *_Nullable)phText
                   target:(id _Nullable)target {
    UISearchBar *searchBar = [self barWithFrame:frame bgImgName:nil phText:phText target:target];
    searchBar.tag = 99;

    UIView *searchView = [[UIView alloc] initWithFrame:frame];
    searchView.backgroundColor = [UIColor clearColor];
    [searchView addSubview:searchBar];

    return searchView;
}

@end