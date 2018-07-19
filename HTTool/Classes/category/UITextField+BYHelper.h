//
//  UITextField+BYHelper.h
//  OwnerLoan
//
//  Created by user on 2018/5/18.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (BYHelper)
//创建textField
+ (id)by_textFieldWithFrame:(CGRect)frame textColor:(UIColor *)textcolor textFont:(UIFont *)textfont placeholder:(NSString *)placeholder placeholderColor:(UIColor *)pcolor placeholderFont:(UIFont *)pfont;

//设置textField左边视图
-(void)by_creatLeftViewWithWidth:(CGFloat)width image:(UIImage *)image textStr:(NSString *)textstr textColor:(UIColor *)textcolor textFont:(UIFont *)textfont;


//设置textField右边视图
-(void)by_creatRightViewWithWidth:(CGFloat)width image:(UIImage *)image textStr:(NSString *)textstr textColor:(UIColor *)textcolor textFont:(UIFont *)textfont;
@end
