//
//  UIButton+BYHelper.h
//  OwnerLoan
//
//  Created by user on 2018/5/22.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BYHelper)
//创建button
+ (id)by_buttonWithFrame:(CGRect)frame bgColro:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title;
+ (id)by_buttonWithFrame:(CGRect)frame bgColro:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title boardColor:(UIColor *)bcolor cornerRadius:(CGFloat)corner;
@end
