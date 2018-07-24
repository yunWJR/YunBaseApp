//
// Created by yun on 2017/5/17.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UIImage+YunAdd.h"
#import "UIImage+Resizing.h"
#import "YunValueHelper.h"
#import "YunConfig.h"

@implementation UIImage (YunAdd)

#pragma mark - instacne

+ (UIImage *)imgWithObj:(id)obj {
    if (obj) {
        if ([obj isKindOfClass:UIImage.class]) {
            return obj;
        }
        else if ([obj isKindOfClass:NSData.class]) {
            return [UIImage imageWithData:obj];
        }
    }

    return nil;
}

+ (UIImage *)imgWithColor:(UIColor *)color {
    return [self imgWithColor:color size:CGSizeMake(1.0f, 1.0f)];
}

+ (UIImage *)imgWithColor:(UIColor *)color height:(CGFloat)height {
    return [self imgWithColor:color size:CGSizeMake(1.0f, height)];
}

+ (UIImage *)imgWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) {
        return nil;
    }

    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return image;
}

+ (UIImage *)getViewImage:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, YES, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return img;
}

#pragma mark - common

- (UIImage *)roundCornerImg {
    UIImage *source = self;
    CGFloat w = source.size.width;
    CGFloat h = source.size.height;

    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate(NULL, w, h, 8, 4 * w, colorSpace, kCGImageAlphaPremultipliedFirst);

    CGContextBeginPath(context);
    CGRect rect = CGRectMake(0, 0, w, h);
    addRoundedRectToPath(context, rect, 0.1, 0.1);
    CGContextClosePath(context);
    CGContextClip(context);

    CGContextDrawImage(context, CGRectMake(0, 0, w, h), source.CGImage);

    CGImageRef imageMasked = CGBitmapContextCreateImage(context);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);

    return [UIImage imageWithCGImage:imageMasked];
}

void addRoundedRectToPath(CGContextRef context, CGRect rect, float ovalWidth, float ovalHeight) {
    float fw, fh;
    if (ovalWidth == 0 || ovalHeight == 0) {
        CGContextAddRect(context, rect);
        return;
    }
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGContextScaleCTM(context, ovalWidth, ovalHeight);
    fw = CGRectGetWidth(rect) / ovalWidth;
    fh = CGRectGetHeight(rect) / ovalHeight;
    CGContextMoveToPoint(context, fw, fh / 2);
    CGContextAddArcToPoint(context, fw, fh, fw / 2, fh, 1);
    CGContextAddArcToPoint(context, 0, fh, 0, fh / 2, 1);
    CGContextAddArcToPoint(context, 0, 0, fw / 2, 0, 1);
    CGContextAddArcToPoint(context, fw, 0, fw, fh / 2, 1);
    CGContextClosePath(context);
    CGContextRestoreGState(context);
}

- (UIImage *)resizeAndCmpDef {
    UIImage *img = [self resize:YunConfig.instance.imgMaxBoundary
                         andCmp:YunConfig.instance.imgMaxLength];

    return img;
}

- (UIImage *)resize:(CGFloat)boundary andCmp:(NSInteger)length {
    UIImage *img = self;

    if (boundary > 0) {
        img = [self resizeByMaxBd:boundary];
    }

    if (length > 0) {
        img = [img compressByMaxLength:length];
    }

    return img;
}

- (NSData *)resizeAndCmpToDataDef {
    NSData *imgData = [self resizeToData:YunConfig.instance.imgMaxBoundary
                                  andCmp:YunConfig.instance.imgMaxLength];

    return imgData;
}

- (NSData *)resizeToData:(CGFloat)boundary andCmp:(NSInteger)length {
    UIImage *img = self;

    if (boundary > 0) {
        img = [self resizeByMaxBd:boundary];
    }

    NSData *imgD = nil;
    if (length > 0) {
        imgD = [img compressByMaxLengthToData:length];
    }
    else {
        imgD = [self cmpImg:img cmp:1];
    }

    return imgD;
}

#pragma mark - size

// 压缩尺寸
- (UIImage *)resizeByDef {
    return [self resizeByMaxBd:YunConfig.instance.imgMaxBoundary];
}

