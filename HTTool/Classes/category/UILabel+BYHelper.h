//
//  UILabel+BYHelper.h
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (BYHelper)
//创建label
+ (id)by_labelWithTextColor:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment;
+ (id)by_labelWithTextColor:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment text:(NSString *)text;

//设置字符串中指定字符串的颜色和大小
- (void)by_setTextColor:(UIColor *)textColor contentString:(NSString*)contentString;
- (void)by_setFont:(UIFont *)font contentString:(NSString*)contentString;

//设置字符串中指定位置的颜色和大小
- (void)by_setTextColor:(UIColor *)textColor range:(NSRange)range;
- (void)by_setFont:(UIFont *)font range:(NSRange)range;

//设置字符串中指定位置的颜色和大小
- (void)by_setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)string;
- (void)by_setFont:(UIFont *)font afterOccurenceOfString:(NSString*)string;

//设置行间距
- (void)by_setLineHeightMargin:(CGFloat)margin;
@end
