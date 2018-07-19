//
//  UIImage+BYCommon.m
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UIImage+BYCommon.h"

@implementation UIImage (BYCommon)
//根据颜色生成一个图片zise=1*1
+(UIImage *)by_imageWithColor:(UIColor *)aColor{
    return [UIImage by_imageWithColor:aColor withSize:CGSizeMake(1, 1)];
}
//根据颜色生成一个图片zise可以定制
+(UIImage *)by_imageWithColor:(UIColor *)aColor withSize:(CGSize)size{
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [aColor CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return img;
}
//生成圆角的图片
- (UIImage *)by_getCircleImage
{
    UIGraphicsBeginImageContext(self.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextClip(ctx);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