// 压缩尺寸
- (UIImage *)resizeByMaxBd:(CGFloat)boundary {
    // 不压缩
    if (boundary <= 0.01) {
        return self;
    }

    CGFloat width = self.size.width;
    CGFloat height = self.size.height;

    // 小于等于最大边
    if (MAX(width, height) <= boundary) {

        [self logOrgSize:self.size size:self.size];
        return self;
    }

    CGSize size = [self getSizeByMaxBd:boundary];
    UIImage *reImg = [self resizedImage:size];

    [self logOrgSize:self.size size:size];

    return reImg;
}

- (CGSize)getSizeByMaxBd:(CGFloat)boundary {
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;

    // 小于等于最大边
    if (MAX(width, height) <= boundary) {
        return CGSizeZero;
    }

    // aspect ratio
    CGFloat ratio = MAX(width, height) / MIN(width, height);
    if (ratio <= 2) {
        CGFloat x = MAX(width, height) / boundary;
        if (width > height) {
            width = boundary;
            height = height / x;
        }
        else {
            height = boundary;
            width = width / x;
        }
    }
    else {
        // 最小边大于都大于boundary，长宽比过大、按最大边压缩，最小边太小，按最小边来压缩
        //
        boundary = boundary * 0.5f; // 最小边为0.5倍最大边设置

        if (MIN(width, height) >= boundary) {
            // Set the smaller value to the boundary, and the larger value is compressed
            CGFloat x = MIN(width, height) / boundary;
            if (width < height) {
                width = boundary;
                height = height / x;
            }
            else {
                height = boundary;
                width = width / x;
            }
        }
    }

    return CGSizeMake(width, height);
}

- (UIImage *)resizedImage:(CGSize)newSize {
    CGRect newRect = CGRectMake(0, 0, newSize.width, newSize.height);
    UIGraphicsBeginImageContext(newRect.size);
    UIImage *newImage = [[UIImage alloc] initWithCGImage:self.CGImage scale:1 orientation:self.imageOrientation];
    [newImage drawInRect:newRect];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)resizeWithHeight:(CGFloat)height {
    if (height <= 0.01) {
        return self;
    }

    CGFloat w = CGImageGetWidth(self.CGImage);
    CGFloat h = CGImageGetHeight(self.CGImage);

    CGFloat newW = w * height / h;

    UIImage *newImg = [self scaleToFitSize:CGSizeMake(newW, height)];

    return newImg;
}

#pragma mark

- (UIImage *)compressDef {
    return [self compressByMaxLength:YunConfig.instance.imgMaxLength];
}

// kb
- (UIImage *)compressByMaxLength:(NSInteger)length {
    if (length <= 0) {
        return self;
    }

    NSInteger maxLength = length * self.imgLgFactor;
    NSData *data = [self cmpSelf:1];

    // 太小、不压缩
    if (data.length < maxLength * (1 + self.LengthDelta)) {
        [self logCmpMsg:data desLg:length];
        return self;
    }

    // 太大，最大压缩率都超过了大小，则用最大压缩率
    if (data.length / maxLength > 10) {
        NSData *minData = [self cmpSelf:self.maxComp];
        if (minData.length > maxLength * (1 - self.LengthDelta)) {
            [self logCmpMsg:minData desLg:length];

            return [self newImgWithData:minData];
        }
    }

    // 刚合适、不用压缩
    if ([self isFit:data length:length]) {
        [self logCmpMsg:data desLg:length];
        return self;
    }

    data = [self cmpByMaxLengthToData:length data:data];

    [self logCmpMsg:data desLg:length];

    return [self newImgWithData:data];
}

- (NSData *)compressByMaxLengthToData:(NSInteger)length {
    if (length <= 0) {
        return [self cmpSelf:1];
    }

    return [self cmpByMaxLengthToData:length data:nil];
}

