//
//  UIButton+BYHelper.m
//  OwnerLoan
//
//  Created by user on 2018/5/22.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UIButton+BYHelper.h"

@implementation UIButton (BYHelper)
//创建button
+ (id)by_buttonWithFrame:(CGRect)frame bgColro:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title{
    return [UIButton by_buttonWithFrame:frame bgColro:bgColor textColor:color font:font title:title boardColor:[UIColor clearColor] cornerRadius:0];
}

+ (id)by_buttonWithFrame:(CGRect)frame bgColro:(UIColor *)bgColor textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title boardColor:(UIColor *)bcolor cornerRadius:(CGFloat)corner{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.backgroundColor = bgColor;
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    [btn setTitle:title forState:UIControlStateNormal];
    btn.layer.borderColor = bcolor.CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = corner;
    return btn;
}


@end
