//
// Created by yun on 2017/5/17.
// Copyright (c) 2017 skkj. All rights reserved.
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

- (UIImage *)resizeWithSize:(NSInteger)size {
    return [self resizeWithSize:size height:1080];
}

- (UIImage *)resizeWithSize:(NSInteger)size height:(CGFloat)height {
    UIImage *newImg = [self resizeWithHeight:height];

    CGFloat compression = 0.5f;
    CGFloat maxCompression = 0.00000001f;
    NSData *imageData = UIImageJPEGRepresentation(newImg, compression);
    while ([imageData length] > size && compression > maxCompression) {
        compression *= 0.5f;
        imageData = UIImageJPEGRepresentation(newImg, compression);
    }

    UIImage *compressedImage = [UIImage imageWithData:imageData];
    return compressedImage;
}

- (NSInteger)imgSize {
    NSData *imageData = UIImageJPEGRepresentation(self, 1);

    return [imageData length] / 1000;
}

@end