- (NSData *)cmpByMaxLengthToData:(NSInteger)length data:(NSData *)data {
    NSInteger maxLength = length * self.imgLgFactor;

    CGFloat cmp = 1;
    BOOL check = data == nil;
    if (data == nil) {
        data = [self cmpSelf:cmp];
    }

    if (check) {
        // 太小、不压缩
        if (data.length < maxLength) {
            return data;
        }

        // 太大，最大压缩率都超过了大小，则用最大压缩率
        if (data.length / maxLength > 10) {
            NSData *minData = [self cmpSelf:self.maxComp];
            if (minData.length > maxLength * (1 - self.LengthDelta)) {
                return minData;
            }
        }

        // 刚合适、不用压缩
        if ([self isFit:data length:length]) {
            return data;
        }
    }

    CGFloat ratio = data.length * 1.0f / maxLength;
    if (ratio < 2) {
        data = [self cmpBYMaxLengthWithDelta:length delta:0.03f imgData:data];
    }
    else if (ratio < 3) {
        data = [self cmpBYMaxLengthWithDelta:length delta:0.06f imgData:data];
    }
    else if (ratio < 4) {
        data = [self cmpBYMaxLengthWithDelta:length delta:0.09f imgData:data];

        //data = [self cmpBYMaxLengthWithRatio:length ratio:0.9f imgData:data];
    }
    else if (ratio < 5) {
        //data = [self cmpBYMaxLengthWithDelta:length delta:0.1f imgData:data];

        data = [self cmpBYMaxLengthWithRatio:length ratio:0.80f imgData:data];
    }
    else if (ratio < 6) {
        data = [self cmpBYMaxLengthWithRatio:length ratio:0.7f imgData:data];
    }
    else { // 多大，采用二分查找
        data = [self compressionByMaxLengthWithBinary:length imgData:data];
    }

    return data;
}

- (NSData *)cmpBYMaxLengthWithRatio:(NSInteger)length ratio:(CGFloat)ratio imgData:(NSData *)imgData {
    NSInteger maxLength = length * self.imgLgFactor;
    NSInteger minLg = (NSInteger) (maxLength * (1 - self.LengthDelta));
    NSData *imgD = imgData;

    CGFloat maxCop = self.maxComp;
    CGFloat cmp = 1;

    BOOL cmpEb = imgD.length > minLg && cmp > maxCop;

    while (cmpEb) {
        if ([self isFit:imgD length:length]) {
            break; // 如果在误差范围，则不用计算了
        }

        cmp *= ratio; // 找到最优系数时，慢速逼近
        imgD = [self cmpSelf:cmp];

        cmpEb = imgD.length > minLg && cmp > maxCop;
    }

    // 压缩过小修复
    NSInteger fixTimes = 0;
    BOOL fixEb = imgD.length < minLg && fixTimes < 4;
    while (fixEb) {
        fixTimes++;

        cmp = cmp + (1 - cmp) * 0.5f;

        imgD = [self cmpSelf:cmp];

        fixEb = imgD.length < minLg && fixTimes < 4;
    }

    return imgD;
}

- (NSData *)cmpBYMaxLengthWithDelta:(NSInteger)length delta:(CGFloat)delta imgData:(NSData *)imgData {
    NSInteger maxLength = length * self.imgLgFactor;
    NSInteger minLg = (NSInteger) (maxLength * (1 - self.LengthDelta));
    NSData *imgD = imgData;
    NSData *lastImgD = imgD;

    CGFloat maxCop = self.maxComp;
    CGFloat cmp = 1;

    BOOL cmpEb = imgD.length > minLg && cmp > maxCop;

    while (cmpEb) {
        if ([self isFit:imgD length:length]) {
            break; // 如果在误差范围，则不用计算了
        }

        lastImgD = imgD;

        cmp -= delta; // 步进逼近
        imgD = [self cmpSelf:cmp];

        cmpEb = imgD.length > minLg && cmp > maxCop;
    }

    if (delta > 0.2) { // 步进过大时，修复系数
        // 压缩过小修复
        NSInteger fixTimes = 0;
        BOOL fixEb = imgD.length < minLg && fixTimes < 4;
        while (fixEb) {
            fixTimes++;

            CGFloat tmpDelta = (1 - cmp) * 0.5f;
            if (tmpDelta < 0.05) { // 多小时，压缩无效果
                break;
            }

            cmp = cmp + tmpDelta;

            imgD = [self cmpSelf:cmp];

            fixEb = imgD.length < minLg && fixTimes < 4;
        }

        return imgD;
    }

    if (imgD.length < minLg) {
        return lastImgD;
    }

    return imgD;
}

- (NSData *)compressionByMaxLengthWithBinary:(NSInteger)length imgData:(NSData *)imgData {
    NSInteger maxLength = length * self.imgLgFactor;

    NSData *imgD = imgData;

    CGFloat max = 1;
    CGFloat min = 0;
    CGFloat cmp = 1;
    NSInteger cmpTimes = 0;

    if (imgD == nil) {
        imgD = [self cmpSelf:cmp];
    }

    BOOL cmpEb = (![self isFit:imgD length:length] ||
                  (cmpTimes > 6 && (imgD.length < maxLength * 2 || imgD.length > maxLength * 0.6))) &&
                 cmp > self.maxComp;

    while (cmpEb) {
        cmpTimes++;

        cmp = (max + min) / 2;
        imgD = [self cmpSelf:cmp];

        if (imgD.length > maxLength) {
            max = cmp;
        }
        else if (imgD.length < maxLength) {
            min = cmp;
        }

        cmpEb = (![self isFit:imgD length:length] ||
                 (cmpTimes > 6 && (imgD.length < maxLength * 2 || imgD.length > maxLength * 0.6))) &&
                cmp > self.maxComp;
    }

    return imgD;
}

