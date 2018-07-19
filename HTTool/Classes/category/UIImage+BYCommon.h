//
//  UIImage+BYCommon.h
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BYCommon)


//根据颜色生成一个图片zise=1*1
+(UIImage *)by_imageWithColor:(UIColor *)aColor;
//根据颜色生成一个图片zise可以定制
+(UIImage *)by_imageWithColor:(UIColor *)aColor withSize:(CGSize)size;
//生成圆角的图片
- (UIImage *)by_getCircleImage;
@end
