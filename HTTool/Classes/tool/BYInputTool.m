//
//  BYInputTool.m
//  HTTool
//
//  Created by user on 2018/7/19.
//

#import "BYInputTool.h"

@implementation BYInputTool
/**
 处理正在输入的手机号，按照344分割开
 */
static NSInteger num = 0;
+(void)handleInputPhoneNum:(UITextField *)textField{
    
    if (textField.text.length > num) {
        if (textField.text.length == 4 || textField.text.length == 9 ) {//输入
            NSMutableString * str = [[NSMutableString alloc ] initWithString:textField.text];
            [str insertString:@" " atIndex:(textField.text.length-1)];
            textField.text = str;
        }
        if (textField.text.length >= 13 ) {//输入完成
            textField.text = [textField.text substringToIndex:13];
            //            [textField resignFirstResponder];
        }
        num = textField.text.length;
        
    }else if (textField.text.length < num){//删除
        if (textField.text.length == 4 || textField.text.length == 9) {
            textField.text = [textField.text substringToIndex:(textField.text.length-1)];
        }
        
        num = textField.text.length;
    }
}

/*处理正在输入的手机号，按照344分割开
 */
static NSInteger num2 = 0;
+(void)formatPhoneNumber:(UITextField*)textField
{
    NSUInteger targetCursorPosition = [textField offsetFromPosition:textField.beginningOfDocument
                                                         toPosition:textField.selectedTextRange.start];
    // nStr表示不带空格的号码
    NSString* nStr = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // 正在执行删除操作时为0，否则为1
    char editFlag = 0;
    if (textField.text.length < num2) {
        editFlag = 0;
    }else {
        editFlag = 1;
    }
    
    NSMutableString* mStrTemp = [NSMutableString new];
    for (int j=0; j<nStr.length; j++) {
        [mStrTemp appendString:[nStr substringWithRange:NSMakeRange(j, 1)]];
        if (j==2||j==6) {
            [mStrTemp appendString:@" "];
        }
    }
    textField.text = mStrTemp;
    //如果超出了截取
    if (mStrTemp.length>13) {
        textField.text = [mStrTemp substringToIndex:13];
    }
    num2 = textField.text.length;
    
    
    // textField设置selectedTextRange
    NSUInteger curTargetCursorPosition = targetCursorPosition;// 当前光标的偏移位置
    if (curTargetCursorPosition>=14) {
        curTargetCursorPosition=13;
    }
    if (editFlag == 0){
        //删除
        if (targetCursorPosition == 9 || targetCursorPosition == 4)
        {
            curTargetCursorPosition = targetCursorPosition - 1;
        }
    }else {
        //添加
        if (nStr.length == 7 || nStr.length == 3)
        {
            curTargetCursorPosition = targetCursorPosition + 1;
        }
    }
    UITextPosition *targetPosition = [textField positionFromPosition:[textField beginningOfDocument]
                                                              offset:curTargetCursorPosition];
    [textField setSelectedTextRange:[textField textRangeFromPosition:targetPosition
                                                         toPosition :targetPosition]];
}



/*处理正在输入的银行卡号，按照44444分割开
 */
static NSInteger num3 = 0;
+(void)formatBankCardNumber:(UITextField*)textField
{
    NSUInteger targetCursorPosition = [textField offsetFromPosition:textField.beginningOfDocument
                                                         toPosition:textField.selectedTextRange.start];
    // nStr表示不带空格的号码
    NSString* nStr = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // 正在执行删除操作时为0，否则为1
    char editFlag = 0;
    if (textField.text.length < num3) {
        editFlag = 0;
    }else {
        editFlag = 1;
    }
    
    NSMutableString* mStrTemp = [NSMutableString new];
    for (int j=0; j<nStr.length; j++) {
        [mStrTemp appendString:[nStr substringWithRange:NSMakeRange(j, 1)]];
        if ((j+1)%4==0) {
            [mStrTemp appendString:@" "];
        }
    }
    textField.text = mStrTemp;
    //如果超出了截取
    if (mStrTemp.length>24) {
        textField.text = [mStrTemp substringToIndex:24];
    }
    num3 = textField.text.length;
    
    
    // textField设置selectedTextRange
    NSUInteger curTargetCursorPosition = targetCursorPosition;// 当前光标的偏移位置
    if (curTargetCursorPosition>=25) {
        curTargetCursorPosition=24;
    }
    if (editFlag == 0){
        //删除
        if (targetCursorPosition%5==0)
        {
            curTargetCursorPosition = targetCursorPosition - 1;
        }
    }else {
        //添加
        if (nStr.length%4==0)
        {
            curTargetCursorPosition = targetCursorPosition + 1;
        }
    }
    UITextPosition *targetPosition = [textField positionFromPosition:[textField beginningOfDocument]
                                                              offset:curTargetCursorPosition];
    [textField setSelectedTextRange:[textField textRangeFromPosition:targetPosition
                                                         toPosition :targetPosition]];
}
@end