#pragma mark - length

// kb
- (UIImage *)resizeWithSize:(NSInteger)size {
    return [self compressByMaxLength:size];
}

// byte
- (UIImage *)resizeWithMaxSize:(NSInteger)size {
    return [self compressByMaxLength:size];
}

- (NSInteger)imgSize {
    NSData *imageData = UIImageJPEGRepresentation(self, 1);

    return [imageData length] / self.imgLgFactor;
}

- (NSInteger)imgLength {
    NSData *imageData = UIImageJPEGRepresentation(self, 1);

    return [imageData length] / self.imgLgFactor;
}

- (NSInteger)imgLgFactor {
    return 1024; // 1000?
}

- (BOOL)isFit:(NSData *)data length:(NSInteger)length {
    CGFloat factor = self.LengthDelta;
    NSInteger maxLg = length * self.imgLgFactor;

    if (data.length <= maxLg * (1 + factor) && data.length >= maxLg * (1 - factor)) {
        return YES;
    }

    return NO;
}

- (CGFloat)LengthDelta {
    return 0.25;
}

- (CGFloat)maxComp {
    return 0.1f;
}

#pragma mark - private

- (NSData *)cmpSelf:(CGFloat)cmp {
    return [self cmpImg:self cmp:cmp];
}

- (NSData *)cmpImg:(UIImage *)img cmp:(CGFloat)cmp {
    NSData *imgD = UIImageJPEGRepresentation(img, cmp);

    if (YunConfig.instance.isLogMode) {
        NSLog(@"\n-------||--YunImageCmp:Size-->%@ kb<--   cmp-->%@<--",
              [YunValueHelper intStr:imgD.length / self.imgLgFactor],
              [YunValueHelper floatStr:cmp]);
    }

    return imgD;
}

- (void)logCmpMsg:(NSData *)data desLg:(NSInteger)length {
    if (YunConfig.instance.isLogMode) {
        NSLog(@"\n-------YunImageCmp:rst_length-->%@ kb<--   src_length-->%@<--",
              [YunValueHelper intStr:data.length / self.imgLgFactor],
              [YunValueHelper intStr:length]);
    }
}

- (void)logOrgSize:(CGSize)orgSize size:(CGSize)size {
    if (YunConfig.instance.isLogMode) {
        NSLog(@"\n-------&&--YunImageCmp:rst_size-->%@:%@<--   org_size-->%@:%@<--",
              [YunValueHelper floatStr:size.width],
              [YunValueHelper floatStr:size.height],
              [YunValueHelper floatStr:orgSize.width],
              [YunValueHelper floatStr:orgSize.height]);
    }
}

- (UIImage *)saveNewImage:(UIImage *)image {
    CGFloat maxFileSize = 32 * 1000;
    CGFloat compression = 0.9f;

    UIGraphicsBeginImageContext(CGSizeMake(320, 480));
    [image drawInRect:CGRectMake(0, 0, 320, 480)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    NSData *compressedData = UIImageJPEGRepresentation(newImage, compression);
    while ([compressedData length] > maxFileSize) {
        if (compression <= 0.1) {
            compression = 0.9;
        }
        else {
            compression -= 0.1;
        }
        UIImage *image_m = [UIImage imageWithData:compressedData];
        compressedData = UIImageJPEGRepresentation(image_m, compression);

    }
    UIImage *compressedImage = [UIImage imageWithData:compressedData];
    return compressedImage;
}

- (UIImage *)newImgWithData:(NSData *)data {
    UIImage *image = [UIImage imageWithData:data];

    return [self newImgWithImg:image];
}

- (UIImage *)newImgWithImg:(UIImage *)image {
    return image;

    // 用 NSData，避免重复 UIImageJPEGRepresentation 图片变大
    UIGraphicsBeginImageContext(image.size);
    [image drawInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    NSData *newD = UIImageJPEGRepresentation(newImage, 1);

    return newImage;
}

@end