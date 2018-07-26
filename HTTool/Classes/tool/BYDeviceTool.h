//
//  BYDeviceTool.h
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>
@interface BYDeviceTool : NSObject
//判断相机权限
+(BOOL)hasPowerOfCamera;

//判断相册权限
+(BOOL)hasPowerOfLibrary;

//判断定位权限
+(BOOL)hasPowerOfLocationWithMust:(BOOL)must;


/**
 设置是否录入了指纹
 @return 指纹对象
 */
+(LAContext *)isCouldFingerprint:(NSString *)titleStr;



@end
