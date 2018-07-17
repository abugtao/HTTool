//
//  UIButton+BYHelper.m
//  OwnerLoan
//
//  Created by user on 2018/5/22.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UIButton+BYHelper.h"

@implementation UIButton (BYHelper)
+ (id)buttonWithFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title{
    
    return [UIButton buttonWithFrame:frame textColor:color font:font title:title boardColor:[UIColor clearColor] cornerRadius:0];
}

+ (id)buttonWithFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title boardColor:(UIColor *)bcolor cornerRadius:(CGFloat)corner{

    
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    btn.titleLabel.font = font;
    btn.layer.borderColor = bcolor.CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = corner;
    
    return btn;
}


@end
