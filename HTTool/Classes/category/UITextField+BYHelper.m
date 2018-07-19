//
//  UITextField+BYHelper.m
//  OwnerLoan
//
//  Created by user on 2018/5/18.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UITextField+BYHelper.h"
#import "UIViewExt.h"
//#import "HTTool.h"
@implementation UITextField (BYHelper)
//创建textField
+ (id)by_textFieldWithFrame:(CGRect)frame textColor:(UIColor *)textcolor textFont:(UIFont *)textfont placeholder:(NSString *)placeholder placeholderColor:(UIColor *)pcolor placeholderFont:(UIFont *)pfont{
    UITextField *tf = [[UITextField alloc] initWithFrame:frame];
    tf.textColor = textcolor;
    tf.font = textfont;
    tf.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName: pcolor,NSFontAttributeName:pfont}];

    return tf;
}

//设置textField左边视图
-(void)by_creatLeftViewWithWidth:(CGFloat)width image:(UIImage *)image textStr:(NSString *)textstr textColor:(UIColor *)textcolor textFont:(UIFont *)textfont
{
    UIView * leftV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, self.height)];
    leftV.backgroundColor = [UIColor clearColor];
    
    if (textstr.length!=0) {
        UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = textcolor;
        titleLabel.text = textstr;
        [titleLabel sizeToFit];
        titleLabel.center = CGPointMake(leftV.width/2, self.height/2);
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


//设置textField右边视图
-(void)by_creatRightViewWithWidth:(CGFloat)width image:(UIImage *)image textStr:(NSString *)textstr textColor:(UIColor *)textcolor textFont:(UIFont *)textfont{
    UIView * rightV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, self.height)];
    rightV.backgroundColor = [UIColor clearColor];
    
    if (textstr.length!=0) {
        UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.textColor = textcolor;
        titleLabel.text = textstr;
        [titleLabel sizeToFit];
        titleLabel.center = CGPointMake(rightV.width/2, self.height/2);
        [rightV addSubview:titleLabel];
    }
    if (image) {
        UIImageView * imageV = [[UIImageView alloc]initWithImage:image];
        [imageV sizeToFit];
        imageV.center = CGPointMake(rightV.width/2, rightV.height/2-2);
        [rightV addSubview:imageV];
        
    }
    self.rightView = rightV;
    self.rightViewMode = UITextFieldViewModeAlways;
}

@end
