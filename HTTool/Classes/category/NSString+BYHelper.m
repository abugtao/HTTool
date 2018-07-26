//
//  NSString+BYHelper.m
//  HTTool
//
//  Created by user on 2018/7/19.
//

#import "NSString+BYHelper.h"

@implementation NSString (BYHelper)
//对象转str
+ (NSString *)by_getCorrectString:(id)obj{
    if ([obj isMemberOfClass:[NSNull class]]||[obj isEqualToString:@"<null>"]||[obj isEqualToString:@"(null)"]||obj==nil) {
        return @"";
    }else{
        return [NSString stringWithFormat:@"%@",obj];
    }
}
@end
