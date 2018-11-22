//
//  Created by 王健 on 16/4/20.
//  Copyright © 2016年 成都晟堃科技有限责任公司. All rights reserved.
//

#import "YunRqtUrlHelper.h"
#import "YunRqtConfig.h"
#import "YunGlobalDefine.h"
#import "YunValueVerifier.h"
#import <CommonCrypto/CommonDigest.h>
#import <Mantle/MTLModel+NSCoding.h>
#import <Mantle/MTLJSONAdapter.h>

@interface YunRqtUrlHelper () {
}

@end

@implementation YunRqtUrlHelper

+ (NSMutableDictionary *)getBasePara {
    NSMutableDictionary *paraDic =
            [[NSMutableDictionary alloc] initWithDictionary:
                    YunRqtConfig.instance.baseParas];

    return paraDic;
}

// base + 分页查询参数
+ (NSMutableDictionary *)getBaseParaWithPageIndex:(NSInteger)startIndex pageSize:(NSInteger)pageSize {
    NSMutableDictionary *paraDic = [self getBasePara];

    if (startIndex > 0 && YunRqtConfig.instance.pageIndexParaName) {
        paraDic[YunRqtConfig.instance.pageIndexParaName] = @(startIndex);
    }

    if (pageSize > 0 && YunRqtConfig.instance.pageSizeParaName) {
        paraDic[YunRqtConfig.instance.pageSizeParaName] = @(pageSize);
    }

    return paraDic;
}

+ (NSMutableDictionary *)getBaseParaWithToken:(NSString *)token {
    NSMutableDictionary *paraDic = [self getBasePara];

    if (YunRqtConfig.instance.tokenParaName) {
        paraDic[YunRqtConfig.instance.tokenParaName] = token;
    }

    return paraDic;
}

+ (NSMutableDictionary *)baseParaWithDic:(NSDictionary *)dic {
    NSMutableDictionary *paraDic =
            [[NSMutableDictionary alloc] initWithDictionary:
                    YunRqtConfig.instance.baseParas];

    [paraDic addEntriesFromDictionary:dic];

    return paraDic;
}

+ (NSMutableDictionary *)baseParaWithMTLObj:(id)data {
    NSMutableDictionary *paraDic = [[NSMutableDictionary alloc] initWithDictionary:
            YunRqtConfig.instance.baseParas];

    if ([data isKindOfClass:MTLModel.class]) {
        NSDictionary *dic = [MTLJSONAdapter JSONDictionaryFromModel:data error:nil];
        if (dic) {
            [paraDic addEntriesFromDictionary:dic];
        }
    }

    return paraDic;
}

+ (NSString *)urlCmBase:(NSString *)addr {
    return [self url:YunRqtConfig.instance.baseURL addr:addr withObj:nil];
}

+ (NSString *)urlCmBase:(NSString *)addr withObj:(NSString *)obj {
    return [self url:YunRqtConfig.instance.baseURL addr:addr withObj:obj];
}

+ (NSString *)urlCmBaseApi:(NSString *)addr {
    return [self url:YunRqtConfig.instance.baseApiURL addr:addr withObj:nil];
}

+ (NSString *)urlCmBaseApi:(NSString *)addr withObj:(NSString *)obj {
    return [self url:YunRqtConfig.instance.baseApiURL addr:addr withObj:obj];
}

+ (NSString *)url:(NSURL *)baseUrl addr:(NSString *)addr withObj:(NSString *)obj {
    NSString *newAddr;

    if ([YunValueVerifier isValidStr:obj]) {
        if ([addr hasSuffix:@"/"]) {
            newAddr = FORMAT(@"%@%@", addr, obj);
        }
        else {
            newAddr = FORMAT(@"%@/%@", addr, obj);
        }
    }
    else {
        newAddr = addr;
    }

    NSString *escapeStr = [self urlStrByUTF8:newAddr];

    return [[NSURL URLWithString:escapeStr relativeToURL:baseUrl] absoluteString];
}

