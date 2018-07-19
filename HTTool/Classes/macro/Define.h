//
//  Define.h
//  OwnerLoan
//
//  Created by user on 2018/4/28.
//  Copyright © 2018年 user. All rights reserved.
//

#ifndef Define_h
#define Define_h



#define SCREEN_WDITH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGTH [[UIScreen mainScreen] bounds].size.height
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//app版本
#define APPCURRENTVERSION [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"]
//userDefault
#define USERDEFFAULTS [NSUserDefaults standardUserDefaults]
//application
#define KAPPLICATION [UIApplication sharedApplication]
//keywindow
#define KEYWINDOW [UIApplication sharedApplication].keyWindow
//appdelegate
#define KAPPDELEGATE ((AppDelegate*)[UIApplication sharedApplication].delegate)

//判断是否是iPhone X
#define LL_IPHONEX  ((SCREEN_WDITH == 375 && SCREEN_HEIGTH == 812) ? YES:NO)
#define TOP_CONST_HEIGHT  (LL_IPHONEX ? 88.0 : 64.0)
#define BOTTOM_CONST_HEIGHT (LL_IPHONEX? 83.0 : 49.0)



//打印出来类，方法，行数，内容
#ifdef DEBUG
#define TLog(format, ...) printf("%s [Line %d] %s\n\n",__PRETTY_FUNCTION__, __LINE__,[[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String])
#else
#define TLog(format, ...)
#endif

//Block Self转换，需配套使用
#define WEAK_SELF __weak __typeof__(self) weakSelf = self;
#define STRONG_SELF __strong __typeof__(weakSelf) strongSelf = weakSelf;




#define LAContectUnclockKey            @"LAContectUnclockKey"     //判断是否开启指纹登录的key
#define USERPHONENUM                   @"UserPhoneNum"            //用户手机号码

#endif /* Define_h */
