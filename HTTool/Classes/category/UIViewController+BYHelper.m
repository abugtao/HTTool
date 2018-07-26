//
//  UIViewController+BYHelper.m
//  HTTool
//
//  Created by user on 2018/7/26.
//

#import "UIViewController+BYHelper.h"
#import "NSObject+BYHelper.h"
@implementation UIViewController (BYHelper)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(ht_viewWillAppear:);
        [NSObject by_swizzlingInClass:[self class] originSelector:originalSelector swizzledSelector:swizzledSelector];
        
        
        SEL originalSelector2 = @selector(viewDidDisappear:);
        SEL swizzledSelector2 = @selector(ht_viewDidDisappear:);
        [NSObject by_swizzlingInClass:[self class] originSelector:originalSelector2 swizzledSelector:swizzledSelector2];
        
    });
}


- (void)ht_viewWillAppear:(BOOL)animated{
    [self action_viewWillApper]; //插入代码
    [self ht_viewWillAppear:animated];
}


- (void)ht_viewDidDisappear:(BOOL)animated{
    [self action_viewDidDisappear];  //插入代码
    [self ht_viewDidDisappear:animated];
}



- (void)action_viewWillApper{
//    NSString *pageId = [self pageEventID:YES];
//
//    if (pageId) {
//        //发送
//    }
    
    
}

- (void)action_viewDidDisappear{
//    NSString *pageId = [self pageEventID:NO];
//    if (pageId) {
//        //发送
//    }
    
    
}
@end
