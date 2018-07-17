//
//  UIButton+BYHelper.h
//  OwnerLoan
//
//  Created by user on 2018/5/22.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BYHelper)
//+ (id)labelWithTextColor:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment;
+ (id)buttonWithFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title;

+ (id)buttonWithFrame:(CGRect)frame textColor:(UIColor *)color font:(UIFont *)font title:(NSString *)title boardColor:(UIColor *)bcolor cornerRadius:(CGFloat)corner;
@end
