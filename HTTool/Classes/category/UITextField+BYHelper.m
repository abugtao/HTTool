//
//  UITextField+BYHelper.m
//  OwnerLoan
//
//  Created by user on 2018/5/18.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UITextField+BYHelper.h"
#import "ColorAndFont.h"
#import "UIViewExt.h"
//#import "HTTool.h"
@implementation UITextField (BYHelper)
+ (id)textFieldWithFrame:(CGRect)frame TextColor:(UIColor *)textColor textFont:(UIFont *)textfont placeholder:(NSString *)placeholder placeholderColor:(UIColor *)pcolor placeholderFont:(UIFont *)pfont{
    UITextField *tf = [[UITextField alloc] initWithFrame:frame];
    
    tf.textColor = textColor;
    tf.font = textfont;
    tf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: pcolor,NSFontAttributeName:pfont}];

    
    
    return tf;
}

-(void)creatLeftView:(CGFloat)width image:(UIImage *)image text:(NSString *)textStr
{
    UIView * leftV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, self.height)];
    leftV.backgroundColor = [UIColor clearColor];
    
    if (textStr.length!=0) {
        UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = DiyFont(14);
        titleLabel.textColor = UIColorFromRGB(0x4A4C5B);
        titleLabel.text = textStr;
        [titleLabel sizeToFit];
        titleLabel.center = CGPointMake(titleLabel.center.x, self.height/2);
        [leftV addSubview:titleLabel];
    }
    
    
    if (image) {
        
        UIImageView * imageV = [[UIImageView alloc]initWithImage:image];
        [imageV sizeToFit];
        imageV.center = CGPointMake(leftV.width/2, leftV.height/2-2);
        [leftV addSubview:imageV];
        
    }
    self.leftView = leftV;
    self.leftViewMode = UITextFieldViewModeAlways;
}


@end