+ (NSString *)urlStrByUTF8:(NSString *)addr {
    //NSString *escapeC = @"?!@#$^&%*+,:;='\"`<>()[]{}/\\| "; // ??? 确定编码字符
    //NSCharacterSet *escSet = [[NSCharacterSet characterSetWithCharactersInString:escapeC] invertedSet];
    //NSString *encodedUrl = [addr stringByAddingPercentEncodingWithAllowedCharacters:escSet];

    NSString *encodedUrl = [addr stringByAddingPercentEncodingWithAllowedCharacters:
                                         [NSCharacterSet URLQueryAllowedCharacterSet]];

    return encodedUrl;
}

#pragma mark - other

+ (NSString *)strByArray:(NSArray *)array sep:(NSString *)sep {
    if (!array || array.count == 0) {
        return @"";
    }

    NSMutableString *mutS = [NSMutableString new];
    for (int j = 0; j < array.count; ++j) {
        if (j != 0) {
            [mutS appendString:sep];
        }
        [mutS appendString:array[j]];
    }
    return mutS;
}

+ (NSString *)strByArrayDic:(NSArray *)array key:(NSString *)keyName {
    if (!array || array.count == 0) {
        return @"";
    }

    NSMutableArray *tmpList = [NSMutableArray new];
    for (int i = 0; i < array.count; ++i) {
        NSDictionary *tagDic = @{keyName : array[i]};
        [tmpList addObject:tagDic];
    }

    return [self JSONString:[NSArray arrayWithArray:tmpList]];
}

+ (NSString *)JSONString:(id)data; {
    NSError *error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:data
                                                options:0 // Pass 0 if you don't care about the readability of the generated string
                                                  error:&error];
    if (error != nil) {
        return @"";
    }

    NSString *stringData = [[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];

    return stringData ? : @"";
}

+ (id)JSONDataByStr:(NSString *)str {
    NSData *strData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error = nil;
    id json = [NSJSONSerialization JSONObjectWithData:strData options:0 error:&error];

    if (error != nil) {
        return nil;
    }

    return json;
}

+ (NSData *)JSONData:(id)data; {
    NSError *error = nil;
    id result = [NSJSONSerialization dataWithJSONObject:data
                                                options:0 // Pass 0 if you don't care about the readability of the generated string
                                                  error:&error];
    if (error != nil) {
        return nil;
    }

    return result;
}

+ (NSDictionary *)dicWithJsonStr:(NSString *)jsonStr {
    if (jsonStr == nil) {
        return nil;
    }

    NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if (err) {
        NSLog(@"json解析失败：%@", err);
        return nil;
    }
    return dic;
}

+ (NSString *)jsonStrWithDic:(id)infoDict {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:infoDict
                                                       options:0 // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];

    NSString *jsonStr = @"";

    if (!jsonData) {
        NSLog(@"Got an error: %@", error);
    }
    else {
        jsonStr = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }

    //去除掉首尾的空白字符和换行字符
    jsonStr = [jsonStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    [jsonStr stringByReplacingOccurrencesOfString:@"\n" withString:@""];

    return jsonStr;
}

+ (NSString *)md5_16bit:(NSString *)str {//大写 %02X
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG) strlen(cStr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                                      result[0], result[1], result[2], result[3],
                                      result[4], result[5], result[6], result[7],
                                      result[8], result[9], result[10], result[11],
                                      result[12], result[13], result[14], result[15]
    ];
}

+ (NSString *)md5_16bit:(NSString *)strOrg salt:(NSString *)salt {//大写 %02X
    NSString *str = [NSString stringWithFormat:@"%@%@", strOrg, salt];
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG) strlen(cStr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                                      result[0], result[1], result[2], result[3],
                                      result[4], result[5], result[6], result[7],
                                      result[8], result[9], result[10], result[11],
                                      result[12], result[13], result[14], result[15]
    ];
}

+ (NSString *)md5_32bit:(NSString *)str {//小写
    const char *cStr = [str UTF8String];
    unsigned char result[32];
    CC_MD5(cStr, (CC_LONG) strlen(cStr), result);
    return [NSString stringWithFormat:
                             @"%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x",
                             result[0], result[1], result[2], result[3],
                             result[4], result[5], result[6], result[7],
                             result[8], result[9], result[10], result[11],
                             result[12], result[13], result[14], result[15],
                             result[16], result[17], result[18], result[19],
                             result[20], result[21], result[22], result[23],
                             result[24], result[25], result[26], result[27],
                             result[28], result[29], result[30], result[31]];
}

@end