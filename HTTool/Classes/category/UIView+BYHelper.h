//
//  UIView+BYHelper.h
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BYHelper)
- (void)setClickBlock:(void(^)(void))block;


+ (id)lineViewWith:(CGFloat)value isVertical:(BOOL)b withColor:(UIColor *)color;
@end
