//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YunRqtUrlHelper : NSObject

+ (NSMutableDictionary *)getBasePara;

+ (NSMutableDictionary *)getBaseParaWithPageIndex:(NSInteger)startIndex pageSize:(NSInteger)pageSize;

+ (NSMutableDictionary *)getBaseParaWithToken:(NSString *)token;

+ (NSString *)urlCmBase:(NSString *)addr;

+ (NSString *)urlCmBaseApi:(NSString *)addr;

+ (NSString *)strByArray:(NSArray *)array sep:(NSString *)sep;

+ (NSString *)strByArrayDic:(NSArray *)array key:(NSString *)keyName;

+ (NSString *)JSONString:(id)data;

+ (NSData *)JSONData:(id)data;

+ (NSString *)md5_16bit:(NSString *)str;

+ (NSString *)md5_32bit:(NSString *)str;

+ (NSDictionary *)dicWithJsonStr:(NSString *)jsonStr;

+ (NSString *)jsonStrWithDic:(id)infoDict;

@end
