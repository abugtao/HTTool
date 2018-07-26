//
//  BYDeviceTool.m
//  OwnerLoan
//
//  Created by user on 2018/5/3.
//  Copyright © 2018年 user. All rights reserved.
//

#import "BYDeviceTool.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>
#import <CoreLocation/CoreLocation.h>

#define BY_CAMERAPOWER_MSG @"请在iPhone的“设置-隐私-相机”选项中，允许业主贷访问你的手机相机"
#define BY_LIBRARYPOWER_MSG @"请在iPhone的“设置-隐私-照片”选项中，允许业主贷访问你的手机照片"
#define BY_LOCATIONPOWER_MSG @"请在iPhone的“设置-隐私-定位”选项中，允许业主贷访问你的手机定位"


@implementation BYDeviceTool
//判断相机权限
+(BOOL)hasPowerOfCamera{

    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];// 获取对摄像头的访问权限。
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        [BYDeviceTool dealPowerWithMessage:BY_CAMERAPOWER_MSG];
        return NO;
    }else if(authStatus == AVAuthorizationStatusAuthorized){
        return YES;
    }else if (authStatus == AVAuthorizationStatusNotDetermined){
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                NSLog(@"Authorized");
            }else{
                NSLog(@"Denied or Restricted");
            }
        }];
        
        return NO;
    }
    
    return NO;
}

//判断相册权限
+(BOOL)hasPowerOfLibrary{
    
    PHAuthorizationStatus photoAuthorStatus = [PHPhotoLibrary authorizationStatus];
    if (photoAuthorStatus == PHAuthorizationStatusRestricted || photoAuthorStatus == PHAuthorizationStatusDenied) {
        [BYDeviceTool dealPowerWithMessage:BY_LIBRARYPOWER_MSG];
        return NO;
    }else if(photoAuthorStatus == PHAuthorizationStatusAuthorized){
        return YES;
    }else if (photoAuthorStatus ==PHAuthorizationStatusNotDetermined){
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (status == PHAuthorizationStatusAuthorized) {
                NSLog(@"Authorized");
            }else{
                NSLog(@"Denied or Restricted");
            }
        }];
        return NO;
    }
    return NO;
}


//判断定位权限
+(BOOL)hasPowerOfLocationWithMust:(BOOL)must{
    if ([CLLocationManager locationServicesEnabled]) {
        
        if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse||[CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
            
            return YES;
            
        }
        
    }
    if (must) {
        [BYDeviceTool dealPowerWithMessage:BY_LOCATIONPOWER_MSG];
    }
    return NO;
}

+(void)dealPowerWithMessage:(NSString *)message{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提醒" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *ensureAction = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:url];
        }
    }];
    [alertVC addAction:cancelAction];
    [alertVC addAction:ensureAction];
    
    //弹出
//    [[BYCommon shareBYCommon].rootVC presentViewController:alertVC animated:YES completion:NULL];
}

/**
 设置是否录入了指纹
 @return 指纹对象
 */
+(LAContext *)isCouldFingerprint:(NSString *)titleStr{
    
    //创建LAContext
    LAContext *context = [LAContext new]; //这个属性是设置指纹输入失败之后的弹出框的选项
    if (titleStr.length > 0) {
        context.localizedFallbackTitle = titleStr;
    }
    //    context.localizedReason = @"指纹识别原因";
    NSError *error = nil;
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                             error:&error]) {
        return context;
    }else{
        
        switch (error.code) {
            case LAErrorTouchIDNotEnrolled:
            {
                break;
            }
            case LAErrorPasscodeNotSet:
            {
                break;
            } case LAErrorTouchIDLockout: // 用户连续多次进行Touch ID验证失败，Touch ID被锁，需要用户输入密码解锁，先Touch ID验证密码
            {
                //                [context evaluatePolicy:LAPolicyDeviceOwnerAuthentication localizedReason:@"指纹解锁" reply:^(BOOL success, NSError * _Nullable error) {
                //                    if (success) {
                //
                //                    }else{
                //
                //                    }
                //                }];
                // -8 连续五次指纹识别错误，TouchID功能被锁定，下一次需要输入系统密码
                return context;
            }
                break;
            default:
            {
                
                break;
            }
        }
        
        return nil;
    }
}




@end
