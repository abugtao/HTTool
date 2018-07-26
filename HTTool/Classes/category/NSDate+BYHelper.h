//
//  NSDate+BYHelper.h
//  HTTool
//
//  Created by user on 2018/7/19.
//

//关于NSDate的总结
//No.1 通过[NSDate date]获取是零时区的时间
//No.2 NSDate(零时区) <-> timeStamp（时间戳）
//No.3 系统认为NSDate应该是0时区的，NSString是东八区的
//No.4 dateFormat转换，公式NSDate（0时区）<-> NSString（东八区）
//凡是用到了NSDate，全部使用0时区的，因为至少转换成时间戳的时候，绝对正确。通过No.4的公式，直接通过dateFormat转化成北京时间字符串

//时间戳就是1970.1.1 00：00：00作为标准，某个时间和他的秒数，并且NSDate必须是0时区的，UTC格式的

#import <Foundation/Foundation.h>

@interface NSDate (BYHelper)
//str（东八区）转date（0时区）
+ (NSDate *)by_dateWithDateStr:(NSString *)datestr formatStr:(NSString *)formatstr;


//date（0时区）转成特定格式的str（东八区）
+ (NSString *)by_datestrWithDate:(NSDate *)date formatStr:(NSString *)formatstr;


/**
 *  将0时区的时间转成0时区的时间戳
 */
+ (NSString *)by_timestampWithDate:(NSDate *)date;

/**
 *  将0时区的时间戳转成0时区的时间
 */
+ (NSDate *)by_dateWithTimestamp:(NSString *)timestamp;


@end
