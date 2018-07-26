//
//  NSDate+BYHelper.m
//  HTTool
//
//  Created by user on 2018/7/19.
//

#import "NSDate+BYHelper.h"

@implementation NSDate (BYHelper)


//str（东八区）转date（0时区）
+ (NSDate *)by_dateWithDateStr:(NSString *)datestr formatStr:(NSString *)formatstr{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:formatstr];
    NSDate *date = [format dateFromString:datestr];
    return date;
}




//date（0时区） 按照传入的格式转 str（东八区）
+ (NSString *)by_datestrWithDate:(NSDate *)date formatStr:(NSString *)formatstr{
    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:formatstr];
    NSString *dateStr = [format stringFromDate:date];
    return dateStr;
}


/**
 *  将0时区的时间转成0时区的时间戳
 */
+ (NSString *)by_timestampWithDate:(NSDate *)date{
    NSTimeInterval inter = [date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%ld", (long)inter];
}

/**
 *  将0时区的时间戳转成0时区的时间
 */
+ (NSDate *)by_dateWithTimestamp:(NSString *)timestamp{
    NSTimeInterval inter = [timestamp doubleValue];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:inter];
    return date;
}


@end
