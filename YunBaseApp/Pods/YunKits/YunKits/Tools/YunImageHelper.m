//
// Created by yun on 2017/6/29.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "YunImageHelper.h"

@implementation YunImageHelper

+ (NSString *)base64FormImg:(UIImage *)image {
    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

+ (UIImage *)imgFromBase64:(NSString *)strEncodeData {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:strEncodeData
                                                       options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

@end