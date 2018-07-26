//
//  NSObject+BYHelper.h
//  HTTool
//
//  Created by user on 2018/7/26.
//

#import <Foundation/Foundation.h>

@interface NSObject (BYHelper)
+(void)by_swizzlingInClass:(Class)cls originSelector:(SEL)originSelector swizzledSelector:(SEL)swizzledSelector;
@end
