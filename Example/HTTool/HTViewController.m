//
//  HTViewController.m
//  HTTool
//
//  Created by abugtao@163.com on 06/28/2018.
//  Copyright (c) 2018 abugtao@163.com. All rights reserved.
//

#import "HTViewController.h"
#import "HTTool.h"
@interface HTViewController ()<UITextFieldDelegate>{
    NSString    *_previousTextFieldContent;
    UITextRange *_previousSelection;
}
@property (nonatomic,strong)UILabel *labe;
@property (nonatomic,strong)UITextField *textFiled;

@end

@implementation HTViewController


+(void)load{
    [NSObject by_swizzlingInClass:[self class] originSelector:@selector(touchesBegan:withEvent:) swizzledSelector:@selector(aa)];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton by_buttonWithFrame:CGRectMake(100, 100, 200, 40) bgColro:[UIColor yellowColor] textColor:[UIColor redColor] font:DiyFont(12) title:@"" boardColor:[UIColor greenColor] cornerRadius:20];
    [self.view addSubview:btn];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"你好",@"1",@"bb",@"2", nil];
    NSLog(@"%@",dic);
    
    
    UITextField *textF = [UITextField by_textFieldWithFrame:CGRectMake(100, 300, 200, 40) textColor:[UIColor grayColor] textFont:DiyFont(15) placeholder:@"反反复复" placeholderColor:[UIColor redColor] placeholderFont:DiyFont(12)];
    textF.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(change) name:UITextFieldTextDidChangeNotification object:NULL];
    textF.backgroundColor = [UIColor greenColor];
    [textF by_creatRightViewWithWidth:40 image:nil textStr:@"ff" textColor:[UIColor yellowColor] textFont:DiyFont(14)];
    [self.view addSubview:textF];
    
    self.textFiled = textF;
    
}
- (void)formatPhoneNumber:(UITextField*)textField
{
    NSUInteger targetCursorPosition = [textField offsetFromPosition:textField.beginningOfDocument
                       toPosition:textField.selectedTextRange.start];
    NSLog(@"targetCursorPosition:%li", (long)targetCursorPosition);
    // nStr表示不带空格的号码
    NSString* nStr = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString* preTxt = [_previousTextFieldContent stringByReplacingOccurrencesOfString:@" "
                                                                           withString:@""];
    
    char editFlag = 0;// 正在执行删除操作时为0，否则为1
    
    if (nStr.length <= preTxt.length) {
        editFlag = 0;
    }
    else {
        editFlag = 1;
    }
    
    // textField设置text
    if (nStr.length > 11)
    {
        textField.text = _previousTextFieldContent;
        textField.selectedTextRange = _previousSelection;
        return;
    }
    
    // 空格
    NSString* spaceStr = @" ";
    
    NSMutableString* mStrTemp = [NSMutableString new];
    int spaceCount = 0;
    if (nStr.length < 3 && nStr.length > -1)
    {
        spaceCount = 0;
    }else if (nStr.length < 7 && nStr.length >2)
    {
        spaceCount = 1;
        
    }else if (nStr.length < 12 && nStr.length > 6)
    {
        spaceCount = 2;
    }
    
    for (int i = 0; i < spaceCount; i++)
    {
        if (i == 0) {
            [mStrTemp appendFormat:@"%@%@", [nStr substringWithRange:NSMakeRange(0, 3)], spaceStr];
        }else if (i == 1)
        {
            [mStrTemp appendFormat:@"%@%@", [nStr substringWithRange:NSMakeRange(3, 4)], spaceStr];
        }else if (i == 2)
        {
            [mStrTemp appendFormat:@"%@%@", [nStr substringWithRange:NSMakeRange(7, 4)], spaceStr];
        }
    }
    
    if (nStr.length == 11)
    {
        [mStrTemp appendFormat:@"%@%@", [nStr substringWithRange:NSMakeRange(7, 4)], spaceStr];
    }
    
    if (nStr.length < 4)
    {
        [mStrTemp appendString:[nStr substringWithRange:NSMakeRange(nStr.length-nStr.length % 3,
                                                                    nStr.length % 3)]];
    }else if(nStr.length > 3)
    {
        NSString *str = [nStr substringFromIndex:3];
        [mStrTemp appendString:[str substringWithRange:NSMakeRange(str.length-str.length % 4,
                                                                   str.length % 4)]];
        if (nStr.length == 11)
        {
            [mStrTemp deleteCharactersInRange:NSMakeRange(13, 1)];
        }
    }
    NSLog(@"=======mstrTemp=%@",mStrTemp);
    
    textField.text = mStrTemp;
    // textField设置selectedTextRange
    NSUInteger curTargetCursorPosition = targetCursorPosition;// 当前光标的偏移位置
    if (editFlag == 0)
    {
        //删除
        if (targetCursorPosition == 9 || targetCursorPosition == 4)
        {
            curTargetCursorPosition = targetCursorPosition - 1;
        }
    }
    else {
        //添加
        if (nStr.length == 8 || nStr.length == 3)
        {
            curTargetCursorPosition = targetCursorPosition + 1;
        }
    }
    
    UITextPosition *targetPosition = [textField positionFromPosition:[textField beginningOfDocument]
                                                              offset:curTargetCursorPosition];
    [textField setSelectedTextRange:[textField textRangeFromPosition:targetPosition
                                                         toPosition :targetPosition]];
    
    
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    _previousTextFieldContent = textField.text;
    _previousSelection = textField.selectedTextRange;
    
    return YES;
}
- (void)change{
    [BYInputTool formatBankCardNumber:self.textFiled];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.labe moveBy:CGPointMake(10, 6)];
}

- (void)aa{
    NSLog(@"aaaa");
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
