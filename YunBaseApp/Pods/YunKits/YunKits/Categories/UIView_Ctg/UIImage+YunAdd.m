//
// Created by yun on 2017/5/17.
// Copyright (c) 2017 yun. All rights reserved.
//

#import "UIImage+YunAdd.h"
#import "UIImage+Resizing.h"

@implementation UIImage (YunAdd)

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

- (UIImage *)resizeWithHeight:(CGFloat)height {
    CGFloat w = CGImageGetWidth(self.CGImage);
    CGFloat h = CGImageGetHeight(self.CGImage);

    CGFloat newW = w * height / h;

    UIImage *newImg = [self scaleToFitSize:CGSizeMake(newW, height)];

    return newImg;
}

// kb
- (UIImage *)resizeWithSize:(NSInteger)size {
    return [self resizeWithMaxSize:size * self.imgLgFactor];
}

// kb
- (UIImage *)compressByMaxLength:(NSInteger)length {
    NSInteger maxLength = length * self.imgLgFactor;

    NSData *data = UIImageJPEGRepresentation(self, 1);
    if (data.length < maxLength) return self;

    NSData *copData = [self compressByMaxLengthToData:length];

    UIImage *copImage = [UIImage imageWithData:copData];
    return copImage;
}

- (NSData *)compressByMaxLengthToData:(NSInteger)length {
    NSInteger maxLength = length * self.imgLgFactor;

    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    if (data.length < maxLength) return data;

    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(self, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        }
        else if (data.length > maxLength) {
            max = compression;
        }
        else {
            break;
        }
    }

    return data;
}

// byte
- (UIImage *)resizeWithMaxSize:(NSInteger)size {
    CGFloat cmp = 1.0;
    CGFloat maxCop = 0.1f;
    UIImage *img = self;

    // todo add
    NSData *imgDataMin = UIImageJPEGRepresentation(img, maxCop);
    if (imgDataMin.length > size) {
        UIImage *minImg = [UIImage imageWithData:imgDataMin];
        return minImg;
    }

    NSData *imgData = UIImageJPEGRepresentation(img, cmp);
    while ([imgData length] > size && cmp > maxCop) {
        cmp *= 0.7f;
        imgData = UIImageJPEGRepresentation(img, cmp);
    }

    if (cmp < maxCop) {
        cmp = maxCop;
        imgData = UIImageJPEGRepresentation(img, cmp);
    }

    UIImage *compressedImage = [UIImage imageWithData:imgData];
    return compressedImage;
}

- (NSInteger)imgSize {
    NSData *imageData = UIImageJPEGRepresentation(self, 1);

    return [imageData length] / self.imgLgFactor;
}

- (NSInteger)imgLength {
    NSData *imageData = UIImageJPEGRepresentation(self, 1);

    return [imageData length] / self.imgLgFactor;
}

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

- (NSInteger)imgLgFactor {
    return 1024; // 1000?
}

@end