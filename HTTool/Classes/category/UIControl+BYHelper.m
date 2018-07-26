//
//  UIControl+BYHelper.m
//  HTTool
//
//  Created by user on 2018/7/26.
//

#import "UIControl+BYHelper.h"
#import "NSObject+BYHelper.h"
@implementation UIControl (BYHelper)
+(void)load{
    SEL originalSelector = @selector(sendAction:to:forEvent:);
    SEL swizzledSelector = @selector(ht_sendAction:to:forEvent:);
    [NSObject by_swizzlingInClass:[self class] originSelector:originalSelector swizzledSelector:swizzledSelector];
}


- (void)ht_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    
    [self dealUserAction:action to:target forEvent:event]; //处理统计
    [self ht_sendAction:action to:target forEvent:event];
}

- (void)dealUserAction:(SEL)action to:(id)target forEvent:(UIEvent *)event{
    //这里嵌入自己的代码
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"UserAction" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    NSString *targetName = NSStringFromClass([target class]);
    
    NSString *eventId = dic[targetName][@"ControlEventIDs"][NSStringFromSelector(action)];
    
    NSLog(@"eventId = %@",eventId);
}
@end
