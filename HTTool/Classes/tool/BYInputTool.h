//
//  BYInputTool.h
//  HTTool
//
//  Created by user on 2018/7/19.
//

#import <Foundation/Foundation.h>

@interface BYInputTool : NSObject


/**
 处理正在输入的手机号，按照334分割开
 @param textField 正在输入的输入框
 */
+(void)handleInputPhoneNum:(UITextField *)textField;


//*处理正在输入的手机号，按照344分割开
+(void)formatPhoneNumber:(UITextField*)textField;


/*处理正在输入的银行卡号，按照44444分割开
 */
+(void)formatBankCardNumber:(UITextField*)textField;
@end
