//
//  UILabel+BYHelper.m
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import "UILabel+BYHelper.h"

@implementation UILabel (BYHelper)
+ (id)labelWithTextColor:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment{
    return [self labelWithTextColor:color font:font textAlignment:alignment text:nil];
}
+ (id)labelWithTextColor:(UIColor *)color font:(UIFont *)font textAlignment:(NSTextAlignment)alignment text:(NSString *)text{
    UILabel *label = [[[self class] alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = color;
    label.font = font;
    label.textAlignment = alignment;
    label.text = text;
    [label sizeToFit];
    return label;
}

- (void)setTextColor:(UIColor *)textColor range:(NSRange)range
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSForegroundColorAttributeName
                 value: textColor
                 range: range];
    
    [self setAttributedText: text];
}

- (void)setFont:(UIFont *)font range:(NSRange)range
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString: self.attributedText];
    [text addAttribute: NSFontAttributeName
                 value: font
                 range: range];
    
    [self setAttributedText: text];
}

- (void)setTextColor:(UIColor *)textColor contentString:(NSString *)string
{
    if (!string.length) {
        return;
    }
    
    NSRange range = [self.text rangeOfString:string];
    
    if (range.location != NSNotFound)
    {
        [self setTextColor:textColor range:range];
    }
}

- (void)setFont:(UIFont *)font contentString:(NSString *)contentString
{
    
    if (!contentString.length) {
        return;
    }
    
    NSRange range = [self.text rangeOfString:contentString];
    
    if (range.location != NSNotFound)
    {
        [self setFont:font range:range];
    }
}


- (void)setTextColor:(UIColor *)textColor afterOccurenceOfString:(NSString*)separator{
    
    NSRange range = [self.text rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        range.location ++;
        range.length = self.text.length - range.location;
        [self setTextColor:textColor range:range];
    }
}

- (void)setFont:(UIFont *)font afterOccurenceOfString:(NSString*)separator{
    
    NSRange range = [self.text rangeOfString:separator];
    
    if (range.location != NSNotFound)
    {
        range.location ++;
        range.length = self.text.length - range.location;
        [self setFont:font range:range];
    }
}



- (void)setLineHeightMargin:(CGFloat)margin
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = margin;//行距
    [style setLineBreakMode:NSLineBreakByTruncatingTail];
    [text addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0,  self.text.length)];
    [self setAttributedText: text];
}
@end
